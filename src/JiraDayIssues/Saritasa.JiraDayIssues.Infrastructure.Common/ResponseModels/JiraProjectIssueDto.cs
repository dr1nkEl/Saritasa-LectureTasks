namespace Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

/// <summary>
/// Project issue.
/// </summary>
public class JiraProjectIssueDto
{
    /// <summary>
    /// Key.
    /// </summary>
    public string Key { get; init; }

    /// <summary>
    /// Issue fields.
    /// </summary>
    public JiraIssueFieldDto Fields { get; init; }
}
