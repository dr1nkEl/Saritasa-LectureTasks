namespace Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

/// <summary>
/// Issue fields class.
/// </summary>
public class JiraIssueFieldDto
{
    /// <summary>
    /// Timetracking.
    /// </summary>
    public JiraTimeTrackingDto TimeTracking { get; init; }

    /// <summary>
    /// Project.
    /// </summary>
    public JiraProjectDto Project { get; init; }
}
