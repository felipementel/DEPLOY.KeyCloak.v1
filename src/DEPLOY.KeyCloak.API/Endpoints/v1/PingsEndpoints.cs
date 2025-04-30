using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using System.Reflection;

namespace DEPLOY.KeyCloak.API.Endpoints.v1
{
    public static class PingsEndpoints
    {
        public static void MapPingsEndpoints(this IEndpointRouteBuilder app)
        {
            var versionSetPing = app
                .NewApiVersionSet("Ping")
                .Build();

            var api = app
                .MapGroup("/api/pings")
                .WithApiVersionSet(versionSetPing);

            api
                .MapGet("/ping-pong-test", () =>
                {
                    return TypedResults.Ok(new
                    {
                        version = Assembly.GetExecutingAssembly().GetName().Version!.ToString()
                    });
                })
                .WithOpenApi(operation => new(operation)
                {
                    OperationId = "get-ping-pong-test",
                    Summary = "Ping Pong Test",
                    Description = "This is a ping pong test endpoint to check if the API is running.",
                })
            .Produces<string>(200);
        }
    }
}
