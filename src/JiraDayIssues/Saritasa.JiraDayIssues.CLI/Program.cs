using McMaster.Extensions.CommandLineUtils;
using NLog;
using NLog.Config;
using Saritasa.JiraDayIssues.Domain.Entities;
using Saritasa.JiraDayIssues.Infrastructure;
using Saritasa.JiraDayIssues.UseCases;

namespace Saritasa.JiraDayIssues.CLI;

/// <summary>
/// Main application class
/// App starts from here.
/// </summary>
public class Program
{
    [Option("--date", Description = "Date to look tasks by. Current date by default.")]
    private DateTime Date { get; init; } = DateTime.Now;

    [Option("--username", Description = "Username.")]
    private string UserName { get; init; }

    [Option("--jtoken", Description = "Jira authorization token.")]
    private string JiraToken { get; init; }

    [Option("--ttoken", Description = "Tempo authorization token.")]
    private string TempoToken { get; init; }

    /// <summary>
    /// Main application method.
    /// </summary>
    /// <param name="args">Project start arguments.</param>
    public static async Task Main(string[] args)
    {
        await CommandLineApplication.ExecuteAsync<Program>(args);
    }

    private async Task OnExecuteAsync()
    {
        if (!IsValid())
        {
            Console.WriteLine("All fields except datetime are required!");
            return;
        }

        LogManager.Configuration = new XmlLoggingConfiguration("NLog.config");

        var logger = LogManager.GetCurrentClassLogger();

        try
        {
            var jira = new JiraAuthorizationCredentials(UserName, JiraToken);

            var tempo = new TempoAuthorizationCredentials(TempoToken);

            var jiraAccessor = new JiraAccessor(jira);

            var tempoAccesor = new TempoAccessor(tempo);

            var repository = new JiraProjectsRepository(jiraAccessor, tempoAccesor);

            PrintResults(await repository.GetProjectsAsync(Date, default));
        }
        catch (HttpRequestException exc)
        {
            logger
                .WithProperty("username", UserName)
                .Trace(exc.Message);
            Console.WriteLine(exc.Message);
        }
    }

    private bool IsValid()
    {
        if (this.UserName == null || this.TempoToken == null || this.JiraToken == null)
        {
            return false;
        }
        return true;
    }

    private static void PrintResults(IEnumerable<Project> projects)
    {
        Console.WriteLine();
        foreach (var project in projects)
        {
            Console.WriteLine("-------------------------------");
            Console.WriteLine(project.Name);
            foreach (var issue in project.Issues)
            {
                Console.WriteLine(string.Format("{0,-10} | {1, 5}h / {2,-1}h", issue.Key, issue.TimeSpent.Hours, issue.TimeEstimated.Hours));
            }
        }
        Console.WriteLine("-------------------------------");
        Console.WriteLine($"Total: {projects.Select(x => x.Issues.Select(y => y.TimeSpent.Hours).Sum()).Sum()}h");
    }
}
