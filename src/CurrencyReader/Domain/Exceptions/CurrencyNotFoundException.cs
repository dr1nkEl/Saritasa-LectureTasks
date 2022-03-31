using Saritasa.Tools.Domain.Exceptions;
using System.Runtime.Serialization;

namespace Saritasa.CurrencyReader.Domain.Exceptions;

/// <summary>
/// Exception to be thrown if currency on give date is not found.
/// </summary>
[Serializable]
public class CurrencyNotFoundException : DomainException
{
    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="date">Date on which currency not found.</param>
    public CurrencyNotFoundException(DateTime date) : base("No currency for date: " + date.ToString("dd-MM-yyyy"))
    {
    }

    /// <inheritdoc/>
    protected CurrencyNotFoundException(SerializationInfo info, StreamingContext context)
            : base(info, context)
    {
    }
}
