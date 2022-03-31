using System.ComponentModel.DataAnnotations;

namespace Saritasa.OMDBScrubber.UseCases.Models;

/// <summary>
/// Search properties.
/// </summary>
public class SearchProperties
{
    /// <summary>
    /// Rating.
    /// </summary>
    [Range(0, 10)]
    public decimal? Rating { get; init; }

    /// <summary>
    /// Mins above.
    /// </summary>
    [Range(0, int.MaxValue)]
    public int? MinsAbove { get; init; }

    /// <summary>
    /// Mins below.
    /// </summary>
    [Range(0, int.MaxValue)]
    public int? MinsBelow { get; init; }

    /// <summary>
    /// Actor.
    /// </summary>
    public string? Actor { get; init; }
}
