using api.Data;
using api.DTOs;
using api.Models;
using Microsoft.EntityFrameworkCore;

namespace api.Services
{
    public class PersonService : IPersonService
    {
        private readonly PersonDbContext _context;

        public PersonService(PersonDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<PersonDto>> GetAllPersonsAsync()
        {
            var persons = await _context.Persons.ToListAsync();
            return persons.Select(MapToDto);
        }

        public async Task<PersonDto?> GetPersonByIdAsync(int id)
        {
            var person = await _context.Persons.FindAsync(id);
            return person != null ? MapToDto(person) : null;
        }

        public async Task<PersonDto> CreatePersonAsync(CreatePersonDto createPersonDto, string currentUser)
        {
            var person = new Person
            {
                FirstName = createPersonDto.FirstName,
                LastName = createPersonDto.LastName,
                Email = createPersonDto.Email,
                PhoneNumber = createPersonDto.PhoneNumber,
                EntryUser = currentUser,
                EntryDateTime = DateTime.UtcNow
            };

            _context.Persons.Add(person);
            await _context.SaveChangesAsync();

            return MapToDto(person);
        }

        public async Task<PersonDto?> UpdatePersonAsync(int id, UpdatePersonDto updatePersonDto, string currentUser)
        {
            var person = await _context.Persons.FindAsync(id);
            if (person == null)
                return null;

            person.FirstName = updatePersonDto.FirstName;
            person.LastName = updatePersonDto.LastName;
            person.Email = updatePersonDto.Email;
            person.PhoneNumber = updatePersonDto.PhoneNumber;
            person.ChangeUser = currentUser;
            person.ChangeDateTime = DateTime.UtcNow;

            await _context.SaveChangesAsync();

            return MapToDto(person);
        }

        public async Task<bool> DeletePersonAsync(int id)
        {
            var person = await _context.Persons.FindAsync(id);
            if (person == null)
                return false;

            _context.Persons.Remove(person);
            await _context.SaveChangesAsync();

            return true;
        }

        private static PersonDto MapToDto(Person person)
        {
            return new PersonDto
            {
                PersonId = person.PersonId,
                FirstName = person.FirstName,
                LastName = person.LastName,
                Email = person.Email,
                PhoneNumber = person.PhoneNumber,
                EntryUser = person.EntryUser,
                EntryDateTime = person.EntryDateTime,
                ChangeUser = person.ChangeUser,
                ChangeDateTime = person.ChangeDateTime
            };
        }
    }
}