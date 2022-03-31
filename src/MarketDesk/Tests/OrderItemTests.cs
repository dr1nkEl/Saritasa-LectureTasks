namespace Tests;

using System;
using Models;
using Xunit;

/// <summary>
/// Class of testing OrderItem functionality.
/// </summary>
public class OrderItemTests
{
    /// <summary>
    /// Testing correct calculation of item summary price.
    /// </summary>
    [Fact]
    public void GetItemSummaryPrice_Calculation_Success()
    {
        var orderItem = new OrderItem("asd", 25, 2);
        var summaryPrice = orderItem.GetItemSummaryPrice();
        Assert.Equal(50, summaryPrice);
    }

    /// <summary>
    /// Testing failing creation with argument exception of item with invalid price data.
    /// </summary>
    [Fact]
    public void CreateItemWithNegativePrice_Creation_Failure()
    {
        Assert.Throws<ArgumentException>(() =>
        {
            var item = new OrderItem("asd", -25, 5);
        });
    }

    /// <summary>
    /// Testing failing creation with argument exception of item with invalid Amount data.
    /// </summary>
    [Fact]
    public void CreateItemWithNegativeAmount_Creation_Failure()
    {
        Assert.Throws<ArgumentException>(() =>
        {
            var item = new OrderItem("asd", 25, -5);
        });
    }

    /// <summary>
    /// Testing failing creation with argument exception of item with both invalid price and amount data.
    /// </summary>
    [Fact]
    public void CreateItemWithNegativePriceAndNegativeAmount_Creation_Failure()
    {
        Assert.Throws<ArgumentException>(() =>
        {
            var item = new OrderItem("asd", -25, -5);
        });
    }
}
