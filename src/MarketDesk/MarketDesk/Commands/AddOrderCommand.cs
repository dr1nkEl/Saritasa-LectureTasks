using McMaster.Extensions.CommandLineUtils;
using Models;
using System.ComponentModel.DataAnnotations;

namespace CLI.Commands;

/// <summary>
/// Command class responsible for adding orderitem to order.
/// </summary>
[HelpOption("--help")]
[Command(name: "add")]
public class AddOrderCommand
{
    private readonly Order order;

    [Required]
    [Argument(0)]
    private string Name { get; set; }

    [Required]
    [Argument(1)]
    private decimal Price { get; set; }

    [Required]
    [Argument(2)]
    private int Amount { get; set; }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="order">Order on which command will be executed.</param>
    public AddOrderCommand(Order order)
    {
        this.order = order;
    }

    /// <summary>
    /// Executing command.
    /// </summary>
    public void OnExecute()
    {
        order.AddOrderItem(new OrderItem(Name, Price, Amount));
    }
}