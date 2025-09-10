using System;

namespace api.Models
{
public class TagType
    {
        public int TagTypeId { get; set; }
        public required string Name { get; set; }

        // Audit fields
        public required string EntryUser { get; set; }
        public required DateTime EntryDateTime { get; set; }
        public string? ChangeUser { get; set; }
        public DateTime? ChangeDateTime { get; set; }
    }    
}