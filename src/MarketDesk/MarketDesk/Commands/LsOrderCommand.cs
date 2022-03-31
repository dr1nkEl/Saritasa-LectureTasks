namespace CLI.Commands;

using System;
using System.Linq;
using McMaster.Extensions.CommandLineUtils;
using Models;

/// <summary>
/// Command class responsible for showing orderitem from order.
/// </summary>
[HelpOption("--help")]
[Command(name: "ls")]
public class LsOrderCommand
{
    private readonly Order order;
    private readonly IConsole console;

    /// <summary>
    /// Method to get formatted orderitems list from given order.
    /// </summary>
    /// <param name="order">Requires order which from orderitems will be taken to show.</param>
    /// <returns>Formatted string.</returns>
    private static string Format(Order order)
    {
        return string.Join(Environment.NewLine, order.GetItems().Select((item, index)
            => $"{index + 1}.{item.Name}\t{item.Price} x {item.Amount}"));
    }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="order">Order on which operation will be executed.</param>
    /// <param name="console">Console implementation for logging.</param>
    public LsOrderCommand(Order order, IConsole console)
    {
        this.order = order;
        this.console = console;
    }

    /// <summary>
    /// Method acting on CommandLineApplication.Execute call.
    /// Cant be made static due to command attribute.
    /// </summary>
    public void OnExecute()
    {
        console.WriteLine(Format(order));
    }
}