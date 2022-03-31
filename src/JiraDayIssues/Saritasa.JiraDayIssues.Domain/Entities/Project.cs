namespace Saritasa.JiraDayIssues.Domain.Entities;

/// <summary>
/// Project class.
/// </summary>
public class Project
{
    /// <summary>
    /// Project name.
    /// </summary>
    public string Name { get; init; }

    /// <summary>
    /// Project issues.
    /// </summary>
    public IEnumerable<Issue> Issues { get; init; }
}
