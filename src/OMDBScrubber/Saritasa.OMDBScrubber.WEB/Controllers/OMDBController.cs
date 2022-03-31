using MediatR;
using Microsoft.AspNetCore.Mvc;
using Saritasa.OMDBScrubber.UseCases.Queries;
using Saritasa.OMDBScrubber.WEB.ViewModels;
using Saritasa.Tools.Domain.Exceptions;
using Saritasa.Tools.EFCore.Pagination;
using System.ComponentModel.DataAnnotations;

namespace Saritasa.OMDBScrubber.WEB.Controllers;

/// <summary>
/// OMDB Controller.
/// </summary>
public class OMDBController : Controller
{
    private const int PageSize = 2;
    private readonly IMediator mediator;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="mediator">Mediator.</param>
    public OMDBController(IMediator mediator)
    {
        this.mediator = mediator;
    }

    /// <summary>
    /// Method to get view of movie list.
    /// </summary>
    /// <param name="model">List view model.</param>
    /// <param name="page">Current page.</param>
    /// <param name="cancellationToken">Cancellation token.</param>
    /// <returns>View.</returns>
    [HttpGet]
    public async Task<IActionResult> List(OMDBListViewModel model, int page=1, CancellationToken cancellationToken = default)
    {
        if (!ModelState.IsValid)
        {
            var errs = ModelState.Select(x => x.Value.Errors)
                               .Where(y => y.Count > 0);
            foreach (var errors in errs)
            {
                foreach (var error in errors)
                {
                    ModelState.AddModelError(string.Empty, error.ErrorMessage);
                }
            }
            return View(model);
        }

        model.Page = await mediator.Send(new GetPaginatedMoviesQuery(model.SearchProperties, page), cancellationToken);

        return View(model);
    }

    /// <summary>
    /// Method to upload movie view.
    /// </summary>
    /// <returns>View.</returns>
    [HttpGet]
    public IActionResult Upload()
    {
        return View();
    }

    /// <summary>
    /// Method to post movies.
    /// </summary>
    /// <param name="ids">Ids.</param>
    /// <returns>View.</returns>
    [HttpPost]
    public async Task<IActionResult> Upload([RegularExpression(@"^(\w+)(,\s*\w+)*$")] string ids, CancellationToken cancellationToken = default)
    {
        if (!ModelState.IsValid)
        {
            var errs = ModelState.Select(x => x.Value.Errors)
                               .Where(y => y.Count > 0);
            foreach (var errors in errs)
            {
                foreach (var error in errors)
                {
                    ModelState.AddModelError(string.Empty, error.ErrorMessage);
                }
            }
            return View();
        }

        try
        {
            await mediator.Send(new ImportImdbMoviesInfoQuery() { Ids = ids.Split(',', StringSplitOptions.RemoveEmptyEntries) }, cancellationToken);
            return LocalRedirect($"~/OMDB/{nameof(List)}");
        }
        catch (InfrastructureException)
        {
            return BadRequest();
        }
    }
}
