using Saritasa.OMDBScrubber.Domain;
using Saritasa.OMDBScrubber.UseCases.Models;
using Saritasa.Tools.Common.Pagination;
using System.Collections.ObjectModel;

namespace Saritasa.OMDBScrubber.WEB.ViewModels;

/// <summary>
/// Omdb list view model.
/// </summary>
public class OMDBListViewModel
{
    /// <summary>
    /// Page.
    /// </summary>
    public PagedList<Movie> Page { get; set; } = new PagedList<Movie>(new Collection<Movie>(), 1, 1, 1);

    /// <summary>
    /// Search properties.
    /// </summary>
    public SearchProperties SearchProperties { get; set; } = new();
}
