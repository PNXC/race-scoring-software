using System;

namespace api.Models
{
  public class PersonTag
    {
        public int PersonTagId { get; set; }
        public int PersonId { get; set; }
        public int TagId { get; set; }

        // Audit fields
        public required string EntryUser { get; set; }
        public required DateTime EntryDateTime { get; set; }
        public string? ChangeUser { get; set; }
        public DateTime? ChangeDateTime { get; set; }
    }
}