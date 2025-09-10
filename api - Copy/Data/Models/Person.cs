using System;

namespace api.Models
{
    public class Person
    {
        public int PersonId { get; set; }

        public required string FirstName { get; set; }
        public required string LastName { get; set; }
        public string? Email { get; set; }
        public string? PhoneNumber { get; set; }

        // Audit fields
        public required string EntryUser { get; set; }
        public required DateTime EntryDateTime { get; set; }
        public string? ChangeUser { get; set; }
        public DateTime? ChangeDateTime { get; set; }

        // Temporal fields (system-versioned)
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTo { get; set; }
    }
}