using System;

namespace api.Models
{
      public class PersonFamily
    {
        public int PersonFamilyId { get; set; }
        public int PersonId { get; set; }
        public int FamilyId { get; set; }
        public string? Role { get; set; }

        // Audit fields
        public required string EntryUser { get; set; }
        public required DateTime EntryDateTime { get; set; }
        public string? ChangeUser { get; set; }
        public DateTime? ChangeDateTime { get; set; }
    }
}