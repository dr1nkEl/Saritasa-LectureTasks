namespace Models;

using System;

/// <summary>
/// Orderitem class to create instances for orderlist.
/// </summary>
public record OrderItem
{
    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="name">Name of orderitem.</param>
    /// <param name="price">Price of orderitem.</param>
    /// <param name="amount">Amount of orderitem.</param>
    /// <exception cref="ArgumentException">Price and amount can not be negative.</exception>
    public OrderItem(string name, decimal price, int amount)
    {
        this.Name = name;
        if (price < 0 || amount < 0)
        {
            throw new ArgumentException("Price and amount cant be negative");
        }

        this.Price = price;
        this.Amount = amount;
    }

    /// <summary>
    /// Orderitem price.
    /// </summary>
    public decimal Price { get; }

    /// <summary>
    /// Amount of orderitems.
    /// </summary>
    public int Amount { get; }

    /// <summary>
    /// Name of orderitem.
    /// </summary>
    public string Name { get; }

    /// <summary>
    /// Calculates summary price of item without taxes.
    /// </summary>
    /// <returns>Price of item without taxes.</returns>
    public decimal GetItemSummaryPrice() => this.Price * this.Amount;
}
