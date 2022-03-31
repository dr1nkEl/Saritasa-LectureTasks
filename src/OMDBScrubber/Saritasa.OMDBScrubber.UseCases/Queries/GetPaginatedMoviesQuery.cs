using MediatR;
using Saritasa.OMDBScrubber.Domain;
using Saritasa.OMDBScrubber.UseCases.Models;
using Saritasa.Tools.Common.Pagination;

namespace Saritasa.OMDBScrubber.UseCases.Queries;

/// <summary>
/// Paginated movies query.
/// </summary>
public class GetPaginatedMoviesQuery : IRequest<PagedList<Movie>>
{
    /// <summary>
    /// Page.
    /// </summary>
    public int Page { get; }

    /// <summary>
    /// Page size.
    /// </summary>
    public int PageSize { get; }

    /// <summary>
    /// Search properties.
    /// </summary>
    public SearchProperties SearchProperties { get; }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="searchProperties">Search properties.</param>
    /// <param name="page">Page.</param>
    /// <param name="pageSize">Page size.</param>
    public GetPaginatedMoviesQuery(SearchProperties searchProperties, int page = 1, int pageSize = 50)
    {
        SearchProperties = searchProperties;
        Page = page;
        PageSize = pageSize;
    }
}
