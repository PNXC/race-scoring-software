using Microsoft.Azure.Functions.Worker;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using api.Data;
using api.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;

public partial class Program
{
    public static void Main(params string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        var connectionString = builder.Configuration.GetConnectionString("PnxcDb");

        var host = new HostBuilder()
            .ConfigureFunctionsWebApplication()
            .ConfigureServices((context, services) =>
            {
                services.AddApplicationInsightsTelemetryWorkerService();
                services.ConfigureFunctionsApplicationInsights();

                // Add DbContext
                services.AddDbContext<PersonDbContext>(options => options.UseSqlServer(connectionString));

                // Add services
                services.AddScoped<IPersonService, PersonService>();
            })
            .Build();

        host.Run();        
    }
}
