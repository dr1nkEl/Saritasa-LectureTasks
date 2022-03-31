namespace Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

/// <summary>
/// Jira account dto.
/// </summary>
public class JiraAccountDto
{
    /// <summary>
    /// Account id.
    /// </summary>
    public string AccountId { get; init; }

    /// <summary>
    /// Email.
    /// </summary>
    public string EmailAddress { get; init; }

    /// <summary>
    /// Display name.
    /// </summary>
    public string DisplayName { get; init; }
}
