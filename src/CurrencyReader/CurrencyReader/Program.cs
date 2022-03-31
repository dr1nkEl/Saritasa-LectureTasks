using McMaster.Extensions.CommandLineUtils;
using Microsoft.Extensions.DependencyInjection;
using Saritasa.CurrencyReader.Domain;
using Saritasa.CurrencyReader.Infrastructure.Abstractions;
using Saritasa.CurrencyReader.UseCases.Commands;
using Saritasa.CurrencyReader.Infrastructure;
using Microsoft.Extensions.Configuration;
using Saritasa.CurrencyReader.Domain.Entities;
using Newtonsoft.Json;

namespace CLI;

/// <summary>
/// Main project class.
/// </summary>
[Command(UnrecognizedArgumentHandling = UnrecognizedArgumentHandling.StopParsingAndCollect, AllowArgumentSeparator = true)]
[Subcommand(typeof(RequestCurrencyCommand))]
[HelpOption("--help")]
internal class Program
{
    /// <summary>
    /// App starts from this method.
    /// </summary>
    public static void Main()
    {
        var app = GetConfiguredApplication();
        Console.WriteLine("Use \"--help\" for available commands.");
        while (true)
        {
            var input = Prompt.GetString("Entry dates")?.Split(new char[] { ' ', ',' }, StringSplitOptions.RemoveEmptyEntries);
            if (input != null)
            {
                try
                {
                    app.Execute(input);
                }
                catch (CommandParsingException exc)
                {
                    Console.WriteLine(exc.Message);
                }
                catch (InvalidOperationException exc)
                {
                    Console.WriteLine(exc.Message);
                }
                catch (FileFormatException exc)
                {
                    Console.WriteLine(exc.Message);
                }
                catch (JsonException exc)
                {
                    Console.WriteLine(exc.Message);
                }
            }
        }
    }

    private static CommandLineApplication<Program> GetConfiguredApplication()
    {
        var constants = GetAppConstants();

        var services = new ServiceCollection()
                .AddSingleton(PhysicalConsole.Singleton)
                .AddSingleton(constants)
                .AddSingleton(typeof(ICache<Currency>), typeof(Cache))
                .AddTransient(typeof(ICurrencyRepository), typeof(CachedCurrencyRepository))
                .BuildServiceProvider();

        var app = new CommandLineApplication<Program>();

        app.Conventions
            .UseDefaultConventions()
            .UseConstructorInjection(services);
        return app;
    }

    /// <summary>
    /// No exception handling here due to it will hide some exceptions on project runtime.
    /// So it better to show up immediately.
    /// </summary>
    /// <returns>App constants.</returns>
    private static Constants GetAppConstants()
    {
        var config = new ConfigurationBuilder()
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .Build();

        Constants constants = config.GetSection("Constants").Get<Constants>();

        if (constants.CurrenciesFilePath == null)
        {
            throw new ArgumentNullException(constants.CurrenciesFilePath);
        }

        if (constants.CacheSize <=0)
        {
            throw new ArgumentException(string.Format("Arguments cant be equal or less than zero: {0}", constants.CacheSize));
        }

        return constants;
    }
}
