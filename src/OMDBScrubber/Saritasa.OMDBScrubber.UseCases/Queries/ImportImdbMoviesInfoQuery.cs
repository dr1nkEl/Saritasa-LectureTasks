using MediatR;

namespace Saritasa.OMDBScrubber.UseCases.Queries;

/// <summary>
/// Import IMDB Movies Info Command class.
/// </summary>
public class ImportImdbMoviesInfoQuery : IRequest
{
    /// <summary>
    /// Ids.
    /// </summary>
    public IEnumerable<string> Ids { get; init; }
}
