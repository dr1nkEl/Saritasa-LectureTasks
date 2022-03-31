using Microsoft.EntityFrameworkCore;
using Saritasa.OMDBScrubber.Domain;

namespace Saritasa.OMDBScrubber.Infrastructure.Abstractions;

/// <summary>
/// Storage context abstraction.
/// </summary>
public interface IStorageContext
{
    /// <summary>
    /// Actors dbset.
    /// </summary>
    DbSet<Actor> Actors { get; }

    /// <summary>
    /// Movies dbset.
    /// </summary>
    DbSet<Movie> Movies { get; }

    /// <summary>
    /// Saving context changes.
    /// </summary>
    /// <returns>Task.</returns>
    Task SaveChangesAsync(CancellationToken cancellationToken);
}
