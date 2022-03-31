using Newtonsoft.Json;
using Saritasa.CurrencyReader.Domain;
using Saritasa.CurrencyReader.Infrastructure.Abstractions;
using Saritasa.CurrencyReader.Domain.Entities;
using Saritasa.CurrencyReader.Domain.Exceptions;

namespace Saritasa.CurrencyReader.Infrastructure;

/// <inheritdoc/>
public class FileCurrencyRepository : ICurrencyRepository
{
    private readonly string currenciesFilePath;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="constants">Application constants recieved from DI.</param>
    public FileCurrencyRepository(Constants constants)
    {
        this.currenciesFilePath = constants.CurrenciesFilePath;
    }

    /// <inheritdoc/>
    public Currency GetCurrency(DateTime date)
    {
        IEnumerable<Currency> currencies = ReadCurrenciesFile();

        var currency = currencies.FirstOrDefault(x => x.Date == date);

        if (currency == null)
        {
            throw new CurrencyNotFoundException(date);
        }

        return currency;
    }

    private IEnumerable<Currency> ReadCurrenciesFile()
    {
        IEnumerable<Currency> currencies = new List<Currency>();
        using StreamReader file = File.OpenText(this.currenciesFilePath);
        using JsonReader reader = new JsonTextReader(file);
        var serializer = new JsonSerializer();
        var deserialized = serializer.Deserialize<IEnumerable<Currency>>(reader);
        if (deserialized == null)
        {
            throw new FileFormatException();
        }

        return deserialized;
    }
}
