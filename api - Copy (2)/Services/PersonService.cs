using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using api.Data;
using api.Models;

namespace api.Services
{
    public class PersonService
    {
        private readonly AppDbContext _context;

        public PersonService(AppDbContext context)
        {
            _context = context;
        }

        public IEnumerable<Person> GetPeople()
        {
            return _context.Persons.AsNoTracking().ToList();
        }

        public Person? GetPersonById(int id)
        {
            return _context.Persons.AsNoTracking().FirstOrDefault(p => p.PersonId == id);
        }

        public Person AddPerson(Person person)
        {
            person.EntryDateTime = DateTime.UtcNow;
            person.ValidFrom = DateTime.UtcNow; // Temporal start
            person.ValidTo = DateTime.MaxValue;  // Temporal end
            _context.Persons.Add(person);
            _context.SaveChanges();
            return person;
        }

        public void EditPerson(Person person)
        {
            person.ChangeDateTime = DateTime.UtcNow;

            // For temporal system-versioning, you could update ValidTo/ValidFrom here if needed
            _context.Persons.Update(person);
            _context.SaveChanges();
        }

        public void DeletePerson(int id)
        {
            var person = _context.Persons.Find(id);
            if (person != null)
            {
                _context.Persons.Remove(person);
                _context.SaveChanges();
            }
        }
    }
}
