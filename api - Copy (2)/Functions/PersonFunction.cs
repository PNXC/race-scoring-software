using System.IO;
using System.Net;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using api.Data;
using api.Models;

namespace api.Functions
{
    public class PersonFunctions
    {
        private readonly ILogger<PersonFunctions> _logger;
        private readonly ApplicationDbContext _dbContext;

        // The DbContext is injected automatically by the dependency injection container.
        public PersonFunctions(ILogger<PersonFunctions> logger, ApplicationDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
        }

        [Function("CreatePerson")]
        public async Task<HttpResponseData> CreatePerson(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "person")] HttpRequestData req)
        {
            _logger.LogInformation("Creating a new person entry with EF Core.");

            var requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            var newPerson = JsonSerializer.Deserialize<Person>(requestBody);

            if (newPerson == null || string.IsNullOrEmpty(newPerson.FirstName))
            {
                return req.CreateResponse(HttpStatusCode.BadRequest);
            }

            try
            {
                // Use EF Core's DbSet to add the new person object.
                _dbContext.People.Add(newPerson);
                await _dbContext.SaveChangesAsync();

                return req.CreateResponse(HttpStatusCode.Created);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error creating person with EF Core.");
                return req.CreateResponse(HttpStatusCode.InternalServerError);
            }
        }

        [Function("GetPerson")]
        public async Task<HttpResponseData> GetPerson(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "person/{id}")] HttpRequestData req,
            int id)
        {
            _logger.LogInformation($"Retrieving person with ID: {id} using EF Core.");

            try
            {
                // Use EF Core's FindAsync to find the person by ID.
                var person = await _dbContext.People.FindAsync(id);

                if (person == null)
                {
                    return req.CreateResponse(HttpStatusCode.NotFound);
                }

                var response = req.CreateResponse(HttpStatusCode.OK);
                await response.WriteStringAsync(JsonSerializer.Serialize(person));
                return response;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting person with EF Core.");
                return req.CreateResponse(HttpStatusCode.InternalServerError);
            }
        }

        [Function("UpdatePerson")]
        public async Task<HttpResponseData> UpdatePerson(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "person/{id}")] HttpRequestData req,
            int id)
        {
            _logger.LogInformation($"Updating person with ID: {id} using EF Core.");

            var requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            var updatedPerson = JsonSerializer.Deserialize<Person>(requestBody);

            if (updatedPerson == null || string.IsNullOrEmpty(updatedPerson.FirstName))
            {
                return req.CreateResponse(HttpStatusCode.BadRequest);
            }

            try
            {
                // Find the person to update and then modify the properties.
                var existingPerson = await _dbContext.People.FindAsync(id);

                if (existingPerson == null)
                {
                    return req.CreateResponse(HttpStatusCode.NotFound);
                }

                existingPerson.FirstName = updatedPerson.FirstName;
                existingPerson.LastName = updatedPerson.LastName;
                existingPerson.Email = updatedPerson.Email;
                existingPerson.PhoneNumber = updatedPerson.PhoneNumber;

                // Save the changes to the database.
                await _dbContext.SaveChangesAsync();

                return req.CreateResponse(HttpStatusCode.NoContent);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error updating person with EF Core.");
                return req.CreateResponse(HttpStatusCode.InternalServerError);
            }
        }

        [Function("DeletePerson")]
        public async Task<HttpResponseData> DeletePerson(
            [HttpTrigger(AuthorizationLevel.Function, "delete", Route = "person/{id}")] HttpRequestData req,
            int id)
        {
            _logger.LogInformation($"Deleting person with ID: {id} using EF Core.");

            try
            {
                // Find the person to delete.
                var personToDelete = await _dbContext.People.FindAsync(id);

                if (personToDelete == null)
                {
                    return req.CreateResponse(HttpStatusCode.NotFound);
                }

                // Remove the person from the DbSet and save changes.
                _dbContext.People.Remove(personToDelete);
                await _dbContext.SaveChangesAsync();

                return req.CreateResponse(HttpStatusCode.NoContent);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error deleting person with EF Core.");
                return req.CreateResponse(HttpStatusCode.InternalServerError);
            }
        }
    }
}