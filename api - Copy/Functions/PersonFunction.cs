using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using api.Models;
using api.Services;
using api.Data;
using Microsoft.EntityFrameworkCore;

namespace api.Functions
{
    public class PersonFunctions
    {
        private readonly PersonService _personService;

        public PersonFunctions()
        {
            // Configure DbContext with connection string from environment variable
            var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();
            var connectionString = Environment.GetEnvironmentVariable("SqlConnectionString");
            optionsBuilder.UseSqlServer(connectionString!);
            var context = new AppDbContext(optionsBuilder.Options);

            _personService = new PersonService(context);
        }

        [FunctionName("GetPeople")]
        public IActionResult GetPeople(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "person")] HttpRequest req,
            ILogger log)
        {
            var people = _personService.GetPeople();
            return new OkObjectResult(people);
        }

        [FunctionName("GetPersonById")]
        public IActionResult GetPersonById(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "person/{id}")] HttpRequest req,
            int id,
            ILogger log)
        {
            var person = _personService.GetPersonById(id);
            return person != null ? new OkObjectResult(person) : new NotFoundResult();
        }

        [FunctionName("AddPerson")]
        public async Task<IActionResult> AddPerson(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "person")] HttpRequest req,
            ILogger log)
        {
            var requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            var person = JsonConvert.DeserializeObject<Person>(requestBody);
            if (person == null) return new BadRequestResult();

            person.EntryUser ??= "System";
            var addedPerson = _personService.AddPerson(person);
            return new OkObjectResult(addedPerson);
        }

        [FunctionName("EditPerson")]
        public async Task<IActionResult> EditPerson(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "person/{id}")] HttpRequest req,
            int id,
            ILogger log)
        {
            var requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            var person = JsonConvert.DeserializeObject<Person>(requestBody);
            if (person == null) return new BadRequestResult();

            person.PersonId = id;
            person.ChangeUser ??= "System";
            _personService.EditPerson(person);
            return new OkResult();
        }

        [FunctionName("DeletePerson")]
        public IActionResult DeletePerson(
            [HttpTrigger(AuthorizationLevel.Function, "delete", Route = "person/{id}")] HttpRequest req,
            int id,
            ILogger log)
        {
            _personService.DeletePerson(id);
            return new OkResult();
        }
    }
}
