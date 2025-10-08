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
}
