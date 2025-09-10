using Microsoft.Azure.Functions.Worker;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using api.Data;
using api.Services;

var host = new HostBuilder()
    .ConfigureFunctionsWebApplication()
    .ConfigureServices((context, services) =>
    {
        services.AddApplicationInsightsTelemetryWorkerService();
        services.ConfigureFunctionsApplicationInsights();

        // Add DbContext
        services.AddDbContext<PersonDbContext>(options =>
            options.UseSqlServer(Environment.GetEnvironmentVariable("ConnectionStrings:DefaultConnection")));

        // Add services
        services.AddScoped<IPersonService, PersonService>();
    })
    .Build();

host.Run();