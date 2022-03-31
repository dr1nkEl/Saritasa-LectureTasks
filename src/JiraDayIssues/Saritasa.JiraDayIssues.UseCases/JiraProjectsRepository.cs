using NLog;
using Saritasa.JiraDayIssues.Domain.Entities;
using Saritasa.JiraDayIssues.Infrastructure.Abstractions;
using Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

namespace Saritasa.JiraDayIssues.UseCases;

/// <summary>
/// Class to get jira projects.
/// </summary>
public sealed class JiraProjectsRepository
{
    private readonly IJiraAccessor jiraAccessor;
    private readonly ITempoAccessor tempoAccessor;
    private readonly Logger logger;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="jiraAccessor">Jira accessor.</param>
    /// <param name="tempoAccessor">Tempo accessor.</param>
    public JiraProjectsRepository(IJiraAccessor jiraAccessor, ITempoAccessor tempoAccessor)
    {
        this.jiraAccessor = jiraAccessor;
        this.tempoAccessor = tempoAccessor;
        this.logger = LogManager.GetCurrentClassLogger();
    }

    /// <summary>
    /// Method to get projects with their tasks and worklog of tasks.
    /// </summary>
    /// <param name="date">Date to look projects worked on certain date.</param>
    /// <returns>Projects worked on certain date.</returns>
    /// <exception cref="OperationCanceledException">Thrown if canceled.</exception>
    public async Task<IEnumerable<Project>> GetProjectsAsync(DateTime date, CancellationToken token)
    {
        token.ThrowIfCancellationRequested();

        var account = await jiraAccessor.GetLoggedAccountAsync(token);

        logger.Info("Get Issues and Worklogs for user {displayName} and date {date:yyyy-MM-dd}",
            account.DisplayName, date);

        var worklogItems = await tempoAccessor.GetWorklogItems(date, account.AccountId, offset: 0, token);

        var jiraProjects = await jiraAccessor.GetProjects(worklogItems.Select(x=>x.Issue.Key), token);

        var result = MatchProjectsAndWorklogs(worklogItems, jiraProjects);

        return result;
    }

    private static IEnumerable<Project> MatchProjectsAndWorklogs(IEnumerable<TempoWorklogItemDto> worklogs, IEnumerable<JiraProjectIssueDto> projectIssues)
    {
        var list = new List<Project>();

        foreach (var projectName in projectIssues.Select(x=>x.Fields.Project.Name).Distinct())
        {
            var curProjectIssues = projectIssues.Where(x => x.Fields.Project.Name == projectName);

            var issues = new List<Issue>(curProjectIssues.Select(projectIssue =>
            {
                var curWorklogs = worklogs.Where(y => y.Issue.Key == projectIssue.Key);

                return new Issue()
                {
                    Key = projectIssue.Key,
                    TimeEstimated = TimeSpan.FromSeconds(projectIssue.Fields.TimeTracking.OriginalEstimateSeconds),
                    TimeSpent = TimeSpan.FromSeconds(curWorklogs.Sum(x => x.TimeSpentSeconds)),
                    Worklog = curWorklogs.Select(y => new Worklog() { Description = y.Description, TimeSpent = TimeSpan.FromSeconds(y.TimeSpentSeconds) })
                };
            }));

            var project = new Project()
            {
                Name = projectName,
                Issues = issues
            };

            list.Add(project);
        }

        return list.Distinct();
    }
}
