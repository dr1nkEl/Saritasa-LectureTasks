namespace Saritasa.CurrencyReader.Domain.Entities;

/// <summary>
/// Currencies class.
/// </summary>
public record Currency
{
    /// <summary>
    /// Date of currency.
    /// </summary>
    public DateTime Date { get; init; }

    /// <summary>
    /// Rub currency for date.
    /// </summary>
    public decimal RUB { get; init; }

    /// <summary>
    /// EUR currency for date.
    /// </summary>
    public decimal EUR { get; init; }
}
