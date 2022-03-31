using MediatR;
using Microsoft.EntityFrameworkCore;
using Saritasa.OMDBScrubber.Domain.Converters;
using Saritasa.OMDBScrubber.Infrastructure;
using Saritasa.OMDBScrubber.Infrastructure.Abstractions;
using Saritasa.OMDBScrubber.Infrastructure.Common;
using Saritasa.OMDBScrubber.Infrastructure.DataAccess;
using Saritasa.OMDBScrubber.UseCases.Queries;

var builder = WebApplication.CreateBuilder(args);

/// <summary>
/// Configuring DI.
/// </summary>
#region DI
builder.Services.AddControllersWithViews();

var omdbCredentials = new OMDBCredentials(builder.Configuration.GetSection("OMDBApiKey").Value);

builder.Services.AddControllersWithViews();

builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.Converters.Add(new DateOnlyConverter());
});

builder.Services.AddDbContext<StorageContext>(x => x.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddTransient<IStorageContext, StorageContext>();

builder.Services.AddTransient<IMovieService, OMDBService>();

builder.Services.AddSingleton(omdbCredentials);

builder.Services.AddMediatR(typeof(ImportImdbMoviesInfoQuery));

builder.Services.AddSwaggerGen();
#endregion

var app = builder.Build();

/// <summary>
/// Configuring request pipeline.
/// </summary>
#region MiddleWare
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger();
    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
        options.RoutePrefix = string.Empty;
    });
}

app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=OMDB}/{action=List}/{id?}");
    endpoints.MapControllerRoute(
        name: "DefaultApi",
        pattern: "api/{controller}/{action}/{id}");
});
#endregion

app.Run();
