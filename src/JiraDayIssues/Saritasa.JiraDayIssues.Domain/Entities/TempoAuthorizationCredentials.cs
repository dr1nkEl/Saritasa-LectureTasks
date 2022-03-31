namespace Saritasa.JiraDayIssues.Domain.Entities;

/// <summary>
/// Credentials of Jira authorization.
/// </summary>
public class TempoAuthorizationCredentials
{
    /// <summary>
    /// Token.
    /// </summary>
    public string Token { get; }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="token">Token for authorization.</param>
    public TempoAuthorizationCredentials(string token)
    {
        this.Token = token;
    }
}
