# Use IHttpClientFactory to implement resilient HTTP requests

[IHttpClientFactory](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.ihttpclientfactory) is a contract implemented by `DefaultHttpClientFactory`, an opinionated factory, available since .NET Core 2.1, for creating [HttpClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient) instances to be used in your applications.

## Issues with the original HttpClient class available in .NET

The original and well-known [HttpClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient) class can be easily used, but in some cases, it isn't being properly used by many developers.

==Though this class implements `IDisposable`, declaring and instantiating it within a `using` statement is not preferred because when the `HttpClient` object gets disposed of, the underlying socket is not immediately released, which can lead to a *socket exhaustion* problem==. For more information about this issue, see the blog post [You're using HttpClient wrong and it's destabilizing your software](https://aspnetmonsters.com/2016/08/2016-08-27-httpclientwrong/).

==Therefore, `HttpClient` is intended to be instantiated once and reused throughout the life of an application. Instantiating an `HttpClient` class for every request will exhaust the number of sockets available under heavy loads.== That issue will result in `SocketException` errors. ==Possible approaches to solve that problem are based on the creation of the `HttpClient` object as singleton or static==, as explained in this [Microsoft article on HttpClient usage](https://docs.microsoft.com/en-us/dotnet/csharp/tutorials/console-webapiclient). This can be a good solution for short-lived console apps or similar, that run a few times a day.

Another issue that developers run into is when using a shared instance of `HttpClient` in long-running processes. In a situation where the HttpClient is instantiated as a singleton or a static object, it fails to handle the DNS changes as described in this [issue](https://github.com/dotnet/runtime/issues/18348) of the dotnet/runtime GitHub repository.

However, the issue isn't really with `HttpClient` per se, but with the [default constructor for HttpClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient.-ctor?view=netcore-3.1#System_Net_Http_HttpClient__ctor), because it creates a new concrete instance of [HttpMessageHandler](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpmessagehandler), which is the one that has *sockets exhaustion* and DNS changes issues mentioned above.

==To address the issues mentioned above and to make `HttpClient` instances manageable, .NET Core 2.1 introduced the [IHttpClientFactory](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.ihttpclientfactory) interface which can be used to configure and create `HttpClient` instances in an app through Dependency Injection (DI).== It also provides extensions for Polly-based middleware to take advantage of delegating handlers in HttpClient.

[Polly](http://www.thepollyproject.org/) is a transient-fault-handling library that helps developers add resiliency to their applications, by using some pre-defined policies in a fluent and thread-safe manner.

## Benefits of using IHttpClientFactory

The current implementation of [IHttpClientFactory](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.ihttpclientfactory), that also implements [IHttpMessageHandlerFactory](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.ihttpmessagehandlerfactory), offers the following benefits:

- Provides a central location for naming and configuring logical `HttpClient` objects. For example, you may configure a client (Service Agent) that's pre-configured to access a specific microservice.
- Codify the concept of outgoing middleware via delegating handlers in `HttpClient` and implementing Polly-based middleware to take advantage of Polly's policies for resiliency.
- `HttpClient` already has the concept of delegating handlers that could be linked together for outgoing HTTP requests. You can register HTTP clients into the factory and you can use a Polly handler to use Polly policies for Retry, CircuitBreakers, and so on.
- Manage the lifetime of [HttpMessageHandler](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpmessagehandler) to avoid the mentioned problems/issues that can occur when managing `HttpClient` lifetimes yourself.

 Tip

The `HttpClient` instances injected by DI, can be disposed of safely, because the associated `HttpMessageHandler` is managed by the factory. As a matter of fact, injected `HttpClient` instances are *Scoped* from a DI perspective.