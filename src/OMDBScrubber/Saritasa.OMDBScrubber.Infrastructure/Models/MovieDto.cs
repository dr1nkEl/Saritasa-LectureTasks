using System.Text.Json.Serialization;

namespace Saritasa.OMDBScrubber.Infrastructure.Models;

/// <summary>
/// Movie dto.
/// </summary>
internal class MovieDto
{
    /// <summary>
    /// Title.
    /// </summary>
    public string Title { get; init; }

    /// <summary>
    /// Release date.
    /// </summary>
    [JsonPropertyName("Released")]
    public DateOnly ReleaseDate { get; init; }

    /// <summary>
    /// Duration.
    /// </summary>
    [JsonPropertyName("RunTime")]
    public string Duration { get; init; }

    /// <summary>
    /// Genre.
    /// </summary>
    public string Genre { get; init; }

    /// <summary>
    /// Actors.
    /// </summary>
    public string Actors { get; init; }

    /// <summary>
    /// Imbd rating.
    /// </summary>
    public decimal ImdbRating { get; init; }

    /// <summary>
    /// Imbd id.
    /// </summary>
    public string ImdbID { get; init; }
}