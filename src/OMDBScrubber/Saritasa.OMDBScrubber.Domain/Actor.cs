using System.Text.Json.Serialization;

namespace Saritasa.OMDBScrubber.Domain;

/// <summary>
/// Actor.
/// </summary>
public class Actor
{
    /// <summary>
    /// Primary key.
    /// </summary>
    public int Id { get; init; }

    /// <summary>
    /// Name.
    /// </summary>
    public string Name { get; init; }

    /// <summary>
    /// Movies of actor.
    /// </summary>
    [JsonIgnore]
    public IList<Movie> Movies { get; init; } = new List<Movie>();
}
