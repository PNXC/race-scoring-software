using System;

namespace api.Models
{
      public class Family
    {
        public int FamilyId { get; set; }
        public required string FamilyName { get; set; }

        // Audit fields
        public required string EntryUser { get; set; }
        public required DateTime EntryDateTime { get; set; }
        public string? ChangeUser { get; set; }
        public DateTime? ChangeDateTime { get; set; }
    }
}