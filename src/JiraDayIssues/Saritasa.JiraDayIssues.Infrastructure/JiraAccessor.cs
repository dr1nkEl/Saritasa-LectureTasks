using NLog;
using RestSharp;
using RestSharp.Authenticators;
using Saritasa.JiraDayIssues.Domain.Entities;
using Saritasa.JiraDayIssues.Infrastructure.Abstractions;
using Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

namespace Saritasa.JiraDayIssues.Infrastructure;

/// <inheritdoc/>
public sealed class JiraAccessor : IJiraAccessor
{
    private const string Url = "https://saritasa.atlassian.net/rest/api/3";
    private readonly RestClient jiraClient;
    private readonly Logger logger;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="credentials">Authorization credentials.</param>
    public JiraAccessor(JiraAuthorizationCredentials credentials)
    {
        this.jiraClient = GetConfiguredJiraRestClient(credentials);
        this.logger = LogManager.GetCurrentClassLogger();
    }

    /// <inheritdoc/>
    public async Task<JiraAccountDto> GetLoggedAccountAsync(CancellationToken token)
    {
        token.ThrowIfCancellationRequested();
        logger.Trace("Jira get authorized account");
        return await jiraClient.GetAsync<JiraAccountDto>(new RestRequest($"{Url}/myself"));
    }

    /// <inheritdoc/>
    public async Task<IEnumerable<JiraProjectIssueDto>> GetProjects(IEnumerable<string> keys, CancellationToken token)
    {
        var responses = new List<JiraProjectIssueDto>();

        foreach (var key in keys.Distinct())
        {
            token.ThrowIfCancellationRequested();

            var issueRequest = new RestRequest($"{Url}/issue/{key}");

            logger.WithProperty("key", key).Trace("Jira get project issue");

            responses.Add(await jiraClient.GetAsync<JiraProjectIssueDto>(issueRequest));
        }

        return responses;
    }

    private static RestClient GetConfiguredJiraRestClient(JiraAuthorizationCredentials credentials)
    {
        return new RestClient() { Authenticator = new HttpBasicAuthenticator(credentials.UserName, credentials.Token) };
    }
}
