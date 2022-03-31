namespace Saritasa.OMDBScrubber.Infrastructure.Common.ResponseModels;

/// <summary>
/// Movie dto.
/// </summary>
public class MovieDto
{
    /// <summary>
    /// Title.
    /// </summary>
    public string Title { get; init; }

    /// <summary>
    /// Release date.
    /// </summary>
    public DateOnly ReleaseDate { get; init; }

    /// <summary>
    /// Duration.
    /// </summary>
    public int Duration { get; init; }

    /// <summary>
    /// Genre.
    /// </summary>
    public IEnumerable<string> Genre { get; init; } = Enumerable.Empty<string>();

    /// <summary>
    /// Actors.
    /// </summary>
    public IEnumerable<ActorDto> Actors { get; init; } = Enumerable.Empty<ActorDto>();

    /// <summary>
    /// Imbd rating.
    /// </summary>
    public decimal ImdbRating { get; init; }

    /// <summary>
    /// Imbd id.
    /// </summary>
    public string ImdbID { get; init; }
}
