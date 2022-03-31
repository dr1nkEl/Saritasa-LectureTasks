using Saritasa.CurrencyReader.Domain;
using Saritasa.CurrencyReader.Domain.Entities;
using Saritasa.CurrencyReader.Infrastructure.Abstractions;

namespace Saritasa.CurrencyReader.Infrastructure;

/// <inheritdoc/>
public class Cache : ICache<Currency>
{
    private readonly Constants constants;
    private readonly Queue<Currency> cached = new();

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="constants">App constants.</param>
    public Cache(Constants constants)
    {
        this.constants = constants;
    }

    /// <inheritdoc/>
    public Currency? Get(DateTime key)
    {
        return cached.FirstOrDefault(x => x.Date == key);
    }

    /// <inheritdoc/>
    public void Set(Currency value)
    {
        if (cached.Count == constants.CacheSize)
        {
            cached.Dequeue();
            cached.Enqueue(value);
        }
        else
        {
            cached.Enqueue(value);
        }
    }
}
