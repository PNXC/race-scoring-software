using api.DTOs;

namespace api.Services
{
    public interface IPersonService
    {
        Task<IEnumerable<PersonDto>> GetAllPersonsAsync();
        Task<PersonDto?> GetPersonByIdAsync(int id);
        Task<PersonDto> CreatePersonAsync(CreatePersonDto createPersonDto, string currentUser);
        Task<PersonDto?> UpdatePersonAsync(int id, UpdatePersonDto updatePersonDto, string currentUser);
        Task<bool> DeletePersonAsync(int id);
    }
}