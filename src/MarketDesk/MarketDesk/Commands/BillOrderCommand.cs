namespace CLI.Commands;

using McMaster.Extensions.CommandLineUtils;
using Models;
using System;

/// <summary>
/// Command class responsible for showing order bill.
/// </summary>
[HelpOption("--help")]
[Command(name: "bill")]
public class BillOrderCommand
{
    private readonly Order order;
    private readonly IConsole console;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="order">Order on which operation will be executed.</param>
    /// <param name="console">Console implementation to print in execution command.</param>
    public BillOrderCommand(Order order, IConsole console)
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
        var bill = order.GetBill();
        console.WriteLine($"Total: ${bill.WithoutTaxes}"
            + $"{Environment.NewLine}Total with tax: ${bill.WithTaxes}");
        order.ClearOrderItemsList();
    }
}