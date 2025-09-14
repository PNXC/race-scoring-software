using api.DTOs.Person;
using api.Services;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;
using System.Net;
using System.Text.Json;

namespace api
{
    public class PersonFunctions
    {
        private readonly ILogger _logger;
        private readonly IPersonService _personService;

        public PersonFunctions(ILoggerFactory loggerFactory, IPersonService personService)
        {
            _logger = loggerFactory.CreateLogger<PersonFunctions>();
            _personService = personService;
        }

        // GET: api/persons
        [Function("GetAllPersons")]
        public async Task<HttpResponseData> GetAllPersons(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "persons")] HttpRequestData req)
        {
            try
            {
                var persons = await _personService.GetAllPersonsAsync();
                var response = req.CreateResponse(HttpStatusCode.OK);
                await response.WriteAsJsonAsync(persons);
                return response;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting all persons");
                var errorResponse = req.CreateResponse(HttpStatusCode.InternalServerError);
                await errorResponse.WriteStringAsync("Internal server error");
                return errorResponse;
            }
        }

        // GET: api/persons/{id}
        [Function("GetPersonById")]
        public async Task<HttpResponseData> GetPersonById(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "persons/{id:int}")] HttpRequestData req,
            int id)
        {
            try
            {
                var person = await _personService.GetPersonByIdAsync(id);
                if (person == null)
                {
                    var notFoundResponse = req.CreateResponse(HttpStatusCode.NotFound);
                    await notFoundResponse.WriteStringAsync($"Person with id {id} not found");
                    return notFoundResponse;
                }

                var response = req.CreateResponse(HttpStatusCode.OK);
                await response.WriteAsJsonAsync(person);
                return response;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting person by id: {Id}", id);
                var errorResponse = req.CreateResponse(HttpStatusCode.InternalServerError);
                await errorResponse.WriteStringAsync("Internal server error");
                return errorResponse;
            }
        }

        // POST: api/persons
        [Function("CreatePerson")]
        public async Task<HttpResponseData> CreatePerson(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "persons")] HttpRequestData req)
        {
            try
            {
                var requestBody = await new StreamReader(req.Body).ReadToEndAsync();
                var createPersonDto = JsonSerializer.Deserialize<CreatePersonDto>(requestBody, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                });

                if (createPersonDto == null)
                {
                    var badRequestResponse = req.CreateResponse(HttpStatusCode.BadRequest);
                    await badRequestResponse.WriteStringAsync("Invalid request body");
                    return badRequestResponse;
                }

                // Get current user (in a real app, this would come from authentication)
                var currentUser = "system"; // You might want to extract this from headers or token

                var createdPerson = await _personService.CreatePersonAsync(createPersonDto, currentUser);

                var response = req.CreateResponse(HttpStatusCode.Created);
                await response.WriteAsJsonAsync(createdPerson);
                return response;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error creating person");
                var errorResponse = req.CreateResponse(HttpStatusCode.InternalServerError);
                await errorResponse.WriteStringAsync("Internal server error");
                return errorResponse;
            }
        }

        // PUT: api/persons/{id}
        [Function("UpdatePerson")]
        public async Task<HttpResponseData> UpdatePerson(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "persons/{id:int}")] HttpRequestData req,
            int id)
        {
            try
            {
                var requestBody = await new StreamReader(req.Body).ReadToEndAsync();
                var updatePersonDto = JsonSerializer.Deserialize<UpdatePersonDto>(requestBody, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                });

                if (updatePersonDto == null)
                {
                    var badRequestResponse = req.CreateResponse(HttpStatusCode.BadRequest);
                    await badRequestResponse.WriteStringAsync("Invalid request body");
                    return badRequestResponse;
                }

                // Get current user (in a real app, this would come from authentication)
                var currentUser = "system"; // You might want to extract this from headers or token

                var updatedPerson = await _personService.UpdatePersonAsync(id, updatePersonDto, currentUser);

                if (updatedPerson == null)
                {
                    var notFoundResponse = req.CreateResponse(HttpStatusCode.NotFound);
                    await notFoundResponse.WriteStringAsync($"Person with id {id} not found");
                    return notFoundResponse;
                }

                var response = req.CreateResponse(HttpStatusCode.OK);
                await response.WriteAsJsonAsync(updatedPerson);
                return response;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error updating person with id: {Id}", id);
                var errorResponse = req.CreateResponse(HttpStatusCode.InternalServerError);
                await errorResponse.WriteStringAsync("Internal server error");
                return errorResponse;
            }
        }

        // DELETE: api/persons/{id}
        [Function("DeletePerson")]
        public async Task<HttpResponseData> DeletePerson(
            [HttpTrigger(AuthorizationLevel.Function, "delete", Route = "persons/{id:int}")] HttpRequestData req,
            int id)
        {
            try
            {
                var deleted = await _personService.DeletePersonAsync(id);

                if (!deleted)
                {
                    var notFoundResponse = req.CreateResponse(HttpStatusCode.NotFound);
                    await notFoundResponse.WriteStringAsync($"Person with id {id} not found");
                    return notFoundResponse;
                }

                var response = req.CreateResponse(HttpStatusCode.NoContent);
                return response;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error deleting person with id: {Id}", id);
                var errorResponse = req.CreateResponse(HttpStatusCode.InternalServerError);
                await errorResponse.WriteStringAsync("Internal server error");
                return errorResponse;
            }
        }
    }
}