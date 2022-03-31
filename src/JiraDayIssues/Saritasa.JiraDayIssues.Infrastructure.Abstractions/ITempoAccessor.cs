using Saritasa.JiraDayIssues.Infrastructure.Common.ResponseModels;

namespace Saritasa.JiraDayIssues.Infrastructure.Abstractions;

/// <summary>
/// Abstraction to access Tempo.
/// </summary>
public interface ITempoAccessor
{
    /// <summary>
    /// Method to get worklog items.
    /// </summary>
    /// <param name="day">Day of worklogs.</param>
    /// <param name="offset">Request offset.</param>
    /// <param name="accountId">Account id to search worklogs off.</param>
    /// <returns>Worklog items DTO.</returns>
    /// <exception cref="OperationCanceledException">Thrown if canceled.</exception>
    Task<IEnumerable<TempoWorklogItemDto>> GetWorklogItems(DateTime day, string accountId, int offset, CancellationToken token);
}
