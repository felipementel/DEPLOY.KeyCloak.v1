using Asp.Versioning;
using DEPLOY.KeyCloak.API.Endpoints.v1;
using Keycloak.AuthServices.Authentication;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.OpenApi;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Scalar.AspNetCore;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();

builder.Services.AddRouting(opt =>
{
    opt.LowercaseUrls = true;
    opt.LowercaseQueryStrings = true;
});

builder.Services
    .AddApiVersioning(options =>
    {
        options.DefaultApiVersion = new ApiVersion(1, 0);
        options.AssumeDefaultVersionWhenUnspecified = true;
        options.ReportApiVersions = true;
    })
    .AddApiExplorer(options =>
    {
        options.GroupNameFormat = "'v'VVV";
        options.SubstituteApiVersionInUrl = true;
    });

builder.Services.AddOpenApi("v1", options =>
{
    options.AddDocumentTransformer<BearerSecuritySchemeTransformer>();
});

builder.Services.AddAuthorization();

// Add services to the container.
builder.Services.AddKeycloakWebApiAuthentication(
    builder.Configuration.GetSection(KeycloakAuthenticationOptions.Section), options =>
{
    options.RequireHttpsMetadata = false; // Use false apenas em desenvolvimento
    options.Authority = builder.Configuration["KeyCloak:auth-server-url"] +
        "realms/" +
        builder.Configuration["KeyCloak:realm"];
    options.Audience = builder.Configuration["KeyCloak:resource"];
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidIssuer = builder.Configuration["KeyCloak:auth-server-url"] +
            "realms/" +
            builder.Configuration["KeyCloak:realm"],
        ValidateAudience = true,
        ValidAudience = builder.Configuration["KeyCloak:resource"],
        ValidateLifetime = true
    };
});

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}
else
{
    app.UseHttpsRedirection();
}

app.MapScalarApiReference(options =>
{
    options
    .WithTitle("Canal DEPLOY - DEPLOY.KeyCloak.API")
    .WithTheme(ScalarTheme.Saturn)
    .WithPreferredScheme("Bearer")
    .WithHttpBearerAuthentication(bearer =>
    {
        //bearer.Token = "...";
    });

    options.WithDefaultHttpClient(ScalarTarget.CSharp, ScalarClient.HttpClient);
});

app.MapPingsEndpoints();

app.MapNumbersEndpoints();

app.UseAuthentication();
app.UseAuthorization();

await app.RunAsync();

[ExcludeFromCodeCoverage]
public partial class Program { }

[ExcludeFromCodeCoverage]
internal sealed class BearerSecuritySchemeTransformer(
    IAuthenticationSchemeProvider authenticationSchemeProvider) : IOpenApiDocumentTransformer
{
    public async Task TransformAsync(
        OpenApiDocument document,
        OpenApiDocumentTransformerContext context,
        CancellationToken cancellationToken)
    {
        var authenticationSchemes = await authenticationSchemeProvider.GetAllSchemesAsync();
        if (authenticationSchemes
            .Any(authScheme => authScheme.Name == "Bearer"))
        {
            var requirements = new Dictionary<string, OpenApiSecurityScheme>
            {
                ["Bearer"] = new OpenApiSecurityScheme
                {
                    Type = SecuritySchemeType.Http,
                    Scheme = "Bearer",
                    In = ParameterLocation.Header,
                    BearerFormat = "JWT - Json Web Token"
                }
            };
            document.Components ??= new OpenApiComponents();
            document.Components.SecuritySchemes = requirements;

            foreach (var operation in document.Paths.Values.SelectMany(path => path.Operations))
            {
                operation.Value.Security.Add(new OpenApiSecurityRequirement
                {
                    [new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Id = "Bearer",
                            Type = ReferenceType.SecurityScheme
                        }
                    }] = Array.Empty<string>()
                });
            }
        }
    }
}
