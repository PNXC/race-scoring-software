using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models
{
    [Table("person")]
    public class Person
    {
        [Key]
        [Column("person_id")]
        public int PersonId { get; set; }

        [Column("first_name")]
        [MaxLength(255)]
        public string? FirstName { get; set; }

        [Column("last_name")]
        [MaxLength(255)]
        public string? LastName { get; set; }

        [Column("email")]
        [MaxLength(255)]
        public string? Email { get; set; }

        [Column("phone_number")]
        [MaxLength(255)]
        public string? PhoneNumber { get; set; }

        [Column("entry_user")]
        [MaxLength(255)]
        [Required]
        public string EntryUser { get; set; } = string.Empty;

        [Column("entry_datetime")]
        [Required]
        public DateTime EntryDateTime { get; set; }

        [Column("change_user")]
        [MaxLength(255)]
        public string? ChangeUser { get; set; }

        [Column("change_datetime")]
        public DateTime? ChangeDateTime { get; set; }

        // Note: ValidFrom and ValidTo are system-generated temporal columns
        // They don't need to be included in the model for CRUD operations
    }
}