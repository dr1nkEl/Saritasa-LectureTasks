namespace Models;

using System.Collections.Generic;
using System.Linq;

/// <summary>
/// Order class with it manipulating methonds.
/// </summary>
public class Order
{
    private List<OrderItem> Items { get; set; } = new List<OrderItem>();

    /// <summary>
    /// Metond to get order items.
    /// </summary>
    /// <returns>Return list of orderitems in current order without ability to change it.</returns>
    public IEnumerable<OrderItem> GetItems() => this.Items;

    /// <summary>
    /// Method to add item to orderitem list.
    /// </summary>
    /// <param name="item">Item to add to orderitem list.</param>
    public void AddOrderItem(OrderItem item)
    {
        this.Items.Add(item);
    }

    /// <summary>
    /// Method to delete item from orderlist by its index in list.
    /// </summary>
    /// <param name="index">Index in orderitem list on which item will be deleted.</param>
    public void DeleteOrderItemAtIndex(int index)
    {
        this.Items.RemoveAt(index);
    }

    /// <summary>
    /// Clears orderitem list.
    /// </summary>
    public void ClearOrderItemsList()
    {
        Items.Clear();
    }

    /// <summary>
    /// Getting order bill.
    /// </summary>
    /// <returns>Totals as tuple.</returns>
    public Bill GetBill()
    {
        return new Bill(CalculateTotalWithoutTaxes(), CalculateTotalWithTaxes());
    }

    /// <summary>
    /// Calculates total of order without taxes.
    /// </summary>
    /// <returns>Sum without taxes.</returns>
    public decimal CalculateTotalWithoutTaxes() =>
        this.Items.Select(x => x.GetItemSummaryPrice()).Sum();

    /// <summary>
    /// Calculates total of order with taxes.
    /// </summary>
    /// <returns>Sum with taxes.</returns>
    public decimal CalculateTotalWithTaxes() =>
        this.CalculateTotalWithoutTaxes() * (1 + (0.01M * Constants.Tax));
}