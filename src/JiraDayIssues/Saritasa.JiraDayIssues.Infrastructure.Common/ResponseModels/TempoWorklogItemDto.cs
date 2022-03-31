namespace Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

/// <summary>
/// Worklog item.
/// </summary>
public class TempoWorklogItemDto
{
    /// <summary>
    /// Time spent.
    /// </summary>
    public int TimeSpentSeconds { get; init; }

    /// <summary>
    /// Description.
    /// </summary>
    public string Description { get; init; }

    /// <summary>
    /// Issue.
    /// </summary>
    public TempoWorklogIssueDto Issue { get; init; }

    /// <summary>
    /// Author.
    /// </summary>
    public TempoWorklogAuthorDto Author { get; init; }
}
