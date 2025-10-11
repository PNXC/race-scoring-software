using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using api.DTOs.Person;
using Xunit;

namespace tests.IntegrationTests;

public class PersonFunctionTests : IClassFixture<ServerFixture>
{
    private readonly HttpClient _client;

    public PersonFunctionTests(ServerFixture fixture)
    {
        _client = fixture.Client;
    }

    [Fact]
    public async Task GetPersons_ReturnsList()
    {
        var response = await _client.GetAsync("api/persons");
        response.EnsureSuccessStatusCode();
        var people = await response.Content.ReadFromJsonAsync<IList<PersonDto>>();
        Assert.NotNull(people);
    }

    [Fact]
    public async Task CreatePerson_Works()
    {
        var createDto = new CreatePersonDto
        {
            FirstName = "Test",
            LastName = "User",
            Email = "test-user@email.com",
            PhoneNumber = "1-234-567-8900",
        };

        int? personId = null;
        try
        {
            var createResponse = await _client.PostAsJsonAsync("api/persons", createDto);
            createResponse.EnsureSuccessStatusCode();
            var createdPerson = await createResponse.Content.ReadFromJsonAsync<PersonDto>();
            personId = createdPerson.PersonId;

            Assert.Equal(HttpStatusCode.Created, createResponse.StatusCode);
            Assert.Equal(createDto.FirstName, createdPerson.FirstName);
            Assert.Equal(createDto.LastName, createdPerson.LastName);
            Assert.Equal(createDto.Email, createdPerson.Email);
            Assert.Equal(createDto.PhoneNumber, createdPerson.PhoneNumber);
        }
        finally
        {
            if (personId is not null)
            {
                await _client.DeleteAsync($"/persons/{personId}");
            }
        }
    }
    
    [Fact]
    public async Task EditPerson_Works()
    {
        var createDto = new CreatePersonDto
        {
            FirstName = "Test",
            LastName = "User",
            Email = "test-user@email.com",
            PhoneNumber = "1-234-567-8900",
        };

        int? personId = null;
        try
        {
            var createResponse = await _client.PostAsJsonAsync("api/persons", createDto);
            createResponse.EnsureSuccessStatusCode();
            var createdPerson = await createResponse.Content.ReadFromJsonAsync<PersonDto>();
            personId = createdPerson.PersonId;

            var editDto = new UpdatePersonDto
            {
                FirstName = "Test upated",
                LastName = "User updated",
                Email = "test-user2@email.com",
                PhoneNumber = "2-234-567-8900",
            };
            var editResponse = await _client.PutAsJsonAsync($"api/persons/{personId}", editDto);
            var editedPerson = await editResponse.Content.ReadFromJsonAsync<PersonDto>();

            Assert.Equal(HttpStatusCode.OK, editResponse.StatusCode);
            Assert.Equal(editDto.FirstName, editedPerson.FirstName);
            Assert.Equal(editDto.LastName, editedPerson.LastName);
            Assert.Equal(editDto.Email, editedPerson.Email);
            Assert.Equal(editDto.PhoneNumber, editedPerson.PhoneNumber);
        }
        finally
        {
            if (personId is not null)
            {
                await _client.DeleteAsync($"/persons/{personId}");
            }
        }
    }
}
