using api.Models;
using Microsoft.EntityFrameworkCore;

namespace api.Data
{
    public class PersonDbContext : DbContext
    {
        public PersonDbContext(DbContextOptions<PersonDbContext> options) : base(options)
        {
        }

        public DbSet<Person> Persons { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Person>(entity =>
            {
                // Set default values for audit fields
                entity.Property(e => e.EntryUser)
                    .HasDefaultValueSql("SUSER_SNAME()");

                entity.Property(e => e.EntryDateTime)
                    .HasDefaultValueSql("SYSUTCDATETIME()");

                // Configure temporal table (system-versioned)
                entity.ToTable("person", t => t.IsTemporal(temporal =>
                {
                    temporal.HasPeriodStart("ValidFrom");
                    temporal.HasPeriodEnd("ValidTo");
                    temporal.UseHistoryTable("person_history");
                }));
            });
        }
    }
}