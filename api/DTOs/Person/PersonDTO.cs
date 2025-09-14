namespace api.DTOs.Person
{
    public class PersonDto
    {
        public int PersonId { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Email { get; set; }
        public string? PhoneNumber { get; set; }
        public string EntryUser { get; set; } = string.Empty;
        public DateTime EntryDateTime { get; set; }
        public string? ChangeUser { get; set; }
        public DateTime? ChangeDateTime { get; set; }
    }
}