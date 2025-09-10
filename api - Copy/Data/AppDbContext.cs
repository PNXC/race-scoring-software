using Microsoft.EntityFrameworkCore;
using api.Models;

namespace api.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        { }

        public DbSet<Person> Persons { get; set; } = null!;
        public DbSet<TagType> TagTypes { get; set; } = null!;
        public DbSet<Tag> Tags { get; set; } = null!;
        public DbSet<PersonTag> PersonTags { get; set; } = null!;
        public DbSet<Event> Events { get; set; } = null!;
        public DbSet<EventResult> EventResults { get; set; } = null!;
        public DbSet<Family> Families { get; set; } = null!;
        public DbSet<PersonFamily> PersonFamilies { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // --- Person ---
            modelBuilder.Entity<Person>(entity =>
            {
                entity.ToTable("person");
                entity.HasKey(e => e.PersonId);
                entity.Property(e => e.PersonId).HasColumnName("person_id");
                entity.Property(e => e.FirstName).HasColumnName("first_name").IsRequired();
                entity.Property(e => e.LastName).HasColumnName("last_name").IsRequired();
                entity.Property(e => e.Email).HasColumnName("email");
                entity.Property(e => e.PhoneNumber).HasColumnName("phone_number");
                entity.Property(e => e.EntryUser).HasColumnName("entry_user").IsRequired();
                entity.Property(e => e.EntryDateTime).HasColumnName("entry_datetime").IsRequired();
                entity.Property(e => e.ChangeUser).HasColumnName("change_user");
                entity.Property(e => e.ChangeDateTime).HasColumnName("change_datetime");
                entity.Property(e => e.ValidFrom).HasColumnName("ValidFrom");
                entity.Property(e => e.ValidTo).HasColumnName("ValidTo");
            });

            // --- TagType ---
            modelBuilder.Entity<TagType>(entity =>
            {
                entity.ToTable("tag_type");
                entity.HasKey(e => e.TagTypeId);
                entity.Property(e => e.TagTypeId).HasColumnName("tag_type_id");
                entity.Property(e => e.Name).HasColumnName("name").IsRequired();
                entity.Property(e => e.EntryUser).HasColumnName("entry_user").IsRequired();
                entity.Property(e => e.EntryDateTime).HasColumnName("entry_datetime").IsRequired();
                entity.Property(e => e.ChangeUser).HasColumnName("change_user");
                entity.Property(e => e.ChangeDateTime).HasColumnName("change_datetime");
            });

            // --- Tag ---
            modelBuilder.Entity<Tag>(entity =>
            {
                entity.ToTable("tag");
                entity.HasKey(e => e.TagId);
                entity.Property(e => e.TagId).HasColumnName("tag_id");
                entity.Property(e => e.Name).HasColumnName("name").IsRequired();
                entity.Property(e => e.TagTypeId).HasColumnName("tag_type_id");
                entity.HasOne<TagType>().WithMany().HasForeignKey(e => e.TagTypeId);
                entity.Property(e => e.EntryUser).HasColumnName("entry_user").IsRequired();
                entity.Property(e => e.EntryDateTime).HasColumnName("entry_datetime").IsRequired();
                entity.Property(e => e.ChangeUser).HasColumnName("change_user");
                entity.Property(e => e.ChangeDateTime).HasColumnName("change_datetime");
            });

            // --- PersonTag ---
            modelBuilder.Entity<PersonTag>(entity =>
            {
                entity.ToTable("person_tag");
                entity.HasKey(e => e.PersonTagId);
                entity.Property(e => e.PersonTagId).HasColumnName("person_tag_id");
                entity.Property(e => e.PersonId).HasColumnName("person_id");
                entity.Property(e => e.TagId).HasColumnName("tag_id");
                entity.HasOne<Person>().WithMany().HasForeignKey(e => e.PersonId);
                entity.HasOne<Tag>().WithMany().HasForeignKey(e => e.TagId);
                entity.Property(e => e.EntryUser).HasColumnName("entry_user").IsRequired();
                entity.Property(e => e.EntryDateTime).HasColumnName("entry_datetime").IsRequired();
                entity.Property(e => e.ChangeUser).HasColumnName("change_user");
                entity.Property(e => e.ChangeDateTime).HasColumnName("change_datetime");
            });

            // --- Event ---
            modelBuilder.Entity<Event>(entity =>
            {
                entity.ToTable("event");
                entity.HasKey(e => e.EventId);
                entity.Property(e => e.EventId).HasColumnName("event_id");
                entity.Property(e => e.Name).HasColumnName("name").IsRequired();
                entity.Property(e => e.EventDate).HasColumnName("event_date").IsRequired();
                entity.Property(e => e.EntryUser).HasColumnName("entry_user").IsRequired();
                entity.Property(e => e.EntryDateTime).HasColumnName("entry_datetime").IsRequired();
                entity.Property(e => e.ChangeUser).HasColumnName("change_user");
                entity.Property(e => e.ChangeDateTime).HasColumnName("change_datetime");
            });

            // --- EventResult ---
            modelBuilder.Entity<EventResult>(entity =>
            {
                entity.ToTable("event_result");
                entity.HasKey(e => e.EventResultId);
                entity.Property(e => e.EventResultId).HasColumnName("event_result_id");
                entity.Property(e => e.EventId).HasColumnName("event_id");
                entity.Property(e => e.PersonId).HasColumnName("person_id");
                entity.Property(e => e.TimeSeconds).HasColumnName("time_seconds");
                entity.Property(e => e.Ordinal).HasColumnName("ordinal");
                entity.HasOne<Event>().WithMany().HasForeignKey(e => e.EventId);
                entity.HasOne<Person>().WithMany().HasForeignKey(e => e.PersonId);
                entity.Property(e => e.EntryUser).HasColumnName("entry_user").IsRequired();
                entity.Property(e => e.EntryDateTime).HasColumnName("entry_datetime").IsRequired();
                entity.Property(e => e.ChangeUser).HasColumnName("change_user");
                entity.Property(e => e.ChangeDateTime).HasColumnName("change_datetime");
            });

            // --- Family ---
            modelBuilder.Entity<Family>(entity =>
            {
                entity.ToTable("family");
                entity.HasKey(e => e.FamilyId);
                entity.Property(e => e.FamilyId).HasColumnName("family_id");
                entity.Property(e => e.FamilyName).HasColumnName("family_name").IsRequired();
                entity.Property(e => e.EntryUser).HasColumnName("entry_user").IsRequired();
                entity.Property(e => e.EntryDateTime).HasColumnName("entry_datetime").IsRequired();
                entity.Property(e => e.ChangeUser).HasColumnName("change_user");
                entity.Property(e => e.ChangeDateTime).HasColumnName("change_datetime");
            });

            // --- PersonFamily ---
            modelBuilder.Entity<PersonFamily>(entity =>
            {
                entity.ToTable("person_family");
                entity.HasKey(e => e.PersonFamilyId);
                entity.Property(e => e.PersonFamilyId).HasColumnName("person_family_id");
                entity.Property(e => e.PersonId).HasColumnName("person_id");
                entity.Property(e => e.FamilyId).HasColumnName("family_id");
                entity.Property(e => e.Role).HasColumnName("role");
                entity.HasOne<Person>().WithMany().HasForeignKey(e => e.PersonId);
                entity.HasOne<Family>().WithMany().HasForeignKey(e => e.FamilyId);
                entity.Property(e => e.EntryUser).HasColumnName("entry_user").IsRequired();
                entity.Property(e => e.EntryDateTime).HasColumnName("entry_datetime").IsRequired();
                entity.Property(e => e.ChangeUser).HasColumnName("change_user");
                entity.Property(e => e.ChangeDateTime).HasColumnName("change_datetime");
            });
        }
    }
}
