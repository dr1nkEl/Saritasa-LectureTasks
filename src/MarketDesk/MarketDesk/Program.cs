namespace MarketDesk;

using CLI.Commands;
using McMaster.Extensions.CommandLineUtils;
using Microsoft.Extensions.DependencyInjection;
using Models;
using System;
using System.Linq;

/// <summary>
/// Main project class.
/// </summary>
[Subcommand(typeof(RmOrderCommand))]
[Subcommand(typeof(LsOrderCommand))]
[Subcommand(typeof(AddOrderCommand))]
[Subcommand(typeof(BillOrderCommand))]
[HelpOption("--help")]
internal class Program
{
    /// <summary>
    /// Main project method.
    /// App starts from here.
    /// </summary>
    public static void Main()
    {
        var app = GetConfiguredApplication();

        while (true)
        {
            var entryValues = Prompt.GetString("Input command or orderitem line", defaultValue: string.Empty)
            .Split(new char[] { ' ', ',' }, StringSplitOptions.RemoveEmptyEntries);

            if (!entryValues.Any())
            {
                Console.WriteLine(" \"--help\" for available commands.");
                continue;
            }

            try
            {
                app.Execute(entryValues);
            }
            catch (CommandParsingException exc)
            {
                Console.WriteLine(exc.Message);
            }
            catch (ArgumentException exc)
            {
                Console.WriteLine(exc.Message);
            }
        }
    }

    private static CommandLineApplication<Program> GetConfiguredApplication()
    {
        var order = new Order();
        var services = new ServiceCollection()
                .AddSingleton(order)
                .AddSingleton(PhysicalConsole.Singleton)
                .BuildServiceProvider();

        var app = new CommandLineApplication<Program>();
        app.Conventions
            .UseDefaultConventions()
            .UseConstructorInjection(services);
        return app;
    }
}
