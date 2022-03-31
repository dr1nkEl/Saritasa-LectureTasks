using System.Text.Json.Serialization;

namespace Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

/// <summary>
/// Worklog response.
/// </summary>
public class TempoWorklogResponseDto
{
    /// <summary>
    /// Metadata.
    /// </summary>
    public TempoMetadataDto Metadata { get; init; }

    /// <summary>
    /// Worklog list.
    /// </summary>
    [JsonPropertyName("results")]
    public List<TempoWorklogItemDto> Worklog { get; init; }
}
