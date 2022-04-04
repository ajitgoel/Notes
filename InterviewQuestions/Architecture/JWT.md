# Why use JSON Web Token (JWT) in Authentication

Authentication and authorization are the two terms used most often in the security of web applications. Authentication is the process of verifying a user’s identity, i.e. user provided attributes such as name, address, phone number, and email are correct. Authorization is the process of verifying that a user has the requisite permissions to access an application’s resources or perform specific actions. When a user logs in, first authentication is performed, and if the authentication passes then authorization is performed when a user uses the application. 

Problem

Authenticating a user requires verification of a user’s identity. The traditional ==cookies-based authentication method makes use of HTTP cookies to authenticate client requests and store session information on the server==. Typically the following procedure is used:

1. ==A client, also called a user agent, sends a login request to the server.==
2. ==On successful login, the server stores the session information in memory or in persistent storage and returns a HTTP Response that includes **<u>an HTTP cookie</u>** (also called a browser cookie or a web cookie) **<u>in the Set-Cookie header</u>**. A cookie is a string of data with a name-value pair as its only required attribute. The cookie is tied with the session stored on the server and may include additional attributes for the duration a cookie is valid or an expiration date.==
3. ==The cookie gets set in the client’s browser.==
4. ==For authentication, the client sends the cookie in the cookie header of each subsequent request.==
5. ==The server deserializes the cookie to authenticate the user.==
6. ==A user stays signed-in as long as cookies are stored in a browser, and are valid. User specific cookies-related settings can be set in a browser.==
7. ==By default, most browsers expire a session cookie, which represents a client’s current session, when the client shuts down the browser.== 

Session cookies-based authentication has several disadvantages:

1. The session information has to be stored on the server. 
2. Cookies need to be sent with every request, which could reduce performance especially for mobile apps. 
3. Cookies are for a specific server, domain, or path. Cross-Origin Resource Sharing (CORS) HTTP headers must be used to allow a browser to access origins (domain, scheme, port) other than a server’s own. 
4. It is vulnerable to Cross-Site Request Forgery (CSRF) attacks. 

Solution

==JSON Web Token (JWT) is an open, JSON-based standard== ([rfc7519](https://datatracker.ietf.org/doc/html/rfc7519)) ==for securely transmitting information between parties. JWT is secure, as it can be digitally signed using a secret (with one of the supported algorithms) or a public-private key using RSA.== In addition to secure information exchange, JWT could be used for authentication. The following procedure is typically used for JWT-based authentication:

==A user logs in successfully using their credentials (username and password).
The server creates a JWT and signs it with a secret. The JWT, or the signature, is not stored on the server at all. The signature is created from the encoded header, and the encoded payload of the JWT along with a secret and an algorithm. 
The JWT token is sent back to the user. The user must store the JWT securely. JWT is typically not stored in the browser, which would involve the same CSRF issues as cookies do. 
**User includes the JWT token in the Authorization header when accessing a secure resource.** 
Server verifies JWT signature. As the signature is based on the information in the JWT itself, the JWT is self-contained and no JWT related information is stored on the server. 
If JWT is valid, the server allows the user access to the requested resource.==

| JWT based authentication                                     | Cookie based authentication |
| ------------------------------------------------------------ | --------------------------- |
| No user session information is stored on the server          |                             |
| Not limited to specific domains, paths, or servers. No Cross-Origin Resource Sharing (CORS) issues |                             |
| JSON-based JWT is more compact as compared to XML-based SAML (Security Assertion Markup Language) information exchange, which is typically used with cookies |                             |
| JSON is more commonly used on the Internet for information exchange than XML is. |                             |
| JWT can also include user permissions for specific resources using authentication and authorization platforms such as Auth0. Therefore JWT can be used for authorization in addition to authentication |                             |



# how JSON Web Tokens (JWT) works 

<iframe src="https://cdn.embedly.com/widgets/media.html?src=https%3A%2F%2Fupscri.be%2Fcb3b68%3Fas_embed%3Dtrue&amp;dntp=1&amp;display_name=Upscribe&amp;url=https%3A%2F%2Fupscri.be%2Fcb3b68&amp;key=a19fcc184b9711e1b4764040d3dc5c07&amp;type=text%2Fhtml&amp;schema=upscri" allowfullscreen="" frameborder="0" height="395" width="680" title="Do you want to improve your programming skills?" class="ef es eo ex w" scrolling="auto" style="box-sizing: inherit; width: 680px; position: absolute; left: 0px; top: 0px; height: 395px;"></iframe>

# 1. What is a JSON Web Token (JWT)?

Json Web Token (JWT) is an open standard ([RFC 7519](https://tools.ietf.org/html/rfc7519)) for securely transmitting information between endpoints as JSON object.

The JWT consist of three main parts separated by dots `(.)`.

```
// JWT high-level representation
header.payload.signature// How JWT looks
eyJhbGciOBJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4gZG9lIiwiaWF0IjoxNGYyMjMyNzI2fQ.NnOv-wHAf59L2WMcDlfNsTThOUY1a0JMFNgJIP67mqU
```

Let’s describe the three parts that define JWT.

## Header

==The **header** consist of two things; the type of the token which is JWT, and the algorithm being used== such as RSA, HMAC, or SHA256. PS! If you don’t define the algorithm, it uses HS256 by default.

```
{
  "alg": "HS256",
  "typ": "JWT"
}
```

## Payload

==The **payload** is the actual data, we can also add additional information known as claims which is optional such as the expiration time (exp), subject (sub), or issuer (iss).== Notice the claim names are short, that is because JWT is meant to be compact for fast requests.

One would think that is not important, but imagine a site having millions of requests, and for every request a mathematical algorithm is run to grant users access to web resources. It can sure lead to some heavy traffic slowing down the server calls.

PS! Don’t put sensitive data such as password in your payload thus this can easily be decoded.

```
{
  "sub": "2311",
  "name": "Mike Tyson",
  "admin": true
}
```

## Signature

The last part is ==the **signature** which is the sum of the encoded header, the encoded payload, a secret, and lastly the algorithm which is specified in the header.==

The signature is the most important part of the JWT structure. The header and payload can easily be decoded, but not the signature. The reason why is because it checks two things; first verify the header and payload has not been altered, and secondly check the private key is valid to make sure the sender is who it is.

```
let data = base64UrlEncode(header) + "." + base64UrlEncode(payload)// Creates a signature
HMACSHA256(data, secret) // Signature key
AflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

In short, if either the header, payload or private key changes along the way, the verification process will fail thus the token is not equal to the one that was initially created.