namespace Saritasa.JiraDayIssues.Domain.Entities;

/// <summary>
/// Worklog class.
/// </summary>
public class Worklog
{
    /// <summary>
    /// Description.
    /// </summary>
    public string Description { get; init; }

    /// <summary>
    /// Time spent.
    /// </summary>
    public TimeSpan TimeSpent { get; init; }
}
