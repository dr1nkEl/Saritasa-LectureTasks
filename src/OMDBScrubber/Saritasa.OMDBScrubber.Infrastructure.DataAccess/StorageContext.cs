using Microsoft.EntityFrameworkCore;
using Saritasa.OMDBScrubber.Domain;
using Saritasa.OMDBScrubber.Infrastructure.Abstractions;

namespace Saritasa.OMDBScrubber.Infrastructure.DataAccess;

/// <inheritdoc>/>.
public class StorageContext : DbContext, IStorageContext
{
    /// <inheritdoc/>.
    public DbSet<Actor> Actors { get; set; }

    /// <inheritdoc/>.
    public DbSet<Movie> Movies { get; set; }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="options">Dbcontext options.</param>
    public StorageContext(DbContextOptions<StorageContext> options) : base(options)
    {
        Database.EnsureCreated();
    }

    /// <inheritdoc>/>.
    public async Task SaveChangesAsync(CancellationToken cancellationToken)
    {
        await base.SaveChangesAsync(cancellationToken);
    }

    /// <inheritdoc/>.
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .Entity<Movie>()
            .HasMany(p => p.Actors)
            .WithMany(p => p.Movies)
            .UsingEntity(j => j.ToTable("MovieActors"));
        modelBuilder.Entity<Movie>().HasIndex(x => x.ImdbRating);
        modelBuilder.Entity<Actor>().HasIndex(x => x.Name);
    }
}
