using Saritasa.OMDBScrubber.Domain;
using Saritasa.OMDBScrubber.Infrastructure.Common.ResponseModels;

namespace Saritasa.OMDBScrubber.Infrastructure.Abstractions;

/// <summary>
/// Movie accessor abstraction.
/// </summary>
public interface IMovieService
{
    /// <summary>
    /// Gets multiple movies with given ids.
    /// </summary>
    /// <param name="ids">Movie ids.</param>
    /// <returns>Movies.</returns>
    Task<IEnumerable<MovieDto>> GetAsync(IEnumerable<string> ids, CancellationToken cancellationToken);

    /// <summary>
    /// Matches movie dto to movie domain model.
    /// </summary>
    /// <param name="movieDtos">Movie DTO.</param>
    /// <returns>Movie.</returns>
    Movie ConvertMovieDtoToMovie(MovieDto movieDto);
}
