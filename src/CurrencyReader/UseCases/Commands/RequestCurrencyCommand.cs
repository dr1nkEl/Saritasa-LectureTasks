using McMaster.Extensions.CommandLineUtils;
using Newtonsoft.Json;
using Saritasa.CurrencyReader.Domain.Entities;
using Saritasa.CurrencyReader.Domain.Exceptions;
using Saritasa.CurrencyReader.Infrastructure.Abstractions;
using System.ComponentModel.DataAnnotations;

namespace Saritasa.CurrencyReader.UseCases.Commands;

/// <summary>
/// Command to proccess currency on date request.
/// </summary>
[Command(name: "get", ExtendedHelpText = "Getting a date. E.g. \"get 2010-10-10\"")]
public class RequestCurrencyCommand
{
    private readonly IConsole console;
    private readonly ICurrencyRepository repository;

    [Required]
    [Argument(0, Description ="Date of currency")]
    private IEnumerable<string> Dates { get; set; } = Array.Empty<string>();

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="console">Abstraction to print execution result.</param>
    /// <param name="repository">Currency repository.</param>
    public RequestCurrencyCommand(IConsole console, ICurrencyRepository repository)
    {
        this.console = console;
        this.repository = repository;
    }

    /// <summary>
    /// Command execution method.
    /// Print formatted currency or shows message if something went wrong.
    /// </summary>
    public void OnExecute()
    {
        foreach (var curDate in Dates)
        {
            if (DateTime.TryParse(curDate, out DateTime date))
            {
                try
                {
                    console.WriteLine(FormatCurrency(repository.GetCurrency(date)));
                }
                catch (CurrencyNotFoundException exc)
                {
                    console.WriteLine(exc.Message);
                }
                catch (JsonException exc)
                {
                    console.WriteLine(exc.Message);
                }
            }
            else
            {
                console.WriteLine("Incorrect format of: " + curDate);
            }
        }
    }

    private static string FormatCurrency(Currency currency)
    {
        return string.Format("On {0} RUB: {1}, EUR{2}",
            currency.Date.ToString("dd-MM-yyyy"), currency.RUB, currency.EUR);
    }
}
