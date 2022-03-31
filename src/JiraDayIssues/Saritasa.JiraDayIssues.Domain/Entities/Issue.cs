namespace Saritasa.JiraDayIssues.Domain.Entities;

/// <summary>
/// Issue class.
/// </summary>
public class Issue
{
    /// <summary>
    /// Key.
    /// </summary>
    public string Key { get; init; }

    /// <summary>
    /// Time spent on issue.
    /// </summary>
    public TimeSpan TimeSpent { get; init; }

    /// <summary>
    /// Time estimated of issue.
    /// </summary>
    public TimeSpan TimeEstimated { get; init; }

    /// <summary>
    /// Worklog of issue.
    /// </summary>
    public IEnumerable<Worklog> Worklog { get; init; }
}
