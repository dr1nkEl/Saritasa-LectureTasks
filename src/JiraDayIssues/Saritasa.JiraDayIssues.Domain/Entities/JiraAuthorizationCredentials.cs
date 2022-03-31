namespace Saritasa.JiraDayIssues.Domain.Entities;

/// <summary>
/// Credentials of Jira authorization.
/// </summary>
public class JiraAuthorizationCredentials
{
    /// <summary>
    /// Username.
    /// </summary>
    public string UserName { get; }

    /// <summary>
    /// Token.
    /// </summary>
    public string Token { get; }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="userName">Username to authorize.</param>
    /// <param name="token">Token for authorization.</param>
    public JiraAuthorizationCredentials(string userName, string token)
    {
        this.UserName = userName;
        this.Token = token;
    }
}
