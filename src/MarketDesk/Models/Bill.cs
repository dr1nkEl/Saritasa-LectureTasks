namespace Models;

/// <summary>
/// Bill class to summarize payment.
/// </summary>
public class Bill
{
    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="totalWithoutTaxes">Total sum excluding taxes.</param>
    /// <param name="totalWithTaxes">Total sum including taxes.</param>
    public Bill(decimal totalWithoutTaxes, decimal totalWithTaxes)
    {
        WithoutTaxes = totalWithoutTaxes;
        WithTaxes = totalWithTaxes;
    }

    /// <summary>
    /// Sum excluding taxes.
    /// </summary>
    public decimal WithoutTaxes { get; }

    /// <summary>
    /// Sum excluding taxes.
    /// </summary>
    public decimal WithTaxes { get; }
}
