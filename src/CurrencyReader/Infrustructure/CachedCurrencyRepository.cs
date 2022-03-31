using Saritasa.CurrencyReader.Domain;
using Saritasa.CurrencyReader.Domain.Entities;
using Saritasa.CurrencyReader.Infrastructure.Abstractions;

namespace Saritasa.CurrencyReader.Infrastructure;

/// <inheritdoc/>
public sealed record CachedCurrencyRepository : ICurrencyRepository
{
    private readonly ICurrencyRepository currencyRepository;
    private readonly ICache<Currency> cache;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="decoratedRepository">Wrapped repository.</param>
    /// <param name="cache">Cache service.</param>
    public CachedCurrencyRepository(ICache<Currency> cache, Constants constants)
    {
        currencyRepository = new FileCurrencyRepository(constants);
        this.cache = cache;
    }

    /// <inheritdoc/>
    public Currency GetCurrency(DateTime date)
    {
        var currency = cache.Get(date);
        if (currency == null)
        {
            currency = currencyRepository.GetCurrency(date);
            cache.Set(currency);
        }

        return currency;
    }
}
