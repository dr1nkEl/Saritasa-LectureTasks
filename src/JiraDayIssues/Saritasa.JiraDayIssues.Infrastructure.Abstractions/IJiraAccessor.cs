using Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

namespace Saritasa.JiraDayIssues.Infrastructure.Abstractions;

/// <summary>
/// Abstraction to access Jira.
/// </summary>
public interface IJiraAccessor
{
    /// <summary>
    /// Method to get project issues.
    /// </summary>
    /// <param name="keys">Keys of projects.</param>
    /// <returns>Project issues.</returns>
    /// <exception cref="OperationCanceledException">Thrown if canceled.</exception>
    Task<IEnumerable<JiraProjectIssueDto>> GetProjects(IEnumerable<string> keys, CancellationToken token);

    /// <summary>
    /// Get logged account.
    /// </summary>
    /// <returns>Account.</returns>
    /// <exception cref="OperationCanceledException">Thrown if canceled.</exception>
    Task<JiraAccountDto> GetLoggedAccountAsync(CancellationToken token);
}
