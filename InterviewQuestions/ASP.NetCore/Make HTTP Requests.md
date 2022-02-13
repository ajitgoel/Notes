# Make HTTP requests using IHttpClientFactory in ASP.NET Core

- - 

An [IHttpClientFactory](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.ihttpclientfactory) can be registered and used to configure and create [HttpClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient) instances in an app. `IHttpClientFactory` offers the following benefits:

- Provides a central location for naming and configuring logical `HttpClient` instances. For example, a client named *github* could be registered and configured to access [GitHub](https://github.com/). A default client can be registered for general access.
- Codifies the concept of outgoing middleware via delegating handlers in `HttpClient`. Provides extensions for Polly-based middleware to take advantage of delegating handlers in `HttpClient`.
- Manages the pooling and lifetime of underlying `HttpClientMessageHandler` instances. Automatic management avoids common DNS (Domain Name System) problems that occur when manually managing `HttpClient` lifetimes.
- Adds a configurable logging experience (via `ILogger`) for all requests sent through clients created by the factory.

[View or download sample code](https://github.com/dotnet/AspNetCore.Docs/tree/master/aspnetcore/fundamentals/http-requests/samples) ([how to download](https://docs.microsoft.com/en-us/aspnet/core/introduction-to-aspnet-core?view=aspnetcore-5.0#how-to-download-a-sample)).

The sample code in this topic version uses [System.Text.Json](https://docs.microsoft.com/en-us/dotnet/api/system.text.json) to deserialize JSON content returned in HTTP responses. For samples that use `Json.NET` and `ReadAsAsync<T>`, use the version selector to select a 2.x version of this topic.

## Consumption patterns

There are several ways `IHttpClientFactory` can be used in an app:

- [Basic usage](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/http-requests?view=aspnetcore-5.0#basic-usage)
- [Named clients](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/http-requests?view=aspnetcore-5.0#named-clients)
- [Typed clients](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/http-requests?view=aspnetcore-5.0#typed-clients)
- [Generated clients](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/http-requests?view=aspnetcore-5.0#generated-clients)

The best approach depends upon the app's requirements.

### Basic usage

`IHttpClientFactory` can be registered by calling `AddHttpClient`:

C#Copy

```csharp
public class Startup
{
    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;
    }
    public IConfiguration Configuration { get; }
    public void ConfigureServices(IServiceCollection services)
    {
        services.AddHttpClient();
        // Remaining code deleted for brevity.
```

An `IHttpClientFactory` can be requested using [dependency injection (DI)](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection?view=aspnetcore-5.0). The following code uses `IHttpClientFactory` to create an `HttpClient` instance:

C#Copy

```csharp
public class BasicUsageModel : PageModel
{
    private readonly IHttpClientFactory _clientFactory;
    public IEnumerable<GitHubBranch> Branches { get; private set; }
    public bool GetBranchesError { get; private set; }
    public BasicUsageModel(IHttpClientFactory clientFactory)
    {
        _clientFactory = clientFactory;
    }
    public async Task OnGet()
    {
        var request = new HttpRequestMessage(HttpMethod.Get,
            "https://api.github.com/repos/aspnet/AspNetCore.Docs/branches");
        request.Headers.Add("Accept", "application/vnd.github.v3+json");
        request.Headers.Add("User-Agent", "HttpClientFactory-Sample");
        var client = _clientFactory.CreateClient();
        var response = await client.SendAsync(request);
        if (response.IsSuccessStatusCode)
        {
            using var responseStream = await response.Content.ReadAsStreamAsync();
            Branches = await JsonSerializer.DeserializeAsync
                <IEnumerable<GitHubBranch>>(responseStream);
        }
        else
        {
            GetBranchesError = true;
            Branches = Array.Empty<GitHubBranch>();
        }
    }
}
```

Using `IHttpClientFactory` like in the preceding example is a good way to refactor an existing app. It has no impact on how `HttpClient` is used. In places where `HttpClient` instances are created in an existing app, replace those occurrences with calls to [CreateClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.ihttpclientfactory.createclient).

### Named clients

Named clients are a good choice when:

- The app requires many distinct uses of `HttpClient`.
- Many `HttpClient`s have different configuration.

Configuration for a named `HttpClient` can be specified during registration in `Startup.ConfigureServices`:

services.AddHttpClient(=="github"==, c =>
{
    c.BaseAddress = new Uri("https://api.github.com/");
    // Github API versioning
    c.DefaultRequestHeaders.Add("Accept", "application/vnd.github.v3+json");
    // Github requires a user-agent
    c.DefaultRequestHeaders.Add("User-Agent", "HttpClientFactory-Sample");
});

In the preceding code the client is configured with:

- The base address `https://api.github.com/`.
- Two headers required to work with the GitHub API.

#### CreateClient

Each time [CreateClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.ihttpclientfactory.createclient) is called:

- A new instance of `HttpClient` is created.
- The configuration action is called.

To create a named client, pass its name into `CreateClient`:

public class NamedClientModel : PageModel
{
    private readonly IHttpClientFactory _clientFactory;
    public IEnumerable<GitHubPullRequest> PullRequests { get; private set; }
    public bool GetPullRequestsError { get; private set; }
    public bool HasPullRequests => PullRequests.Any();
    public NamedClientModel(IHttpClientFactory clientFactory)
    {
        _clientFactory = clientFactory;
    }
    public async Task OnGet()
    {
        var request = new HttpRequestMessage(HttpMethod.Get,"repos/aspnet/AspNetCore.Docs/pulls");
        ==var client = _clientFactory.CreateClient("github");==
        var response = await client.SendAsync(request);
        if (response.IsSuccessStatusCode)
        {
            using var responseStream = await response.Content.ReadAsStreamAsync();
            PullRequests = await JsonSerializer.DeserializeAsync<IEnumerable<GitHubPullRequest>>(responseStream);
        }
        else
        {
            GetPullRequestsError = true;
            PullRequests = Array.Empty<GitHubPullRequest>();
        }
    }
}

In the preceding code, the request doesn't need to specify a hostname. The code can pass just the path, since the base address configured for the client is used.

### Typed clients

Typed clients:

- Provide the same capabilities as named clients without the need to use strings as keys.

- Provides IntelliSense and compiler help when consuming clients.

- Provide a single location to configure and interact with a particular

   

  ```
  HttpClient
  ```

  . For example, a single typed client might be used:

  - For a single backend endpoint.
  - To encapsulate all logic dealing with the endpoint.

- Work with DI and can be injected where required in the app.

A typed client accepts an `HttpClient` parameter in its constructor:

C#Copy

```csharp
public class GitHubService
{
    public HttpClient Client { get; }
    public GitHubService(HttpClient client)
    {
        client.BaseAddress = new Uri("https://api.github.com/");
        // GitHub API versioning
        client.DefaultRequestHeaders.Add("Accept","application/vnd.github.v3+json");
        // GitHub requires a user-agent
        client.DefaultRequestHeaders.Add("User-Agent","HttpClientFactory-Sample");
        Client = client;
    }
    public async Task<IEnumerable<GitHubIssue>> GetAspNetDocsIssues()
    {
        var response = await Client.GetAsync("/repos/aspnet/AspNetCore.Docs/issues?state=open&sort=created&direction=desc");
        response.EnsureSuccessStatusCode();
        using var responseStream = await response.Content.ReadAsStreamAsync();
        return await JsonSerializer.DeserializeAsync<IEnumerable<GitHubIssue>>(responseStream);
    }
}
```

If you would like to see code comments translated to languages other than English, let us know in [this GitHub discussion issue](https://github.com/MicrosoftDocs/feedback/issues/2515).

In the preceding code:

- The configuration is moved into the typed client.
- The `HttpClient` object is exposed as a public property.

API-specific methods can be created that expose `HttpClient` functionality. For example, the `GetAspNetDocsIssues` method encapsulates code to retrieve open issues.

The following code calls [AddHttpClient](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.httpclientfactoryservicecollectionextensions.addhttpclient) in `Startup.ConfigureServices` to register a typed client class:

C#Copy

```csharp
services.AddHttpClient<GitHubService>();
```

The typed client is registered as transient with DI. In the preceding code, `AddHttpClient` registers `GitHubService` as a transient service. This registration uses a factory method to:

1. Create an instance of `HttpClient`.
2. Create an instance of `GitHubService`, passing in the instance of `HttpClient` to its constructor.

The typed client can be injected and consumed directly:

C#Copy

```csharp
public class TypedClientModel : PageModel
{
    private readonly GitHubService _gitHubService;
    public IEnumerable<GitHubIssue> LatestIssues { get; private set; }
    public bool HasIssue => LatestIssues.Any();
    public bool GetIssuesError { get; private set; }
    public TypedClientModel(GitHubService gitHubService)
    {
        _gitHubService = gitHubService;
    }
    public async Task OnGet()
    {
        try
        {
            LatestIssues = await _gitHubService.GetAspNetDocsIssues();
        }
        catch(HttpRequestException)
        {
            GetIssuesError = true;
            LatestIssues = Array.Empty<GitHubIssue>();
        }
    }
}
```

The configuration for a typed client can be specified during registration in `Startup.ConfigureServices`, rather than in the typed client's constructor:

C#Copy

```csharp
services.AddHttpClient<RepoService>(c =>
{
    c.BaseAddress = new Uri("https://api.github.com/");
    c.DefaultRequestHeaders.Add("Accept", "application/vnd.github.v3+json");
    c.DefaultRequestHeaders.Add("User-Agent", "HttpClientFactory-Sample");
});
```

The `HttpClient` can be encapsulated within a typed client. Rather than exposing it as a property, define a method which calls the `HttpClient` instance internally:

C#Copy

```csharp
public class RepoService
{
    // _httpClient isn't exposed publicly
    private readonly HttpClient _httpClient;

    public RepoService(HttpClient client)
    {
        _httpClient = client;
    }

    public async Task<IEnumerable<string>> GetRepos()
    {
        var response = await _httpClient.GetAsync("aspnet/repos");

        response.EnsureSuccessStatusCode();

        using var responseStream = await response.Content.ReadAsStreamAsync();
        return await JsonSerializer.DeserializeAsync
            <IEnumerable<string>>(responseStream);
    }
}
```

In the preceding code, the `HttpClient` is stored in a private field. Access to the `HttpClient` is by the public `GetRepos` method.

### Generated clients

`IHttpClientFactory` can be used in combination with third-party libraries such as [Refit](https://github.com/paulcbetts/refit). Refit is a REST library for .NET. It converts REST APIs into live interfaces. An implementation of the interface is generated dynamically by the `RestService`, using `HttpClient` to make the external HTTP calls.

An interface and a reply are defined to represent the external API and its response:

C#Copy

```csharp
public interface IHelloClient
{
    [Get("/helloworld")]
    Task<Reply> GetMessageAsync();
}

public class Reply
{
    public string Message { get; set; }
}
```

A typed client can be added, using Refit to generate the implementation:

C#Copy

```csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddHttpClient("hello", c =>
    {
        c.BaseAddress = new Uri("http://localhost:5000");
    })
    .AddTypedClient(c => Refit.RestService.For<IHelloClient>(c));

    services.AddControllers();
}
```

The defined interface can be consumed where necessary, with the implementation provided by DI and Refit:

C#Copy

```csharp
[ApiController]
public class ValuesController : ControllerBase
{
    private readonly IHelloClient _client;

    public ValuesController(IHelloClient client)
    {
        _client = client;
    }

    [HttpGet("/")]
    public async Task<ActionResult<Reply>> Index()
    {
        return await _client.GetMessageAsync();
    }
}
```

## Make POST, PUT, and DELETE requests

In the preceding examples, all HTTP requests use the GET HTTP verb. `HttpClient` also supports other HTTP verbs, including:

- POST
- PUT
- DELETE
- PATCH

For a complete list of supported HTTP verbs, see [HttpMethod](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpmethod).

The following example shows how to make an HTTP POST request:

C#Copy

```csharp
public async Task CreateItemAsync(TodoItem todoItem)
{
    var todoItemJson = new StringContent(
        JsonSerializer.Serialize(todoItem, _jsonSerializerOptions),
        Encoding.UTF8,
        "application/json");

    using var httpResponse =
        await _httpClient.PostAsync("/api/TodoItems", todoItemJson);

    httpResponse.EnsureSuccessStatusCode();
}
```

In the preceding code, the `CreateItemAsync` method:

- Serializes the `TodoItem` parameter to JSON using `System.Text.Json`. This uses an instance of [JsonSerializerOptions](https://docs.microsoft.com/en-us/dotnet/api/system.text.json.jsonserializeroptions) to configure the serialization process.
- Creates an instance of [StringContent](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.stringcontent) to package the serialized JSON for sending in the HTTP request's body.
- Calls [PostAsync](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient.postasync) to send the JSON content to the specified URL. This is a relative URL that gets added to the [HttpClient.BaseAddress](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient.baseaddress#System_Net_Http_HttpClient_BaseAddress).
- Calls [EnsureSuccessStatusCode](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpresponsemessage.ensuresuccessstatuscode) to throw an exception if the response status code does not indicate success.

`HttpClient` also supports other types of content. For example, [MultipartContent](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.multipartcontent) and [StreamContent](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.streamcontent). For a complete list of supported content, see [HttpContent](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpcontent).

The following example shows an HTTP PUT request:

C#Copy

```csharp
public async Task SaveItemAsync(TodoItem todoItem)
{
    var todoItemJson = new StringContent(
        JsonSerializer.Serialize(todoItem),
        Encoding.UTF8,
        "application/json");

    using var httpResponse =
        await _httpClient.PutAsync($"/api/TodoItems/{todoItem.Id}", todoItemJson);

    httpResponse.EnsureSuccessStatusCode();
}
```

The preceding code is very similar to the POST example. The `SaveItemAsync` method calls [PutAsync](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient.putasync) instead of `PostAsync`.

The following example shows an HTTP DELETE request:

C#Copy

```csharp
public async Task DeleteItemAsync(long itemId)
{
    using var httpResponse =
        await _httpClient.DeleteAsync($"/api/TodoItems/{itemId}");

    httpResponse.EnsureSuccessStatusCode();
}
```

In the preceding code, the `DeleteItemAsync` method calls [DeleteAsync](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient.deleteasync). Because HTTP DELETE requests typically contain no body, the `DeleteAsync` method doesn't provide an overload that accepts an instance of `HttpContent`.

To learn more about using different HTTP verbs with `HttpClient`, see [HttpClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient).

## Outgoing request middleware

`HttpClient` has the concept of delegating handlers that can be linked together for outgoing HTTP requests. `IHttpClientFactory`:

- Simplifies defining the handlers to apply for each named client.
- Supports registration and chaining of multiple handlers to build an outgoing request middleware pipeline. Each of these handlers is able to perform work before and after the outgoing request. This pattern:
  - Is similar to the inbound middleware pipeline in ASP.NET Core.
  - Provides a mechanism to manage cross-cutting concerns around HTTP requests, such as:
    - caching
    - error handling
    - serialization
    - logging

To create a delegating handler:

- Derive from [DelegatingHandler](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.delegatinghandler).
- Override [SendAsync](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.delegatinghandler.sendasync). Execute code before passing the request to the next handler in the pipeline:

C#Copy

```csharp
public class ValidateHeaderHandler : DelegatingHandler
{
    protected override async Task<HttpResponseMessage> SendAsync(
        HttpRequestMessage request,
        CancellationToken cancellationToken)
    {
        if (!request.Headers.Contains("X-API-KEY"))
        {
            return new HttpResponseMessage(HttpStatusCode.BadRequest)
            {
                Content = new StringContent(
                    "You must supply an API key header called X-API-KEY")
            };
        }

        return await base.SendAsync(request, cancellationToken);
    }
}
```

The preceding code checks if the `X-API-KEY` header is in the request. If `X-API-KEY` is missing, [BadRequest](https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode#System_Net_HttpStatusCode_BadRequest) is returned.

More than one handler can be added to the configuration for an `HttpClient` with [Microsoft.Extensions.DependencyInjection.HttpClientBuilderExtensions.AddHttpMessageHandler](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.httpclientbuilderextensions.addhttpmessagehandler):

C#Copy

```csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddTransient<ValidateHeaderHandler>();

    services.AddHttpClient("externalservice", c =>
    {
        // Assume this is an "external" service which requires an API KEY
        c.BaseAddress = new Uri("https://localhost:5001/");
    })
    .AddHttpMessageHandler<ValidateHeaderHandler>();

    // Remaining code deleted for brevity.
```

In the preceding code, the `ValidateHeaderHandler` is registered with DI. The `IHttpClientFactory` creates a separate DI scope for each handler. Handlers can depend upon services of any scope. Services that handlers depend upon are disposed when the handler is disposed.

Once registered, [AddHttpMessageHandler](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.httpclientbuilderextensions.addhttpmessagehandler) can be called, passing in the type for the handler.

Multiple handlers can be registered in the order that they should execute. Each handler wraps the next handler until the final `HttpClientHandler` executes the request:

C#Copy

```csharp
services.AddTransient<SecureRequestHandler>();
services.AddTransient<RequestDataHandler>();

services.AddHttpClient("clientwithhandlers")
    // This handler is on the outside and called first during the 
    // request, last during the response.
    .AddHttpMessageHandler<SecureRequestHandler>()
    // This handler is on the inside, closest to the request being 
    // sent.
    .AddHttpMessageHandler<RequestDataHandler>();
```

Use one of the following approaches to share per-request state with message handlers:

- Pass data into the handler using [HttpRequestMessage.Properties](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httprequestmessage.properties#System_Net_Http_HttpRequestMessage_Properties).
- Use [IHttpContextAccessor](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.http.ihttpcontextaccessor) to access the current request.
- Create a custom [AsyncLocal](https://docs.microsoft.com/en-us/dotnet/api/system.threading.asynclocal-1) storage object to pass the data.

## Use Polly-based handlers

`IHttpClientFactory` integrates with the third-party library [Polly](https://github.com/App-vNext/Polly). Polly is a comprehensive resilience and transient fault-handling library for .NET. It allows developers to express policies such as Retry, Circuit Breaker, Timeout, Bulkhead Isolation, and Fallback in a fluent and thread-safe manner.

Extension methods are provided to enable the use of Polly policies with configured `HttpClient` instances. The Polly extensions support adding Polly-based handlers to clients. Polly requires the [Microsoft.Extensions.Http.Polly](https://www.nuget.org/packages/Microsoft.Extensions.Http.Polly/) NuGet package.

### Handle transient faults

Faults typically occur when external HTTP calls are transient. [AddTransientHttpErrorPolicy](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.pollyhttpclientbuilderextensions.addtransienthttperrorpolicy) allows a policy to be defined to handle transient errors. Policies configured with `AddTransientHttpErrorPolicy` handle the following responses:

- [HttpRequestException](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httprequestexception)
- HTTP 5xx
- HTTP 408

`AddTransientHttpErrorPolicy` provides access to a `PolicyBuilder` object configured to handle errors representing a possible transient fault:

C#Copy

```csharp
public void ConfigureServices(IServiceCollection services)
{           
    services.AddHttpClient<UnreliableEndpointCallerService>()
        .AddTransientHttpErrorPolicy(p => 
            p.WaitAndRetryAsync(3, _ => TimeSpan.FromMilliseconds(600)));

    // Remaining code deleted for brevity.
```

In the preceding code, a `WaitAndRetryAsync` policy is defined. Failed requests are retried up to three times with a delay of 600 ms between attempts.

### Dynamically select policies

Extension methods are provided to add Polly-based handlers, for example, [AddPolicyHandler](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.pollyhttpclientbuilderextensions.addpolicyhandler). The following `AddPolicyHandler` overload inspects the request to decide which policy to apply:

C#Copy

```csharp
var timeout = Policy.TimeoutAsync<HttpResponseMessage>(
    TimeSpan.FromSeconds(10));
var longTimeout = Policy.TimeoutAsync<HttpResponseMessage>(
    TimeSpan.FromSeconds(30));

services.AddHttpClient("conditionalpolicy")
// Run some code to select a policy based on the request
    .AddPolicyHandler(request => 
        request.Method == HttpMethod.Get ? timeout : longTimeout);
```

In the preceding code, if the outgoing request is an HTTP GET, a 10-second timeout is applied. For any other HTTP method, a 30-second timeout is used.

### Add multiple Polly handlers

It's common to nest Polly policies:

C#Copy

```csharp
services.AddHttpClient("multiplepolicies")
    .AddTransientHttpErrorPolicy(p => p.RetryAsync(3))
    .AddTransientHttpErrorPolicy(
        p => p.CircuitBreakerAsync(5, TimeSpan.FromSeconds(30)));
```

In the preceding example:

- Two handlers are added.
- The first handler uses [AddTransientHttpErrorPolicy](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.pollyhttpclientbuilderextensions.addtransienthttperrorpolicy) to add a retry policy. Failed requests are retried up to three times.
- The second `AddTransientHttpErrorPolicy` call adds a circuit breaker policy. Further external requests are blocked for 30 seconds if 5 failed attempts occur sequentially. Circuit breaker policies are stateful. All calls through this client share the same circuit state.

### Add policies from the Polly registry

An approach to managing regularly used policies is to define them once and register them with a `PolicyRegistry`.

In the following code:

- The "regular" and "long" policies are added.
- [AddPolicyHandlerFromRegistry](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.pollyhttpclientbuilderextensions.addpolicyhandlerfromregistry) adds the "regular" and "long" policies from the registry.

C#Copy

```csharp
public void ConfigureServices(IServiceCollection services)
{           
    var timeout = Policy.TimeoutAsync<HttpResponseMessage>(
        TimeSpan.FromSeconds(10));
    var longTimeout = Policy.TimeoutAsync<HttpResponseMessage>(
        TimeSpan.FromSeconds(30));
    
    var registry = services.AddPolicyRegistry();

    registry.Add("regular", timeout);
    registry.Add("long", longTimeout);
    
    services.AddHttpClient("regularTimeoutHandler")
        .AddPolicyHandlerFromRegistry("regular");

    services.AddHttpClient("longTimeoutHandler")
       .AddPolicyHandlerFromRegistry("long");

    // Remaining code deleted for brevity.
```

For more information on `IHttpClientFactory` and Polly integrations, see the [Polly wiki](https://github.com/App-vNext/Polly/wiki/Polly-and-HttpClientFactory).

## HttpClient and lifetime management

A new `HttpClient` instance is returned each time `CreateClient` is called on the `IHttpClientFactory`. An [HttpMessageHandler](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpmessagehandler) is created per named client. The factory manages the lifetimes of the `HttpMessageHandler` instances.

`IHttpClientFactory` pools the `HttpMessageHandler` instances created by the factory to reduce resource consumption. An `HttpMessageHandler` instance may be reused from the pool when creating a new `HttpClient` instance if its lifetime hasn't expired.

Pooling of handlers is desirable as each handler typically manages its own underlying HTTP connections. Creating more handlers than necessary can result in connection delays. Some handlers also keep connections open indefinitely, which can prevent the handler from reacting to DNS (Domain Name System) changes.

The default handler lifetime is two minutes. The default value can be overridden on a per named client basis:

C#Copy

```csharp
public void ConfigureServices(IServiceCollection services)
{           
    services.AddHttpClient("extendedhandlerlifetime")
        .SetHandlerLifetime(TimeSpan.FromMinutes(5));

    // Remaining code deleted for brevity.
```

`HttpClient` instances can generally be treated as .NET objects **not** requiring disposal. Disposal cancels outgoing requests and guarantees the given `HttpClient` instance can't be used after calling [Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose). `IHttpClientFactory` tracks and disposes resources used by `HttpClient` instances.

Keeping a single `HttpClient` instance alive for a long duration is a common pattern used before the inception of `IHttpClientFactory`. This pattern becomes unnecessary after migrating to `IHttpClientFactory`.

### Alternatives to IHttpClientFactory

Using `IHttpClientFactory` in a DI-enabled app avoids:

- Resource exhaustion problems by pooling `HttpMessageHandler` instances.
- Stale DNS problems by cycling `HttpMessageHandler` instances at regular intervals.

There are alternative ways to solve the preceding problems using a long-lived [SocketsHttpHandler](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.socketshttphandler) instance.

- Create an instance of `SocketsHttpHandler` when the app starts and use it for the life of the app.
- Configure [PooledConnectionLifetime](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.socketshttphandler.pooledconnectionlifetime#System_Net_Http_SocketsHttpHandler_PooledConnectionLifetime) to an appropriate value based on DNS refresh times.
- Create `HttpClient` instances using `new HttpClient(handler, disposeHandler: false)` as needed.

The preceding approaches solve the resource management problems that `IHttpClientFactory` solves in a similar way.

- The `SocketsHttpHandler` shares connections across `HttpClient` instances. This sharing prevents socket exhaustion.
- The `SocketsHttpHandler` cycles connections according to `PooledConnectionLifetime` to avoid stale DNS problems.

### Cookies

The pooled `HttpMessageHandler` instances results in `CookieContainer` objects being shared. Unanticipated `CookieContainer` object sharing often results in incorrect code. For apps that require cookies, consider either:

- Disabling automatic cookie handling
- Avoiding `IHttpClientFactory`

Call [ConfigurePrimaryHttpMessageHandler](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.httpclientbuilderextensions.configureprimaryhttpmessagehandler) to disable automatic cookie handling:

C#Copy

```csharp
services.AddHttpClient("configured-disable-automatic-cookies")
    .ConfigurePrimaryHttpMessageHandler(() =>
    {
        return new SocketsHttpHandler()
        {
            UseCookies = false,
        };
    });
```

## Logging

Clients created via `IHttpClientFactory` record log messages for all requests. Enable the appropriate information level in the logging configuration to see the default log messages. Additional logging, such as the logging of request headers, is only included at trace level.

The log category used for each client includes the name of the client. A client named *MyNamedClient*, for example, logs messages with a category of "System.Net.Http.HttpClient.**MyNamedClient**.LogicalHandler". Messages suffixed with *LogicalHandler* occur outside the request handler pipeline. On the request, messages are logged before any other handlers in the pipeline have processed it. On the response, messages are logged after any other pipeline handlers have received the response.

Logging also occurs inside the request handler pipeline. In the *MyNamedClient* example, those messages are logged with the log category "System.Net.Http.HttpClient.**MyNamedClient**.ClientHandler". For the request, this occurs after all other handlers have run and immediately before the request is sent. On the response, this logging includes the state of the response before it passes back through the handler pipeline.

Enabling logging outside and inside the pipeline enables inspection of the changes made by the other pipeline handlers. This may include changes to request headers or to the response status code.

Including the name of the client in the log category enables log filtering for specific named clients.

## Configure the HttpMessageHandler

It may be necessary to control the configuration of the inner `HttpMessageHandler` used by a client.

An `IHttpClientBuilder` is returned when adding named or typed clients. The [ConfigurePrimaryHttpMessageHandler](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.httpclientbuilderextensions.configureprimaryhttpmessagehandler) extension method can be used to define a delegate. The delegate is used to create and configure the primary `HttpMessageHandler` used by that client:

C#Copy

```csharp
public void ConfigureServices(IServiceCollection services)
{            
    services.AddHttpClient("configured-inner-handler")
        .ConfigurePrimaryHttpMessageHandler(() =>
        {
            return new HttpClientHandler()
            {
                AllowAutoRedirect = false,
                UseDefaultCredentials = true
            };
        });

    // Remaining code deleted for brevity.
```

## Use IHttpClientFactory in a console app

In a console app, add the following package references to the project:

- [Microsoft.Extensions.Hosting](https://www.nuget.org/packages/Microsoft.Extensions.Hosting)
- [Microsoft.Extensions.Http](https://www.nuget.org/packages/Microsoft.Extensions.Http)

In the following example:

- [IHttpClientFactory](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.ihttpclientfactory) is registered in the [Generic Host's](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/host/generic-host?view=aspnetcore-5.0) service container.
- `MyService` creates a client factory instance from the service, which is used to create an `HttpClient`. `HttpClient` is used to retrieve a webpage.
- `Main` creates a scope to execute the service's `GetPage` method and write the first 500 characters of the webpage content to the console.

C#Copy

```csharp
using System;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
class Program
{
    static async Task<int> Main(string[] args)
    {
        var builder = new HostBuilder()
            .ConfigureServices((hostContext, services) =>
            {
                services.AddHttpClient();
                services.AddTransient<IMyService, MyService>();
            }).UseConsoleLifetime();

        var host = builder.Build();

        using (var serviceScope = host.Services.CreateScope())
        {
            var services = serviceScope.ServiceProvider;

            try
            {
                var myService = services.GetRequiredService<IMyService>();
                var pageContent = await myService.GetPage();

                Console.WriteLine(pageContent.Substring(0, 500));
            }
            catch (Exception ex)
            {
                var logger = services.GetRequiredService<ILogger<Program>>();

                logger.LogError(ex, "An error occurred.");
            }
        }

        return 0;
    }

    public interface IMyService
    {
        Task<string> GetPage();
    }

    public class MyService : IMyService
    {
        private readonly IHttpClientFactory _clientFactory;

        public MyService(IHttpClientFactory clientFactory)
        {
            _clientFactory = clientFactory;
        }

        public async Task<string> GetPage()
        {
            // Content from BBC One: Dr. Who website (©BBC)
            var request = new HttpRequestMessage(HttpMethod.Get,
                "https://www.bbc.co.uk/programmes/b006q2x0");
            var client = _clientFactory.CreateClient();
            var response = await client.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadAsStringAsync();
            }
            else
            {
                return $"StatusCode: {response.StatusCode}";
            }
        }
    }
}
```

## Header propagation middleware

Header propagation is an ASP.NET Core middleware to propagate HTTP headers from the incoming request to the outgoing HTTP Client requests. To use header propagation:

- Reference the [Microsoft.AspNetCore.HeaderPropagation](https://www.nuget.org/packages/Microsoft.AspNetCore.HeaderPropagation) package.

- Configure the middleware and `HttpClient` in `Startup`:

  C#Copy

  ```csharp
  public void ConfigureServices(IServiceCollection services)
  {
      services.AddControllers();
  
      services.AddHttpClient("MyForwardingClient").AddHeaderPropagation();
      services.AddHeaderPropagation(options =>
      {
          options.Headers.Add("X-TraceId");
      });
  }
  
  public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
  {
      if (env.IsDevelopment())
      {
          app.UseDeveloperExceptionPage();
      }
  
      app.UseHttpsRedirection();
  
      app.UseHeaderPropagation();
  
      app.UseRouting();
  
      app.UseAuthorization();
  
      app.UseEndpoints(endpoints =>
      {
          endpoints.MapControllers();
      });
  }
  ```

- The client includes the configured headers on outbound requests:

  C#Copy

  ```csharp
  var client = clientFactory.CreateClient("MyForwardingClient");
  var response = client.GetAsync(...);
  ```

## Additional resources

- [Use HttpClientFactory to implement resilient HTTP requests](https://docs.microsoft.com/en-us/dotnet/standard/microservices-architecture/implement-resilient-applications/use-httpclientfactory-to-implement-resilient-http-requests)
- [Implement HTTP call retries with exponential backoff with HttpClientFactory and Polly policies](https://docs.microsoft.com/en-us/dotnet/standard/microservices-architecture/implement-resilient-applications/implement-http-call-retries-exponential-backoff-polly)
- [Implement the Circuit Breaker pattern](https://docs.microsoft.com/en-us/dotnet/standard/microservices-architecture/implement-resilient-applications/implement-circuit-breaker-pattern)
- [How to serialize and deserialize JSON in .NET](https://docs.microsoft.com/en-us/dotnet/standard/serialization/system-text-json-how-to)