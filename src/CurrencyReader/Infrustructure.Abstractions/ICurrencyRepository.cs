using Saritasa.CurrencyReader.Domain.Entities;

namespace Saritasa.CurrencyReader.Infrastructure.Abstractions;

/// <summary>
/// Interface to access currencies.
/// </summary>
public interface ICurrencyRepository
{
    /// <summary>
    /// Method to get currency by specific date.
    /// </summary>
    /// <param name="date">Date to look currency on.</param>
    /// <returns>Currency on given date.</returns>
    /// <exception cref="CurrencyNotFoundException">If currency for given date is not found being thrown.</exception>
    /// <exception cref="FileFormatException">If file didnt contain correct currency format being thrown.</exception>
    Currency GetCurrency(DateTime date);
}
