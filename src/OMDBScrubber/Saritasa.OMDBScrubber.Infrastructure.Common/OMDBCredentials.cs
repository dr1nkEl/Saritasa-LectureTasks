namespace Saritasa.OMDBScrubber.Infrastructure.Common;

/// <summary>
/// OMDB api credentials.
/// </summary>
public class OMDBCredentials
{
    /// <summary>
    /// Api token.
    /// </summary>
    public string ApiToken { get; }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="apiToken">Token.</param>
    public OMDBCredentials(string apiToken)
    {
        ApiToken = apiToken;
    }
}
