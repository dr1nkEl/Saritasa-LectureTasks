namespace Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

/// <summary>
/// Metadata.
/// </summary>
public class TempoMetadataDto
{
    /// <summary>
    /// Count.
    /// </summary>
    public int Count { get; init; }

    /// <summary>
    /// Offset.
    /// </summary>
    public int Offset { get; init; }

    /// <summary>
    /// Limit.
    /// </summary>
    public int Limit { get; init; }
}
