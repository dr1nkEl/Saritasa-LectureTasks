using MediatR;
using Microsoft.AspNetCore.Mvc;
using Saritasa.OMDBScrubber.Domain;
using Saritasa.OMDBScrubber.UseCases.Models;
using Saritasa.OMDBScrubber.UseCases.Queries;
using Saritasa.Tools.Common.Pagination;
using Saritasa.Tools.Domain.Exceptions;
using Saritasa.Tools.EFCore.Pagination;
using Swashbuckle.AspNetCore.Annotations;
using System.ComponentModel.DataAnnotations;
using System.Text.Json;

namespace Saritasa.OMDBScrubber.WEB.Controllers;

/// <summary>
/// OMDB API controller.
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class OMDBApiController : ControllerBase
{
    private readonly IMediator mediator;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="mediator">Mediator.</param>
    public OMDBApiController(IMediator mediator)
    {
        this.mediator = mediator;
    }

    /// <summary>
    /// Puts movies with given ids to db.
    /// </summary>
    /// <param name="ids">Movie ids.</param>
    /// <param name="cancellationToken">Cancellation token.</param>
    /// <returns>Task.</returns>
    /// <response code="200">If everything OK.</response>
    [SwaggerResponse(StatusCodes.Status200OK)]
    [HttpPost("{ids}")]
    public async Task<IActionResult> Upload([RegularExpression(@"^(\w+)(,\s*\w+)*$")] string ids, CancellationToken cancellationToken= default)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest();
        }
        try
        {
            await mediator.Send(new ImportImdbMoviesInfoQuery() { Ids = ids.Split(',', StringSplitOptions.RemoveEmptyEntries) }, cancellationToken);
        }
        catch (InfrastructureException)
        {
            return BadRequest();
        }

        return new StatusCodeResult(200);
    }

    /// <summary>
    /// Method to get movies which mathes properties.
    /// </summary>
    /// <param name="searchProps">Search properties.</param>
    /// <param name="page">Page.</param>
    /// <param name="cancellationToken">Cancellation token.</param>
    /// <returns>Movies which matches properties.</returns>
    /// <response code="400">If user input is incorrect.</response>
    /// <response code="200">If everything OK.</response>
    [Produces("application/json")]
    [SwaggerResponse(StatusCodes.Status400BadRequest)]
    [SwaggerResponse(StatusCodes.Status200OK)]
    [HttpGet]
    public async Task<ActionResult<PagedListMetadataDto<Movie>>> Index(
        [FromQuery]SearchProperties searchProps,
        [FromQuery]int page = 1,
        CancellationToken cancellationToken = default)
    {
        if (!ModelState.IsValid || page<1)
        {
            return BadRequest();
        }

        var paginatedPage = await mediator.Send(new GetPaginatedMoviesQuery(searchProps, page), cancellationToken);

        return Ok(paginatedPage.ToMetadataObject());
    }
}
