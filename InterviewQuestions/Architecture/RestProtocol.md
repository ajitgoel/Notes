**What is a REST API? **
**\*REST\* is an acronym for \*Representational State Transfer\* — an almost meaningless description of the most-used web service technology! A REST API is a way for two computer systems to communicate over HTTP in a similar way to web browsers and servers.**

Sharing data between two or more systems has always been a fundamental requirement of software development. For example, consider buying motor insurance. Your insurer must obtain information about you and your vehicle so they request data from car registration authorities, credit agencies, banks, and other systems. All this happens transparently in real-time to determine whether a policy can be offered.

## REST API Example

Open the following link in your browser to request a random programming joke:

https://official-joke-api.appspot.com/jokes/programming/random

This is a public API implemented as RESTful web service (it follows REST conventions). Your browser will show an *awful* JSON-formatted programming joke, such as:

```javascript
[
  {
    "id": 29,
    "type": "programming",
    "setup": "There are 10 types of people in this world...",
    "punchline": "Those who understand binary and those who don't"
  }
]
```

You could request the same URL and get a response using any HTTP client, such as [curl](https://curl.haxx.se/):

```bash
curl "https://official-joke-api.appspot.com/jokes/programming/random"
```

HTTP client libraries are available in all popular languages and runtimes including [Fetch in JavaScript](https://developer.mozilla.org/docs/Web/API/Fetch_API) and [file_get_contents() in PHP](https://www.php.net/manual/en/function.file-get-contents.php). A JSON response is machine-readable so it can be parsed and output in HTML or any other format.

## REST APIs and the Rest

Various data communication standards have evolved over the years. You may have encountered standards including [CORBA](https://www.corba.org/), [SOAP](https://en.wikipedia.org/wiki/SOAP), or [XML-RPC](http://xmlrpc.com/), which usually established strict messaging rules.

REST was defined in 2000 by Roy Fielding and is considerably simpler. It’s not a standard but a set of recommendations and constraints for RESTful web services. These include:

1. **Client-Server**. SystemA makes an HTTP request to a URL hosted by SystemB, which returns a response.

   It’s identical to how a browser works. The application makes a request for a specific URL. The request is routed to a web server that returns an HTML page. That page may contain references to images, style sheets, and JavaScript, which incur further requests and responses.

2. **Stateless**. REST is stateless: the client request should contain all the information necessary to respond to a request. In other words, it should be possible to make two or more HTTP requests in any order and the same responses will be received.

3. **Cacheable**. A response should be defined as cacheable or not.

4. **Layered**. The requesting client need not know whether it’s communicating with the actual server, a proxy, or any other intermediary.

   

## Creating a RESTful Web Service

A RESTful web service **request** contains:

1. **An Endpoint URL**. An application implementing a RESTful API will define one or more URL endpoints with a domain, port, path, and/or querystring — for example, `https://mydomain/user/123?format=json`.

2. **The HTTP method**. Differing HTTP methods can be used on any endpoint which map to application create, read, update, and delete (CRUD) operations:

   | HTTP method  |  CRUD  |           Action           |
   | :----------: | :----: | :------------------------: |
   |     GET      |  read  |   returns requested data   |
   |     POST     | create |    creates a new record    |
   | PUT or PATCH | update | updates an existing record |
   |    DELETE    | delete | deletes an existing record |

   Examples:

   - a GET request to `/user/` returns a list of registered users on a system
   - a POST request to `/user/123` creates a user with the ID `123` using the [body data](https://www.sitepoint.com/developers-rest-api/#body-data)
   - a PUT request to `/user/123` updates user `123` with the [body data](https://www.sitepoint.com/developers-rest-api/#body-data)
   - a GET request to `/user/123` returns the details of user `123`
   - a DELETE request to `/user/123` deletes user `123`

3. **HTTP headers**. Information such as [authentication tokens](https://www.sitepoint.com/developers-rest-api/#authentication) or cookies can be contained in the HTTP request header.

4. **Body Data**. Data is normally transmitted in the HTTP body in an identical way to HTML `<form>` submissions or by sending a single JSON-encoded data string.

### REST API Response

The **response** payload can be whatever is practical: data, HTML, an image, an audio file, and so on. Data responses are typically JSON-encoded, but XML, CSV, simple strings, or any other format can be used. You could allow the return format to be specified in the request — for example, `/user/123?format=json` or `/user/123?format=xml`.

An appropriate [HTTP status code](https://developer.mozilla.org/docs/Web/HTTP/Status) should also be set in the response header. `200 OK` is most often used for successful requests, although `201 Created` may also be returned when a record is created. Errors should return an appropriate code such as `400 Bad Request`, `404 Not Found`, `401 Unauthorized`, and so on.

Other HTTP headers can be set including the [Cache-Control](https://developer.mozilla.org/docs/Web/HTTP/Headers/Cache-Control) or [Expires](https://developer.mozilla.org/docs/Web/HTTP/Headers/Expires) directives to specify how long a response can be cached before it’s considered *stale*.

However, there are no strict rules. Endpoint URLs, HTTP methods, body data, and response types can be implemented as you like. For example, POST, PUT, and PATCH are often used interchangeably so any will create or update a record.

## REST API “Hello World” Example

The following code creates a RESTful web service using the [Node.js Express framework](https://expressjs.com/). A single `/hello/` endpoint responds to GET requests.

Ensure you have [Node.js](https://nodejs.org/en/) installed, then create a new folder named `restapi`. Create a new `package.json` file within that folder with the following content:

```javascript
{
  "name": "restapi",
  "version": "1.0.0",
  "description": "REST test",
  "scripts": {
    "start": "node ./index.js"
  },
  "dependencies": {
    "express": "4.17.1"
  }
}
```

Run `npm install` from the command line to fetch the dependencies, then create an `index.js` file with the following code:



```javascript
// simple Express.js RESTful API
'use strict';

// initialize
const
  port = 8888,
  express = require('express'),
  app = express();

// /hello/ GET request
app.get('/hello/:name?', (req, res) =>
  res.json(
    { message: `Hello ${req.params.name || 'world'}!` }
  )
);

// start server
app.listen(port, () =>
  console.log(`Server started on port ${port}`);
);
```

Launch the application from the command line using `npm start` and open `http://localhost:8888/hello/` in a browser. The following JSON is displayed in response to the GET request:

![img](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAZCAYAAAAxFw7TAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEDklEQVQ4y51USVMbZxDVL4PROkLroNE2Gi2MhITQghBISCAkBCpDsLHjtXBycKUcJ4c4OSZk4ZBU5eJKJX/ppbsHCcRy8eFVf/PNzPted7/+HIuLi7iJhYWFe3HzPUe32w2fzzeDx+OBoihw3CSZI1duYLq3YH/LP/r9fmiaJohEIggEAnC5XHBMiRT60elW4Pa64FFd8C65BR6/G26fCy6PE4pTmZGzQiZlqKp6rZA/cnmd8AY88Ed8CMRUBHU/QnEbvOa9Jc0HNeSBmw5zupR55Tfg8AU98nGQCZJ+hFNLc4ikAxJDSUKCyJdV+IiYRTDp7Vo7Qokl6DkN5moKGUYpiXQxgdSKjiSB17xvUOR12qJ3BR2ReJBK46Yy3FLICvJrJrYHm+gddLAz2sbWXgsbvTpq22tYb5fR3m2is9+W/c1+A43uOsxSStRyCRTlFmGhaqI/7uLo9ADjkyH6RDwl2NipoTvcwvDRHmGAwVEf3f0tlJsW4rllBDTVTl/cckW4sp7F/mQXx08nOPxiJAQtUrhDkQ/aHe9gRGSTx2M5dDDpS0bFegGaEZZmSaOmCrPltKjhlDuDNprdGqqbqxLbuxsSN/tNec/fNTpVVKkUuYoBLRMWF7DVZoSJ/DKlnSWlOeTWMtIgg5pj0kG5Skaakqf9Yj0ve/G8hlg2QmQhcQE3Vg15xadCqGej1N2UIG3F5QCGdPiq63wAI077QnLLYmw9ruU1Iakwr+zBdmHbZMuGKOeSMDG/S5V0JEoadIsUZkMznwZ1VabqAcKYEEqatbzUyiynsNLKoHpYQPOsiPrpCqwepV+MIGIEZDB4SOYIGeliHMkCEVLqbKdSoyA+tVom2k8rmHzs4OxiH09+Jhu938Dq0ESsEJYxVcPe+wivFFq2QosVUqzs5XHwYRNv/nyEbz+9xvtPr/Di8hDd8zWkazEZS27MHcK5GlbsGpqVFMrDLA5/aOPrvx/j47/v8ON/73D+1wn2vmkg24oL4QMpJyRlVmk3xaT9JIo9A8MPLSI5xvf/nOM7wsvLI3Tf2gqDsQeaMiXklNmDPEXc4Ww9KTU8/qmH57+P8ezXkZSgPKIa5sNYivrkzrQJc1EhM1fTs5SZmNVZtZyYmZtVaBmoTSy0npXQfGKhuGsgXooiTFcbpyvGZg+x61mFpEzd5fpx5JS5w3wIG51Vp0ox8mEUevHah3Lr+K5Gjwk1IyQTkCjY4PoluI4F248xKsmyGZaR4xhJBWYTIv4LeORelAvWoIIa9RgyDR1mIw6zmUBug2pGUZ4JmbpO3+jXa/6HwM1IrEahmSH7EErdwV26g6/u2SN07jxX0HlD69fr6L6qYftlBY6Tiw4+C7/YOL3o4cs/Rnh+OcbZb3v4H7VoFcDr30T8AAAAAElFTkSuQmCC)

![img](Untitled.assets/e1b3ca951f0830262d88a4cb947a7bee041bc85e-1600x2000.png)

### Node.js: Tools & Skills, 2nd Edition

🧑‍💻NodeJS: "It's the JavaScript full stack answer to your coding challenges"

[Read the book now](https://www.sitepoint.com/premium/books/node-js-tools-skills-2nd-edition/read)

```javascript
{
  "message": "Hello world!"
}
```

The API also allows a custom name, so `http://localhost:8888/hello/everyone/` returns:

```javascript
{
  "message": "Hello everyone!"
}
```

## Client-side REST API Requests and CORS

Consider the following HTML page launched in a browser at the URL `http://localhost:8888/`:

```markup
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>REST test</title>
</head>
<body>
<script>
fetch('http://localhost:8888/hello/')
  .then((response) => {
    return response.json();
  })
  .then((json) => {
    console.log(json);
  });
</script>
</body>
</html>
```

The `fetch` call makes the same API request and browser console shows `Object { message: "Hello world!" }` as you would expect.

However, presume your RESTful web service was now put live on the Web at the domain `http://mydomain.com/hello/`. The page JavaScript `fetch()` URL is changed accordingly, but opening `http://localhost:8888/` in the browser now returns the console error **Cross-Origin Request Blocked**.

For security, browsers only permit client-side [XMLHttpRequest](https://developer.mozilla.org/docs/Web/API/XMLHttpRequest) and [Fetch API](https://developer.mozilla.org/docs/Web/API/Fetch_API) calls to the same domain where the page is hosted.

Fortunately, [Cross-origin Resource Sharing (CORS)](https://developer.mozilla.org/docs/Web/HTTP/CORS) allows us to circumvent that security restriction. Setting an `Access-Control-Allow-Origin` HTTP response header tells the browsers permit the request. It can be set to a specific domain or `*` for all domains (done by the Joke API above).

The web service API code can therefore be changed to allow access from any client-side script running on any domain:

```javascript
// /hello/ GET request
app.get('/hello/:name?', (req, res) =>
  res
    .append('Access-Control-Allow-Origin', '*')
    .json(
      { message: `Hello ${req.params.name || 'world'}!` }
    )
);
```

Alternatively, an Express.js middleware function could append the header to every endpoint request:

```javascript
// enable CORS
app.use((req, res, next) => {
  res.append('Access-Control-Allow-Origin', '*');
  next();
});

// /hello/ GET request
// ...
```

## REST API Challenges

The success of REST owes much to its simplicity. Developers are free to implement RESTful APIs as they like, but that can lead to further challenges.

### REST Endpoint Consensus

Consider the following endpoints:

- `/user/123`
- `/user/id/123`
- `/user/?id=123`

All are valid options to fetch data for user `123`. The number of combinations increase further when you have more complex operations. For example, return ten users whose surnames start with ‘A’ and work for companyX starting at record 51 when ordered by date of birth in reverse chronological order.

Ultimately, it doesn’t matter how you format URLs, but consistency across your API is important. That can be difficult to achieve on large codebases with many developers.



### REST API Versioning

API changes are inevitable, but endpoint URLs should never be invalidated when they’re being used internally and/or by third-party applications.

APIs are often versioned to avoid compatibility issues — such as `/2.0/user/123` supersedes `/user/123` — but the old endpoint remains active. However, this increases the workload, as multiple APIs are maintained. Older APIs can eventually be scrapped, but the process requires careful planning.

### REST API Authentication

The Joke API shown above is *open*: any system can fetch a joke without authorization. This is not viable for APIs which access private data or permit update and delete requests.

Client-side applications on the same domain as the RESTful API will send and receive cookies just like any other HTTP request. (Note that `Fetch()` in older browsers requires the `credentials` [init option](https://developer.mozilla.org/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Parameters) to be set.) An API request can therefore be validated to ensure a user is logged in and has appropriate rights.

Third-party applications must use alternative methods of authorization. Common [authentication options](https://swagger.io/docs/specification/authentication/) include:

1. **[HTTP basic authentication](https://swagger.io/docs/specification/authentication/basic-authentication/)**. An HTTP `Authorization` header containing a base64-encoded username:password string is passed in the request header.
2. **[API keys](https://swagger.io/docs/specification/authentication/api-keys/)**. A third-party application is granted permission to use an API by issuing a key which may have specific rights or be restricted to a particular domain. The key is passed in every request in the HTTP header or on the querystring.
3. **[OAuth](https://oauth.net/)**. A token is obtained before any request can be made by sending a client ID and possibly a client secret to an OAuth server. The OAuth token is then sent with each API request until it expires.
4. **[JSON Web Tokens (JWT)](https://jwt.io/)**. Digitally-signed authentication tokens are securely transmitted in both the request and response header.

API authentication will vary depending on the use context. In some cases, the third-party application is considered to be another logged-in user with specific rights and permissions — for example, when generating directions from a map API. In other cases, the third-party application is being used by a registered user and can only access their data — for example, when fetching email content or documents.

### REST API Security

A RESTful API provides another route to access and manipulate your application. Even if it’s not an interesting hacking target, a badly behaved client could send thousands of requests every second and crash your server.

Security is beyond the scope of this article, but common best practises include:

- use HTTPS
- use a robust [authentication method](https://www.sitepoint.com/developers-rest-api/#authentication)
- use [CORS](https://www.sitepoint.com/developers-rest-api/#client-side-rest-requests-and-cors) to limit client-side calls to specific domains
- provide minimum functionality — that is, don’t create a DELETE options which are not required
- validate all endpoint URLs and body data
- avoid exposing API tokens in client-side JavaScript
- block access from unknown domains or IP addresses
- block unexpectedly large payloads
- consider rate-limiting — that is, requests using the same API token or IP address are limited to N per minute
- respond with an appropriate [HTTP status code](https://developer.mozilla.org/docs/Web/HTTP/Status) and [caching](https://developer.mozilla.org/docs/Web/HTTP/Headers/Cache-Control) header
- log requests and investigate failures.

### Multiple Requests and Unnecessary Data

RESTful APIs are limited by their implementation. A response may contain more data than you need, or require further requests to access all data.

Consider a RESTful API that provides access to author and book data. To show data for the top 10 selling books, the client will:

1. Request the first 10 `/book/` details ordered by number of sales (top seller first). The response contains a list of books with each author ID.
2. Make up to 10 `/author/{id}` requests to fetch each author’s name.

This is known as the *N+1 problem*; N API requests must be made for each result in the parent request.

If this is a common use case, the RESTful API could be changed so that every returned book contained the full author details such as their name, age, country, biography, and so on. It could also provide full details of their other books — although *this would considerably increase the response payload!*

To avoid massive responses, the API could be adjusted so author details can be controlled — for example, `?author_details=basic` — but the number of options can quickly become bewildering.

## Does GraphQL Fix REST APIs?

These REST conundrums led Facebook to create [GraphQL](https://graphql.org/) — a web service query language. Think of it as SQL for web services; a single request defines what data you need and how you want it returned.

GraphQL addresses many of the challenges posed by RESTful APIs. That said, few companies have problems comparable to Facebook. It’s worth considering GraphQL once your RESTful API evolves beyond its simple starting point.

## REST API Links and Development Tools

To get your hands dirty with REST API design, we recommend [RESTful Web API Design with Node.js](https://www.sitepoint.com/premium/books/restful-web-api-design-with-node-js-10-third-edition?utm_source=blog&utm_medium=articles). Start building functional APIs with the JavaScript you already know.

There are numerous tools to help with RESTful API development in all languages. Notable options include:

- **[Swagger](https://swagger.io/)**: a variety of tools to help design, document, mock, test, and monitor REST APIs
- **[Postman](https://www.getpostman.com/downloads/)**: a RESTful API testing application
- **[Postwoman](https://postwoman.io/)**: an open-source, web-based alternative to Postman.

There are plenty of public REST APIs catering for jokes, currency conversion, geocoding, government data, and every topic you can think of. Many are free, although some require you to sign up for an API key or use other authentication methods. Categorized lists include:

- [Any API](https://any-api.com/)
- [API list](https://apilist.fun/)
- [Public API](https://public-apis.xyz/)
- [Public APIs](https://github.com/public-apis/public-apis)
- [Rapid API](https://rapidapi.com/)
- [Google APIs Explorer](https://developers.google.com/apis-explorer/)

Try consuming a few RESTful APIs in your own projects before implementing your own web services.**What is a REST API? \*REST\* is an acronym for \*Representational State Transfer\* — an almost meaningless description of the most-used web service technology! A REST API is a way for two computer systems to communicate over HTTP in a similar way to web browsers and servers.**

Sharing data between two or more systems has always been a fundamental requirement of software development. For example, consider buying motor insurance. Your insurer must obtain information about you and your vehicle so they request data from car registration authorities, credit agencies, banks, and other systems. All this happens transparently in real-time to determine whether a policy can be offered.

## REST API Example

Open the following link in your browser to request a random programming joke:

https://official-joke-api.appspot.com/jokes/programming/random

This is a public API implemented as RESTful web service (it follows REST conventions). Your browser will show an *awful* JSON-formatted programming joke, such as:

```javascript
[
  {
    "id": 29,
    "type": "programming",
    "setup": "There are 10 types of people in this world...",
    "punchline": "Those who understand binary and those who don't"
  }
]
```

You could request the same URL and get a response using any HTTP client, such as [curl](https://curl.haxx.se/):

```bash
curl "https://official-joke-api.appspot.com/jokes/programming/random"
```

HTTP client libraries are available in all popular languages and runtimes including [Fetch in JavaScript](https://developer.mozilla.org/docs/Web/API/Fetch_API) and [file_get_contents() in PHP](https://www.php.net/manual/en/function.file-get-contents.php). A JSON response is machine-readable so it can be parsed and output in HTML or any other format.

## REST APIs and the Rest

Various data communication standards have evolved over the years. You may have encountered standards including [CORBA](https://www.corba.org/), [SOAP](https://en.wikipedia.org/wiki/SOAP), or [XML-RPC](http://xmlrpc.com/), which usually established strict messaging rules.

REST was defined in 2000 by Roy Fielding and is considerably simpler. It’s not a standard but a set of recommendations and constraints for RESTful web services. These include:

1. **Client-Server**. SystemA makes an HTTP request to a URL hosted by SystemB, which returns a response.

   It’s identical to how a browser works. The application makes a request for a specific URL. The request is routed to a web server that returns an HTML page. That page may contain references to images, style sheets, and JavaScript, which incur further requests and responses.

2. **Stateless**. REST is stateless: the client request should contain all the information necessary to respond to a request. In other words, it should be possible to make two or more HTTP requests in any order and the same responses will be received.

3. **Cacheable**. A response should be defined as cacheable or not.

4. **Layered**. The requesting client need not know whether it’s communicating with the actual server, a proxy, or any other intermediary.

   

## Creating a RESTful Web Service

A RESTful web service **request** contains:

1. **An Endpoint URL**. An application implementing a RESTful API will define one or more URL endpoints with a domain, port, path, and/or querystring — for example, `https://mydomain/user/123?format=json`.

2. **The HTTP method**. Differing HTTP methods can be used on any endpoint which map to application create, read, update, and delete (CRUD) operations:

   | HTTP method  |  CRUD  |           Action           |
   | :----------: | :----: | :------------------------: |
   |     GET      |  read  |   returns requested data   |
   |     POST     | create |    creates a new record    |
   | PUT or PATCH | update | updates an existing record |
   |    DELETE    | delete | deletes an existing record |

   Examples:

   - a GET request to `/user/` returns a list of registered users on a system
   - a POST request to `/user/123` creates a user with the ID `123` using the [body data](https://www.sitepoint.com/developers-rest-api/#body-data)
   - a PUT request to `/user/123` updates user `123` with the [body data](https://www.sitepoint.com/developers-rest-api/#body-data)
   - a GET request to `/user/123` returns the details of user `123`
   - a DELETE request to `/user/123` deletes user `123`

3. **HTTP headers**. Information such as [authentication tokens](https://www.sitepoint.com/developers-rest-api/#authentication) or cookies can be contained in the HTTP request header.

4. **Body Data**. Data is normally transmitted in the HTTP body in an identical way to HTML `<form>` submissions or by sending a single JSON-encoded data string.

### REST API Response

The **response** payload can be whatever is practical: data, HTML, an image, an audio file, and so on. Data responses are typically JSON-encoded, but XML, CSV, simple strings, or any other format can be used. You could allow the return format to be specified in the request — for example, `/user/123?format=json` or `/user/123?format=xml`.

An appropriate [HTTP status code](https://developer.mozilla.org/docs/Web/HTTP/Status) should also be set in the response header. `200 OK` is most often used for successful requests, although `201 Created` may also be returned when a record is created. Errors should return an appropriate code such as `400 Bad Request`, `404 Not Found`, `401 Unauthorized`, and so on.

Other HTTP headers can be set including the [Cache-Control](https://developer.mozilla.org/docs/Web/HTTP/Headers/Cache-Control) or [Expires](https://developer.mozilla.org/docs/Web/HTTP/Headers/Expires) directives to specify how long a response can be cached before it’s considered *stale*.

However, there are no strict rules. Endpoint URLs, HTTP methods, body data, and response types can be implemented as you like. For example, POST, PUT, and PATCH are often used interchangeably so any will create or update a record.

## REST API “Hello World” Example

The following code creates a RESTful web service using the [Node.js Express framework](https://expressjs.com/). A single `/hello/` endpoint responds to GET requests.

Ensure you have [Node.js](https://nodejs.org/en/) installed, then create a new folder named `restapi`. Create a new `package.json` file within that folder with the following content:

```javascript
{
  "name": "restapi",
  "version": "1.0.0",
  "description": "REST test",
  "scripts": {
    "start": "node ./index.js"
  },
  "dependencies": {
    "express": "4.17.1"
  }
}
```

Run `npm install` from the command line to fetch the dependencies, then create an `index.js` file with the following code:



```javascript
// simple Express.js RESTful API
'use strict';

// initialize
const
  port = 8888,
  express = require('express'),
  app = express();

// /hello/ GET request
app.get('/hello/:name?', (req, res) =>
  res.json(
    { message: `Hello ${req.params.name || 'world'}!` }
  )
);

// start server
app.listen(port, () =>
  console.log(`Server started on port ${port}`);
);
```

Launch the application from the command line using `npm start` and open `http://localhost:8888/hello/` in a browser. The following JSON is displayed in response to the GET request:

![img](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAZCAYAAAAxFw7TAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEDklEQVQ4y51USVMbZxDVL4PROkLroNE2Gi2MhITQghBISCAkBCpDsLHjtXBycKUcJ4c4OSZk4ZBU5eJKJX/ppbsHCcRy8eFVf/PNzPted7/+HIuLi7iJhYWFe3HzPUe32w2fzzeDx+OBoihw3CSZI1duYLq3YH/LP/r9fmiaJohEIggEAnC5XHBMiRT60elW4Pa64FFd8C65BR6/G26fCy6PE4pTmZGzQiZlqKp6rZA/cnmd8AY88Ed8CMRUBHU/QnEbvOa9Jc0HNeSBmw5zupR55Tfg8AU98nGQCZJ+hFNLc4ikAxJDSUKCyJdV+IiYRTDp7Vo7Qokl6DkN5moKGUYpiXQxgdSKjiSB17xvUOR12qJ3BR2ReJBK46Yy3FLICvJrJrYHm+gddLAz2sbWXgsbvTpq22tYb5fR3m2is9+W/c1+A43uOsxSStRyCRTlFmGhaqI/7uLo9ADjkyH6RDwl2NipoTvcwvDRHmGAwVEf3f0tlJsW4rllBDTVTl/cckW4sp7F/mQXx08nOPxiJAQtUrhDkQ/aHe9gRGSTx2M5dDDpS0bFegGaEZZmSaOmCrPltKjhlDuDNprdGqqbqxLbuxsSN/tNec/fNTpVVKkUuYoBLRMWF7DVZoSJ/DKlnSWlOeTWMtIgg5pj0kG5Skaakqf9Yj0ve/G8hlg2QmQhcQE3Vg15xadCqGej1N2UIG3F5QCGdPiq63wAI077QnLLYmw9ruU1Iakwr+zBdmHbZMuGKOeSMDG/S5V0JEoadIsUZkMznwZ1VabqAcKYEEqatbzUyiynsNLKoHpYQPOsiPrpCqwepV+MIGIEZDB4SOYIGeliHMkCEVLqbKdSoyA+tVom2k8rmHzs4OxiH09+Jhu938Dq0ESsEJYxVcPe+wivFFq2QosVUqzs5XHwYRNv/nyEbz+9xvtPr/Di8hDd8zWkazEZS27MHcK5GlbsGpqVFMrDLA5/aOPrvx/j47/v8ON/73D+1wn2vmkg24oL4QMpJyRlVmk3xaT9JIo9A8MPLSI5xvf/nOM7wsvLI3Tf2gqDsQeaMiXklNmDPEXc4Ww9KTU8/qmH57+P8ezXkZSgPKIa5sNYivrkzrQJc1EhM1fTs5SZmNVZtZyYmZtVaBmoTSy0npXQfGKhuGsgXooiTFcbpyvGZg+x61mFpEzd5fpx5JS5w3wIG51Vp0ox8mEUevHah3Lr+K5Gjwk1IyQTkCjY4PoluI4F248xKsmyGZaR4xhJBWYTIv4LeORelAvWoIIa9RgyDR1mIw6zmUBug2pGUZ4JmbpO3+jXa/6HwM1IrEahmSH7EErdwV26g6/u2SN07jxX0HlD69fr6L6qYftlBY6Tiw4+C7/YOL3o4cs/Rnh+OcbZb3v4H7VoFcDr30T8AAAAAElFTkSuQmCC)

![img](Untitled.assets/e1b3ca951f0830262d88a4cb947a7bee041bc85e-1600x2000.png)

### Node.js: Tools & Skills, 2nd Edition

🧑‍💻NodeJS: "It's the JavaScript full stack answer to your coding challenges"

[Read the book now](https://www.sitepoint.com/premium/books/node-js-tools-skills-2nd-edition/read)

```javascript
{
  "message": "Hello world!"
}
```

The API also allows a custom name, so `http://localhost:8888/hello/everyone/` returns:

```javascript
{
  "message": "Hello everyone!"
}
```

## Client-side REST API Requests and CORS

Consider the following HTML page launched in a browser at the URL `http://localhost:8888/`:

```markup
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>REST test</title>
</head>
<body>
<script>
fetch('http://localhost:8888/hello/')
  .then((response) => {
    return response.json();
  })
  .then((json) => {
    console.log(json);
  });
</script>
</body>
</html>
```

The `fetch` call makes the same API request and browser console shows `Object { message: "Hello world!" }` as you would expect.

However, presume your RESTful web service was now put live on the Web at the domain `http://mydomain.com/hello/`. The page JavaScript `fetch()` URL is changed accordingly, but opening `http://localhost:8888/` in the browser now returns the console error **Cross-Origin Request Blocked**.

For security, browsers only permit client-side [XMLHttpRequest](https://developer.mozilla.org/docs/Web/API/XMLHttpRequest) and [Fetch API](https://developer.mozilla.org/docs/Web/API/Fetch_API) calls to the same domain where the page is hosted.

Fortunately, [Cross-origin Resource Sharing (CORS)](https://developer.mozilla.org/docs/Web/HTTP/CORS) allows us to circumvent that security restriction. Setting an `Access-Control-Allow-Origin` HTTP response header tells the browsers permit the request. It can be set to a specific domain or `*` for all domains (done by the Joke API above).

The web service API code can therefore be changed to allow access from any client-side script running on any domain:

```javascript
// /hello/ GET request
app.get('/hello/:name?', (req, res) =>
  res
    .append('Access-Control-Allow-Origin', '*')
    .json(
      { message: `Hello ${req.params.name || 'world'}!` }
    )
);
```

Alternatively, an Express.js middleware function could append the header to every endpoint request:

```javascript
// enable CORS
app.use((req, res, next) => {
  res.append('Access-Control-Allow-Origin', '*');
  next();
});

// /hello/ GET request
// ...
```

## REST API Challenges

The success of REST owes much to its simplicity. Developers are free to implement RESTful APIs as they like, but that can lead to further challenges.

### REST Endpoint Consensus

Consider the following endpoints:

- `/user/123`
- `/user/id/123`
- `/user/?id=123`

All are valid options to fetch data for user `123`. The number of combinations increase further when you have more complex operations. For example, return ten users whose surnames start with ‘A’ and work for companyX starting at record 51 when ordered by date of birth in reverse chronological order.

Ultimately, it doesn’t matter how you format URLs, but consistency across your API is important. That can be difficult to achieve on large codebases with many developers.



### REST API Versioning

API changes are inevitable, but endpoint URLs should never be invalidated when they’re being used internally and/or by third-party applications.

APIs are often versioned to avoid compatibility issues — such as `/2.0/user/123` supersedes `/user/123` — but the old endpoint remains active. However, this increases the workload, as multiple APIs are maintained. Older APIs can eventually be scrapped, but the process requires careful planning.

### REST API Authentication

The Joke API shown above is *open*: any system can fetch a joke without authorization. This is not viable for APIs which access private data or permit update and delete requests.

Client-side applications on the same domain as the RESTful API will send and receive cookies just like any other HTTP request. (Note that `Fetch()` in older browsers requires the `credentials` [init option](https://developer.mozilla.org/docs/Web/API/WindowOrWorkerGlobalScope/fetch#Parameters) to be set.) An API request can therefore be validated to ensure a user is logged in and has appropriate rights.

Third-party applications must use alternative methods of authorization. Common [authentication options](https://swagger.io/docs/specification/authentication/) include:

1. **[HTTP basic authentication](https://swagger.io/docs/specification/authentication/basic-authentication/)**. An HTTP `Authorization` header containing a base64-encoded username:password string is passed in the request header.
2. **[API keys](https://swagger.io/docs/specification/authentication/api-keys/)**. A third-party application is granted permission to use an API by issuing a key which may have specific rights or be restricted to a particular domain. The key is passed in every request in the HTTP header or on the querystring.
3. **[OAuth](https://oauth.net/)**. A token is obtained before any request can be made by sending a client ID and possibly a client secret to an OAuth server. The OAuth token is then sent with each API request until it expires.
4. **[JSON Web Tokens (JWT)](https://jwt.io/)**. Digitally-signed authentication tokens are securely transmitted in both the request and response header.

API authentication will vary depending on the use context. In some cases, the third-party application is considered to be another logged-in user with specific rights and permissions — for example, when generating directions from a map API. In other cases, the third-party application is being used by a registered user and can only access their data — for example, when fetching email content or documents.

### REST API Security

A RESTful API provides another route to access and manipulate your application. Even if it’s not an interesting hacking target, a badly behaved client could send thousands of requests every second and crash your server.

Security is beyond the scope of this article, but common best practises include:

- use HTTPS
- use a robust [authentication method](https://www.sitepoint.com/developers-rest-api/#authentication)
- use [CORS](https://www.sitepoint.com/developers-rest-api/#client-side-rest-requests-and-cors) to limit client-side calls to specific domains
- provide minimum functionality — that is, don’t create a DELETE options which are not required
- validate all endpoint URLs and body data
- avoid exposing API tokens in client-side JavaScript
- block access from unknown domains or IP addresses
- block unexpectedly large payloads
- consider rate-limiting — that is, requests using the same API token or IP address are limited to N per minute
- respond with an appropriate [HTTP status code](https://developer.mozilla.org/docs/Web/HTTP/Status) and [caching](https://developer.mozilla.org/docs/Web/HTTP/Headers/Cache-Control) header
- log requests and investigate failures.

### Multiple Requests and Unnecessary Data

RESTful APIs are limited by their implementation. A response may contain more data than you need, or require further requests to access all data.

Consider a RESTful API that provides access to author and book data. To show data for the top 10 selling books, the client will:

1. Request the first 10 `/book/` details ordered by number of sales (top seller first). The response contains a list of books with each author ID.
2. Make up to 10 `/author/{id}` requests to fetch each author’s name.

This is known as the *N+1 problem*; N API requests must be made for each result in the parent request.

If this is a common use case, the RESTful API could be changed so that every returned book contained the full author details such as their name, age, country, biography, and so on. It could also provide full details of their other books — although *this would considerably increase the response payload!*

To avoid massive responses, the API could be adjusted so author details can be controlled — for example, `?author_details=basic` — but the number of options can quickly become bewildering.

## Does GraphQL Fix REST APIs?

These REST conundrums led Facebook to create [GraphQL](https://graphql.org/) — a web service query language. Think of it as SQL for web services; a single request defines what data you need and how you want it returned.

GraphQL addresses many of the challenges posed by RESTful APIs. That said, few companies have problems comparable to Facebook. It’s worth considering GraphQL once your RESTful API evolves beyond its simple starting point.

## REST API Links and Development Tools

To get your hands dirty with REST API design, we recommend [RESTful Web API Design with Node.js](https://www.sitepoint.com/premium/books/restful-web-api-design-with-node-js-10-third-edition?utm_source=blog&utm_medium=articles). Start building functional APIs with the JavaScript you already know.

There are numerous tools to help with RESTful API development in all languages. Notable options include:

- **[Swagger](https://swagger.io/)**: a variety of tools to help design, document, mock, test, and monitor REST APIs
- **[Postman](https://www.getpostman.com/downloads/)**: a RESTful API testing application
- **[Postwoman](https://postwoman.io/)**: an open-source, web-based alternative to Postman.

There are plenty of public REST APIs catering for jokes, currency conversion, geocoding, government data, and every topic you can think of. Many are free, although some require you to sign up for an API key or use other authentication methods. Categorized lists include:

- [Any API](https://any-api.com/)
- [API list](https://apilist.fun/)
- [Public API](https://public-apis.xyz/)
- [Public APIs](https://github.com/public-apis/public-apis)
- [Rapid API](https://rapidapi.com/)
- [Google APIs Explorer](https://developers.google.com/apis-explorer/)

Try consuming a few RESTful APIs in your own projects before implementing your own web services.