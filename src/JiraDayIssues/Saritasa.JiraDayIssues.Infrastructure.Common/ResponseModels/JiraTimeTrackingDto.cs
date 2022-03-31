namespace Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

/// <summary>
/// Timetracking.
/// </summary>
public class JiraTimeTrackingDto
{
    /// <summary>
    /// Time spent.
    /// </summary>
    public int TimeSpentSeconds { get; init; }

    /// <summary>
    /// Estimated time.
    /// </summary>
    public int OriginalEstimateSeconds { get; init; }
}
