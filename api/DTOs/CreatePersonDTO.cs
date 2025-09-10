using System.ComponentModel.DataAnnotations;

namespace api.DTOs
{
    public class CreatePersonDto
    {
        [MaxLength(255)]
        public string? FirstName { get; set; }

        [MaxLength(255)]
        public string? LastName { get; set; }

        [MaxLength(255)]
        [EmailAddress]
        public string? Email { get; set; }

        [MaxLength(255)]
        public string? PhoneNumber { get; set; }
    }
}