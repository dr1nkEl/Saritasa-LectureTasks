using System.Text.Json.Serialization;

namespace Saritasa.OMDBScrubber.Domain;

/// <summary>
/// Movie.
/// </summary>
public class Movie
{
    /// <summary>
    /// Primary Key.
    /// </summary>
    public int Id { get; init; }

    /// <summary>
    /// IMDB id.
    /// </summary>
    public string ImdbId { get; init; }

    /// <summary>
    /// Title.
    /// </summary>
    public string Title { get; init; }

    /// <summary>
    /// Genre.
    /// </summary>
    public List<string> Genre { get; init; }

    /// <summary>
    /// Release date.
    /// </summary>
    public DateOnly ReleaseDate { get; init; }

    /// <summary>
    /// Duration.
    /// </summary>
    public int Duration { get; init; }

    /// <summary>
    /// IMDB rating.
    /// </summary>
    public decimal ImdbRating { get; init; }

    /// <summary>
    /// Created at.
    /// </summary>
    public DateTime CreatedAt { get; init; }

    /// <summary>
    /// Actors of movie.
    /// </summary>
    public IList<Actor> Actors { get; set; } = new List<Actor>();
}