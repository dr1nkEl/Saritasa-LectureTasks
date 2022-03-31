using RestSharp;
using RestSharp.Serializers.Json;
using Saritasa.OMDBScrubber.Domain;
using Saritasa.OMDBScrubber.Domain.Converters;
using Saritasa.OMDBScrubber.Infrastructure.Abstractions;
using Saritasa.OMDBScrubber.Infrastructure.Common;
using Saritasa.OMDBScrubber.Infrastructure.Common.ResponseModels;
using Saritasa.Tools.Domain.Exceptions;
using System.Text.Json;

namespace Saritasa.OMDBScrubber.Infrastructure;

/// <inheritdoc>/>.
public class OMDBService : IMovieService
{
    private const string OMDBApiUrl = "https://www.omdbapi.com";
    private readonly RestClient restClient;

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="credentials">Credentials.</param>
    public OMDBService(OMDBCredentials credentials)
    {
        restClient = GetConfiguredClient(credentials);
    }

    /// <inheritdoc/>.
    public async Task<IEnumerable<MovieDto>> GetAsync(IEnumerable<string> ids, CancellationToken cancellationToken)
    {
        var result = new List<Models.MovieDto>();
        foreach (var id in ids)
        {
            try
            {
                result.Add(await GetAsync(id, cancellationToken));
            }
            catch (NotFoundException)
            {
                continue;
            }
            catch (InfrastructureException)
            {
                throw;
            }
        }
        return result.Select(x=>ConvertMovieDtoToParsedMovieDto(x));
    }

    /// <inheritdoc/>.
    public Movie ConvertMovieDtoToMovie(MovieDto movieDto)
    {
        var movie = new Movie()
        {
            CreatedAt = DateTime.UtcNow,
            Genre = movieDto.Genre.ToList(),
            ImdbId = movieDto.ImdbID,
            ImdbRating = movieDto.ImdbRating,
            ReleaseDate = movieDto.ReleaseDate,
            Duration = movieDto.Duration,
            Title = movieDto.Title,
            Actors = movieDto.Actors.Select(x=>new Actor() { Name = x.Name }).ToList()
        };
        return movie;
    }

    private static MovieDto ConvertMovieDtoToParsedMovieDto(Models.MovieDto movieDto)
    {
        var movie = new MovieDto()
        {
            Actors = GetActors(movieDto.Actors),
            Duration = int.TryParse(movieDto.Duration.Split(' ')[0], out int res)? res : 0,
            Genre = movieDto.Genre.Split(',', StringSplitOptions.RemoveEmptyEntries).ToList(),
            ImdbID = movieDto.ImdbID,
            ImdbRating = movieDto.ImdbRating,
            ReleaseDate = movieDto.ReleaseDate,
            Title = movieDto.Title,
        };
        return movie;
    }

    private static IEnumerable<ActorDto> GetActors(string actorsString)
    {
        return actorsString
            .Split(',', StringSplitOptions.RemoveEmptyEntries)
            .Select(x => new ActorDto() { Name = x.Trim() });
    }

    private static RestClient GetConfiguredClient(OMDBCredentials credentials)
    {
        var client = new RestClient(OMDBApiUrl);
        client.AddDefaultParameter("apikey", credentials.ApiToken);
        var options = new JsonSerializerOptions(JsonSerializerDefaults.Web);
        options.Converters.Add(new DateOnlyConverter());
        client.UseSystemTextJson(options);
        return client;
    }

    private async Task<Models.MovieDto> GetAsync(string id, CancellationToken cancellationToken)
    {
        var request = new RestRequest("");
        request.AddParameter("i", id);
        Models.MovieDto result;
        try
        {
            result = await restClient.GetAsync<Models.MovieDto>(request, cancellationToken);
            if (result.ImdbID == null)
            {
                throw new NotFoundException($"${id} not found");
            }
            return result;
        }
        catch (HttpRequestException ex)
        {
            throw new InfrastructureException(ex);
        }
    }
}
