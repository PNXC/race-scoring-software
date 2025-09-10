using System;

namespace api.Models
{
      public class EventResult
    {
        public int EventResultId { get; set; }
        public int EventId { get; set; }
        public int PersonId { get; set; }
        public int TimeSeconds { get; set; }
        public int Ordinal { get; set; }

        // Audit fields
        public required string EntryUser { get; set; }
        public required DateTime EntryDateTime { get; set; }
        public string? ChangeUser { get; set; }
        public DateTime? ChangeDateTime { get; set; }
    }
}