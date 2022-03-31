using MediatR;
using Microsoft.EntityFrameworkCore;
using Saritasa.OMDBScrubber.Infrastructure.Abstractions;
using Saritasa.OMDBScrubber.UseCases.Queries;

namespace Saritasa.OMDBScrubber.UseCases.QueriesHandler;

/// <summary>
/// Import IMDB Movies Info Command Handler class.
/// </summary>
internal class ImportImdbMoviesInfoQueryHandler : AsyncRequestHandler<ImportImdbMoviesInfoQuery>
{
    private readonly IStorageContext storageContext;
    private readonly IMovieService filmsAccessor;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="storageContext">Storage context.</param>
    /// <param name="filmsAccessor">Movie accessor.</param>
    public ImportImdbMoviesInfoQueryHandler(IStorageContext storageContext, IMovieService filmsAccessor)
    {
        this.storageContext = storageContext;
        this.filmsAccessor = filmsAccessor;
    }

    /// <inheritdoc/>.
    protected override async Task Handle(ImportImdbMoviesInfoQuery request, CancellationToken cancellationToken)
    {
        var contextMovieIds = await storageContext.Movies.Select(x => x.ImdbId).ToListAsync(cancellationToken);

        var movieDtos = (await filmsAccessor.GetAsync(request.Ids, cancellationToken)).Select(x=>filmsAccessor.ConvertMovieDtoToMovie(x)).Where(x => x.ImdbId != null);

        var movieIds = movieDtos
            .Where(m => m.ImdbId != null)
            .Select(m => m.ImdbId);

        var storedMovies = await storageContext.Movies
            .Where(m => movieIds.Contains(m.ImdbId))
            .Select(m => m.ImdbId)
            .ToListAsync(cancellationToken);

        var unstoredMovies = movieDtos
           .Where(m => !storedMovies.Contains(m.ImdbId));

        var existingActors = await storageContext.Actors.Select(x => x.Name).ToListAsync(cancellationToken);

        foreach (var movie in unstoredMovies)
        {
            var actors = movie.Actors;
            var actorsNames = actors.Select(x => x.Name);
            var storedActors = await storageContext.Actors.Where(x => actorsNames.Contains(x.Name)).ToListAsync(cancellationToken);
            var unstoredActors = actors.Where(x => !storedActors.Select(x=>x.Name).Contains(x.Name));

            foreach (var actor in storedActors)
            {
                var storedActor = movie.Actors.First(x => x.Name == actor.Name);
                movie.Actors.Remove(storedActor);
                movie.Actors.Add(actor);
            }

            storageContext.Movies.Add(movie);
        }

        await storageContext.SaveChangesAsync(cancellationToken);
    }
}
