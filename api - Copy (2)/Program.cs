using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using api.Data;

var builder = FunctionsApplication.CreateBuilder(args);

// Configure the Azure Functions application to use a web application model.
builder.ConfigureFunctionsWebApplication();

// Register application services with the dependency injection container.
builder.Services
    .AddApplicationInsightsTelemetryWorkerService()
    .ConfigureFunctionsApplicationInsights();

// This section configures the dependency injection for Entity Framework Core.
builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    // Retrieve the connection string from the application's configuration.
    // This looks for "SqlConnectionString" in your local.settings.json or
    // the application settings in Azure.
    options.UseSqlServer(builder.Configuration.GetConnectionString("SqlConnectionString"));
});

var host = builder.Build();

host.Run();
