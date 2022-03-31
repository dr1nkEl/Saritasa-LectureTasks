using Saritasa.CurrencyReader.Domain.Entities;

namespace Saritasa.CurrencyReader.Infrastructure.Abstractions;

/// <summary>
/// Storing files inside himself.
/// </summary>
/// <typeparam name="T">Type of stored items.</typeparam>
public interface ICache<T> where T : Currency
{
    /// <summary>
    /// Method to get item from cache.
    /// </summary>
    /// <param name="key">Date of currency.</param>
    /// <returns>Currency or null if not found.</returns>
    T? Get(DateTime key);

    /// <summary>
    /// Method to cache item.
    /// </summary>
    /// <param name="value">Item to be cached.</param>
    void Set(T value);
}
