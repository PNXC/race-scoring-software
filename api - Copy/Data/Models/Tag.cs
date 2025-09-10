using System;

namespace api.Models
{
  public class Tag
    {
        public int TagId { get; set; }
        public required string Name { get; set; }
        public int TagTypeId { get; set; }

        // Audit fields
        public required string EntryUser { get; set; }
        public required DateTime EntryDateTime { get; set; }
        public string? ChangeUser { get; set; }
        public DateTime? ChangeDateTime { get; set; }
    }
}