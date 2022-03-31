namespace CLI.Commands;

using System;
using System.ComponentModel.DataAnnotations;
using McMaster.Extensions.CommandLineUtils;
using Models;

/// <summary>
/// Command class responsible for deleting orderitem from order.
/// </summary>
[HelpOption("--help")]
[Command(name: "rm")]
public class RmOrderCommand
{
    [Required]
    [Argument(0)]
    private int Index { get; set; }

    private readonly Order order;
    private readonly IConsole console;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="order">Order on which operation will be executed.</param>
    /// <param name="console">Console implementation for logging.</param>
    public RmOrderCommand(Order order, IConsole console)
    {
        this.order = order;
        this.console = console;
    }

    /// <summary>
    /// Method acting on CommandLineApplication.Execute call.
    /// </summary>
    public void OnExecute()
    {
        try
        {
            order.DeleteOrderItemAtIndex(this.Index - 1);
        }
        catch (ArgumentOutOfRangeException ex)
        {
            console.WriteLine(ex.Message);
        }
    }
}