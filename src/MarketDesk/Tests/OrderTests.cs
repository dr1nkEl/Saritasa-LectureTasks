namespace Tests;

using System;
using System.Collections.Generic;
using System.Linq;
using Models;
using Xunit;

/// <summary>
/// Class of testing Order functionality.
/// </summary>
public class OrderTests
{
    private readonly List<OrderItem> orderItems = new()
    {
        new OrderItem("Vodka", 10, 1),
        new OrderItem("Beer", 3, 6),
        new OrderItem("Fish", 1, 10),
    };

    /// <summary>
    /// Testing correctness of single item addition to orderitem list.
    /// </summary>
    [Fact]
    public void AddOrderItem_Addition_Success()
    {
        var order = new Order();
        order.AddOrderItem(this.orderItems.First());
        var items = order.GetItems();
        Assert.Single(items);
    }

    /// <summary>
    /// Testing multiple items addition to orderitem list.
    /// </summary>
    [Fact]
    public void AddMultipleOrderItems_Addition_Success()
    {
        var order = new Order();
        foreach (var item in this.orderItems)
        {
            order.AddOrderItem(item);
        }
        var testListItemsCount = this.orderItems.Count;
        var itemsCount = order.GetItems().Count();

        Assert.Equal(testListItemsCount, itemsCount);
    }

    /// <summary>
    /// Testing that created order doesnt have elements in orderitem list.
    /// </summary>
    [Fact]
    public void BeEmptyOrderItemListOnCreation_Success()
    {
        var order = new Order();
        var orderItems = order.GetItems();
        Assert.Empty(orderItems);
    }

    /// <summary>
    /// Testing correctness of order's total calculation without taxes on not empty orderitem list.
    /// </summary>
    [Fact]
    public void CalculateTotalWithoutTaxesOnNotEmpty_Correctness_Success()
    {
        var order = this.GetOrderWithMultipleItems();
        var total = order.CalculateTotalWithoutTaxes();
        Assert.Equal(38, total);
    }

    /// <summary>
    /// Testing correctness of order's total calculation without taxes on empty orderitem list.
    /// </summary>
    [Fact]
    public void CalculateTotalWithoutTaxesOnEmpty_Correctness_Success()
    {
        var order = new Order();
        var total = order.CalculateTotalWithoutTaxes();
        Assert.Equal(0, total);
    }

    /// <summary>
    /// Testing correctness of order's total calculation with taxes on not empty orderitem list.
    /// </summary>
    [Fact]
    public void CalculateTotalWithTaxesOnNotEmpty_Correctness_Success()
    {
        var order = this.GetOrderWithMultipleItems();
        var total = order.CalculateTotalWithTaxes();
        Assert.Equal(39.14M, total);
    }

    /// <summary>
    /// Testing correctness of order's total calculation with taxes on empty orderitem list.
    /// </summary>
    [Fact]
    public void CalculateTotalWithTaxesOnEmpty_Correctness_Success()
    {
        var order = new Order();
        var total = order.CalculateTotalWithTaxes();
        Assert.Equal(0, total);
    }

    /// <summary>
    /// Testing failure on deleting on unexisting index in orderitem list.
    /// </summary>
    [Fact]
    public void DeleteOrderItemOnUnExistingIndex_Correctness_Failure()
    {
        var order = new Order();
        Assert.Throws<ArgumentOutOfRangeException>(
            () => order.DeleteOrderItemAtIndex(0));
    }

    /// <summary>
    /// Testing deletion correctness on existing index in orderitem list.
    /// </summary>
    [Fact]
    public void DeleteOrderItemOnExistingIndex_Correctness_Success()
    {
        var order = this.GetOrderWithOneItem();
        order.DeleteOrderItemAtIndex(0);
        var orderItems = order.GetItems();
        Assert.Empty(orderItems);
    }

    /// <summary>
    /// Testing correctness order's total without taxes calculation on orderitem list of single element.
    /// </summary>
    [Fact]
    public void CalculateTotalWithoutTaxesOnSingleItem_Correctness_Success()
    {
        var order = this.GetOrderWithOneItem();
        var testItemPrice = this.orderItems[0].Price;
        var total = order.CalculateTotalWithoutTaxes();
        Assert.Equal(testItemPrice, total);
    }

    /// <summary>
    /// Testing correctness order's total with taxes calculation on orderitem list of single element.
    /// </summary>
    [Fact]
    public void CalculateTotalWithTaxesOnSingleItem_Correctness_Success()
    {
        var order = this.GetOrderWithOneItem();
        var testItemPrice = this.orderItems.First().Price * (decimal)(1 + (0.01 * Constants.Tax));
        var total = order.CalculateTotalWithTaxes();
        Assert.Equal(testItemPrice, total);
    }

    private Order GetOrderWithOneItem()
    {
        var order = new Order();
        order.AddOrderItem(this.orderItems.First());
        return order;
    }

    private Order GetOrderWithMultipleItems()
    {
        var order = new Order();
        foreach (var item in this.orderItems)
        {
            order.AddOrderItem(item);
        }

        return order;
    }
}
