using MediatR;
using Microsoft.EntityFrameworkCore;
using Saritasa.OMDBScrubber.Domain;
using Saritasa.OMDBScrubber.Infrastructure.Abstractions;
using Saritasa.OMDBScrubber.UseCases.Queries;
using Saritasa.Tools.Common.Pagination;
using Saritasa.Tools.EFCore.Pagination;

namespace Saritasa.OMDBScrubber.UseCases.QueriesHandler;

/// <summary>
/// Paginated Movies Query Handler.
/// </summary>
internal class GetPaginatedMoviesQueryHandler : IRequestHandler<GetPaginatedMoviesQuery, PagedList<Movie>>
{
    private readonly IStorageContext storageContext;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="storageContext">Storage context.</param>
    public GetPaginatedMoviesQueryHandler(IStorageContext storageContext)
    {
        this.storageContext = storageContext;
    }

    /// <inheritdoc/>.
    public async Task<PagedList<Movie>> Handle(GetPaginatedMoviesQuery request, CancellationToken cancellationToken)
    {
        var query = storageContext.Movies.AsQueryable();
        if (request.SearchProperties.MinsBelow != null)
        {
            query = query.Where(x => x.Duration < request.SearchProperties.MinsBelow);
        }

        if (request.SearchProperties.MinsAbove != null)
        {
            query = query.Where(x => x.Duration > request.SearchProperties.MinsAbove);
        }

        if (request.SearchProperties.Rating != null)
        {
            query = query.Where(x => x.ImdbRating > request.SearchProperties.Rating);
        }

        query = query.Include(x => x.Actors);

        if (request.SearchProperties.Actor != null)
        {
            query = query.Where(x => x.Actors.Select(x => x.Name).Any(x => x == request.SearchProperties.Actor));
        }

        var page = await EFPagedListFactory.FromSourceAsync(query, request.Page, request.PageSize, cancellationToken);

        return page;
    }
}
