using NLog;
using RestSharp;
using Saritasa.JiraDayIssues.Domain.Entities;
using Saritasa.JiraDayIssues.Infrastructure.Abstractions;
using Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

namespace Saritasa.JiraDayIssues.Infrastructure;

/// <summary>
/// Class responsible for tempo api requests.
/// </summary>
public sealed class TempoAccessor : ITempoAccessor
{
    private const string Url = "https://api.tempo.io/core/3";
    private readonly RestClient tempoClient;
    private readonly Logger logger;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="credentials">Authorization credentials.</param>
    public TempoAccessor(TempoAuthorizationCredentials credentials)
    {
        tempoClient = GetConfiguredRestClient(credentials);
        this.logger = LogManager.GetCurrentClassLogger();
    }

    /// <inheritdoc/>
    public async Task<IEnumerable<TempoWorklogItemDto>> GetWorklogItems(DateTime day, string accountId, int offset, CancellationToken token)
    {
        token.ThrowIfCancellationRequested();
        logger.WithProperty("accountId", accountId).Trace("Getting tempo worklog items");

        var worklogRestRequest = GetConfiguredWorklogRequest(day, accountId, offset);

        var worklogResponse = await tempoClient.GetAsync<TempoWorklogResponseDto>(worklogRestRequest);

        if (worklogResponse.Metadata.Count == worklogResponse.Metadata.Limit)
        {
            worklogResponse.Worklog.AddRange(await GetWorklogItems(day, accountId, worklogResponse.Metadata.Offset + worklogResponse.Metadata.Limit, token));
        }

        return worklogResponse.Worklog;
    }

    private static RestClient GetConfiguredRestClient(TempoAuthorizationCredentials credentials)
    {
        var tempoClient = new RestClient();

        tempoClient.AddDefaultHeader("Authorization", $"Bearer {credentials.Token}");

        return tempoClient;
    }

    private static RestRequest GetConfiguredWorklogRequest(DateTime day, string accountId, int offset)
    {
        var worklogRestRequest = new RestRequest($"{Url}/worklogs/user/{accountId}");

        worklogRestRequest.AddParameter("from", day.ToString("yyyy-MM-dd"));
        worklogRestRequest.AddParameter("to", day.ToString("yyyy-MM-dd"));

        worklogRestRequest.AddParameter("offset", offset);

        return worklogRestRequest;
    }
}
