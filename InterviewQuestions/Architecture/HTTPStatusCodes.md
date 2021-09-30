## 1xx informational response

An informational response indicates that the request was received and understood. It is issued on a provisional basis while request processing continues. It alerts the client to wait for a final response. The message consists only of the status line and optional header fields, and is terminated by an empty line. As the HTTP/1.0 standard did not define any 1xx status codes, servers *must not*[[note 1\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-3) send a 1xx response to an HTTP/1.0 compliant client except under experimental conditions.[[3\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-4)

- 100 Continue

  The server has received the request headers and the client should proceed to send the request body (in the case of a request for which a body needs to be sent; for example, a [POST](https://en.wikipedia.org/wiki/POST_(HTTP)) request). Sending a large request body to a server after a request has been rejected for inappropriate headers would be inefficient. To have a server check the request's headers, a client must send `Expect: 100-continue` as a header in its initial request and receive a `100 Continue` status code in response before sending the body. If the client receives an error code such as 403 (Forbidden) or 405 (Method Not Allowed) then it should not send the request's body. The response `417 Expectation Failed` indicates that the request should be repeated without the `Expect` header as it indicates that the server does not support expectations (this is the case, for example, of HTTP/1.0 servers).[[4\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-5)

- 101 Switching Protocols

  The requester has asked the server to switch protocols and the server has agreed to do so.[[5\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-6)

- 102 Processing ([WebDAV](https://en.wikipedia.org/wiki/WebDAV); RFC 2518)

  A WebDAV request may contain many sub-requests involving file operations, requiring a long time to complete the request. This code indicates that the server has received and is processing the request, but no response is available yet.[[6\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_2518-7) This prevents the client from timing out and assuming the request was lost.

- 103 Early Hints (RFC 8297)

  Used to return some response headers before final HTTP message.[[7\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_8297-8)

## 2xx success

This class of status codes indicates the action requested by the client was received, understood, and accepted.[[2\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-iana_status_codes-2)

- 200 OK

  Standard response for successful HTTP requests. The actual response will depend on the request method used. In a GET request, the response will contain an entity corresponding to the requested resource. In a POST request, the response will contain an entity describing or containing the result of the action.[[8\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_2616-9)

- 201 Created

  The request has been fulfilled, resulting in the creation of a new resource.[[9\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-10)

- 202 Accepted

  The request has been accepted for processing, but the processing has not been completed. The request might or might not be eventually acted upon, and may be disallowed when processing occurs.[[10\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-11)

- 203 Non-Authoritative Information (since HTTP/1.1)

  The server is a transforming proxy (e.g. a *[Web accelerator](https://en.wikipedia.org/wiki/Web_accelerator)*) that received a 200 OK from its origin, but is returning a modified version of the origin's response.[[11\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-12)[[12\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-13)

- 204 No Content

  The server successfully processed the request, and is not returning any content.[[13\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-14)

- 205 Reset Content

  The server successfully processed the request, asks that the requester reset its document view, and is not returning any content.[[14\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-15)

- 206 Partial Content (RFC 7233)

  The server is delivering only part of the resource ([byte serving](https://en.wikipedia.org/wiki/Byte_serving)) due to a range header sent by the client. The range header is used by HTTP clients to enable resuming of interrupted downloads, or split a download into multiple simultaneous streams.[[15\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-16)

- 207 Multi-Status (WebDAV; RFC 4918)

  The message body that follows is by default an [XML](https://en.wikipedia.org/wiki/XML) message and can contain a number of separate response codes, depending on how many sub-requests were made.[[16\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_4918-17)

- 208 Already Reported (WebDAV; RFC 5842)

  The members of a DAV binding have already been enumerated in a preceding part of the (multistatus) response, and are not being included again.

- 226 IM Used (RFC 3229)

  The server has fulfilled a request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.[[17\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_3229-18)

## 3xx redirection

This class of status code indicates the client must take additional action to complete the request. Many of these status codes are used in [URL redirection](https://en.wikipedia.org/wiki/URL_redirection).[[2\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-iana_status_codes-2)

A user agent may carry out the additional action with no user interaction only if the method used in the second request is GET or HEAD. A user agent may automatically redirect a request. A user agent should detect and intervene to prevent cyclical redirects.[[18\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-19)

- 300 Multiple Choices

  Indicates multiple options for the resource from which the client may choose (via [agent-driven content negotiation](https://en.wikipedia.org/wiki/Content_negotiation#Agent-driven)). For example, this code could be used to present multiple video format options, to list files with different [filename extensions](https://en.wikipedia.org/wiki/Filename_extension), or to suggest [word-sense disambiguation](https://en.wikipedia.org/wiki/Word-sense_disambiguation).[[19\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-20)

- [301 Moved Permanently](https://en.wikipedia.org/wiki/HTTP_301)

  This and all future requests should be directed to the given [URI](https://en.wikipedia.org/wiki/Uniform_resource_identifier).[[20\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-21)

- [302 Found (Previously "Moved temporarily")](https://en.wikipedia.org/wiki/HTTP_302)

  Tells the client to look at (browse to) another URL. 302 has been superseded by 303 and 307. This is an example of industry practice contradicting the standard. The HTTP/1.0 specification (RFC 1945) required the client to perform a temporary redirect (the original describing phrase was "Moved Temporarily"),[[21\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_1945-22) but popular browsers implemented 302 with the functionality of a 303 See Other. Therefore, HTTP/1.1 added status codes 303 and 307 to distinguish between the two behaviours.[[22\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC7230-10-23) However, some Web applications and frameworks use the 302 status code as if it were the 303.[[23\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-ruby-on-rails-ActionController-Redirecting-redirect_to-24)

- [303 See Other](https://en.wikipedia.org/wiki/HTTP_303) (since HTTP/1.1)

  The response to the request can be found under another [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) using the GET method. When received in response to a POST (or PUT/DELETE), the client should presume that the server has received the data and should issue a new GET request to the given URI.[[24\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-25)

- 304 Not Modified (RFC 7232)

  Indicates that the resource has not been modified since the version specified by the [request headers](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Request_Headers) If-Modified-Since or If-None-Match. In such case, there is no need to retransmit the resource since the client still has a previously-downloaded copy.[[25\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-26)

- 305 Use Proxy (since HTTP/1.1)

  The requested resource is available only through a proxy, the address for which is provided in the response. For security reasons, many HTTP clients (such as [Mozilla Firefox](https://en.wikipedia.org/wiki/Firefox) and [Internet Explorer](https://en.wikipedia.org/wiki/Internet_Explorer)) do not obey this status code.[[26\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-mozilla_bugzilla_bug_187996_comment_13-27)

- 306 Switch Proxy

  No longer used. Originally meant "Subsequent requests should use the specified proxy."[[27\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-28)

- 307 Temporary Redirect (since HTTP/1.1)

  In this case, the request should be repeated with another URI; however, future requests should still use the original URI. In contrast to how 302 was historically implemented, the request method is not allowed to be changed when reissuing the original request. For example, a POST request should be repeated using another POST request.[[28\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-SemanticsAndContent-29)

- 308 Permanent Redirect (RFC 7538)

  The request and all future requests should be repeated using another URI. 307 and 308 parallel the behaviors of 302 and 301, but *do not allow the HTTP method to change*. So, for example, submitting a form to a permanently redirected resource may continue smoothly.[[29\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-rfc7238-30)

## 4xx client errors

[![A The Wikimedia 404 message](HTTPStatusCodes.assets/220px-Wikimedia_error_404.png)](https://en.wikipedia.org/wiki/File:Wikimedia_error_404.png)

404 error on Wikipedia

This class of status code is intended for situations in which the error seems to have been caused by the client. Except when responding to a HEAD request, the server *should* include an entity containing an explanation of the error situation, and whether it is a temporary or permanent condition. These status codes are applicable to any request method. User agents *should* display any included entity to the user.[[30\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-31)

- 400 Bad Request

  The server cannot or will not process the request due to an apparent client error (e.g., malformed request syntax, size too large, invalid request message framing, or deceptive request routing).[[31\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-rfc7231-400-32)

- ==401 Unauthorized (RFC 7235)==

  ==Similar to *403 Forbidden*, but specifically for use when authentication is required and has failed or has not yet been provided.== The response must include a WWW-Authenticate header field containing a challenge applicable to the requested resource. See [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication) and [Digest access authentication](https://en.wikipedia.org/wiki/Digest_access_authentication).[[32\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-33) 401 semantically means "unauthorised",[[33\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-rfc7235-401-34) the user does not have valid authentication credentials for the target resource.

  Note: Some sites incorrectly issue HTTP 401 when an [IP address](https://en.wikipedia.org/wiki/IP_address) is banned from the website (usually the website domain) and that specific address is refused permission to access a website.[*[citation needed](https://en.wikipedia.org/wiki/Wikipedia:Citation_needed)*]

- 402 Payment Required

  Reserved for future use. The original intention was that this code might be used as part of some form of [digital cash](https://en.wikipedia.org/wiki/Digital_cash) or [micropayment](https://en.wikipedia.org/wiki/Micropayment) scheme, as proposed, for example, by [GNU Taler](https://en.wikipedia.org/wiki/GNU_Taler),[[34\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-35) but that has not yet happened, and this code is not widely used. [Google Developers](https://en.wikipedia.org/wiki/Google_Developers) API uses this status if a particular developer has exceeded the daily limit on requests.[[35\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-GoogleDevelopersErrorCode-36) [Sipgate](https://en.wikipedia.org/wiki/Sipgate) uses this code if an account does not have sufficient funds to start a call.[[36\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-37) [Shopify](https://en.wikipedia.org/wiki/Shopify) uses this code when the store has not paid their fees and is temporarily disabled.[[37\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-38) [Stripe](https://en.wikipedia.org/wiki/Stripe_(company)) uses this code for failed payments where parameters were correct, for example blocked fraudulent payments.[[38\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-39)

- ==[403 Forbidden](https://en.wikipedia.org/wiki/HTTP_403)==

  ==The request contained valid data and was understood by the server, but the server is refusing action. This may be due to the user not having the necessary permissions for a resource or needing an account of some sort, or attempting a prohibited action (e.g. creating a duplicate record where only one is allowed).== This code is also typically used if the request provided authentication by answering the WWW-Authenticate header field challenge, but the server did not accept that authentication. The request should not be repeated.

- [404 Not Found](https://en.wikipedia.org/wiki/HTTP_404)

  The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.

- 405 Method Not Allowed

  A request method is not supported for the requested resource; for example, a GET request on a form that requires data to be presented via [POST](https://en.wikipedia.org/wiki/POST_(HTTP)), or a PUT request on a read-only resource.

- 406 Not Acceptable

  The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.[[39\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-40) See [Content negotiation](https://en.wikipedia.org/wiki/Content_negotiation).

- 407 Proxy Authentication Required (RFC 7235)

  The client must first authenticate itself with the [proxy](https://en.wikipedia.org/wiki/Proxy_server).[[40\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-41)

- 408 Request Timeout

  The server timed out waiting for the request. According to HTTP specifications: "The client did not produce a request within the time that the server was prepared to wait. The client MAY repeat the request without modifications at any later time."[[41\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-42)

- 409 Conflict

  Indicates that the request could not be processed because of conflict in the current state of the resource, such as an [edit conflict](https://en.wikipedia.org/wiki/Edit_conflict) between multiple simultaneous updates.

- 410 Gone

  Indicates that the resource requested is no longer available and will not be available again. This should be used when a resource has been intentionally removed and the resource should be purged. Upon receiving a 410 status code, the client should not request the resource in the future. Clients such as search engines should remove the resource from their indices.[[42\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-HTTP_410-43) Most use cases do not require clients and search engines to purge the resource, and a "404 Not Found" may be used instead.

- 411 Length Required

  The request did not specify the length of its content, which is required by the requested resource.[[43\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-44)

- 412 Precondition Failed (RFC 7232)

  The server does not meet one of the preconditions that the requester put on the request header fields.[[44\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-45)

- 413 Payload Too Large (RFC 7231)

  The request is larger than the server is willing or able to process. Previously called "Request Entity Too Large".[[45\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-46)

- 414 URI Too Long (RFC 7231)

  The [URI](https://en.wikipedia.org/wiki/URI) provided was too long for the server to process. Often the result of too much data being encoded as a query-string of a GET request, in which case it should be converted to a POST request.[[46\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-47) Called "Request-URI Too Long" previously.[[47\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-48)

- 415 Unsupported Media Type (RFC 7231)

  The request entity has a [media type](https://en.wikipedia.org/wiki/Internet_media_type) which the server or resource does not support. For example, the client uploads an image as [image/svg+xml](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics), but the server requires that images use a different format.[[48\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-49)

- 416 Range Not Satisfiable (RFC 7233)

  The client has asked for a portion of the file ([byte serving](https://en.wikipedia.org/wiki/Byte_serving)), but the server cannot supply that portion. For example, if the client asked for a part of the file that lies beyond the end of the file.[[49\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-50) Called "Requested Range Not Satisfiable" previously.[[50\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-51)

- 417 Expectation Failed

  The server cannot meet the requirements of the Expect request-header field.[[51\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-52)

- [418 I'm a teapot](https://en.wikipedia.org/wiki/HTTP_418) (RFC 2324, RFC 7168)

  This code was defined in 1998 as one of the traditional [IETF](https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force) [April Fools' jokes](https://en.wikipedia.org/wiki/April_Fools'_Day_RFC), in RFC 2324, *[Hyper Text Coffee Pot Control Protocol](https://en.wikipedia.org/wiki/Hyper_Text_Coffee_Pot_Control_Protocol)*, and is not expected to be implemented by actual HTTP servers. The RFC specifies this code should be returned by teapots requested to brew coffee.[[52\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-53) This HTTP status is used as an [Easter egg](https://en.wikipedia.org/wiki/Easter_egg_(media)) in some websites, such as [Google.com's](https://en.wikipedia.org/wiki/Google.com) [I'm a teapot](https://www.google.com/teapot) easter egg.[[53\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-54)[[54\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-55)

- 421 Misdirected Request (RFC 7540)

  The request was directed at a server that is not able to produce a response[[55\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-56) (for example because of connection reuse).[[56\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-57)

- 422 Unprocessable Entity (WebDAV; RFC 4918)

  The request was well-formed but was unable to be followed due to semantic errors.[[16\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_4918-17)

- 423 Locked (WebDAV; RFC 4918)

  The resource that is being accessed is locked.[[16\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_4918-17)

- 424 Failed Dependency (WebDAV; RFC 4918)

  The request failed because it depended on another request and that request failed (e.g., a PROPPATCH).[[16\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_4918-17)

- 425 Too Early (RFC 8470)

  Indicates that the server is unwilling to risk processing a request that might be replayed.

- 426 Upgrade Required

  The client should switch to a different protocol such as [TLS/1.3](https://en.wikipedia.org/wiki/Transport_Layer_Security), given in the [Upgrade header](https://en.wikipedia.org/wiki/Upgrade_header) field.[[57\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-58)

- 428 Precondition Required (RFC 6585)

  The origin server requires the request to be conditional. Intended to prevent the 'lost update' problem, where a client GETs a resource's state, modifies it, and PUTs it back to the server, when meanwhile a third party has modified the state on the server, leading to a conflict.[[58\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-rfc6585-59)

- 429 Too Many Requests (RFC 6585)

  The user has sent too many requests in a given amount of time. Intended for use with [rate-limiting](https://en.wikipedia.org/wiki/Rate_limiting) schemes.[[58\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-rfc6585-59)

- 431 Request Header Fields Too Large (RFC 6585)

  The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large.[[58\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-rfc6585-59)

- [451 Unavailable For Legal Reasons](https://en.wikipedia.org/wiki/HTTP_451) (RFC 7725)

  A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource.[[59\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-60) The code 451 was chosen as a reference to the novel *[Fahrenheit 451](https://en.wikipedia.org/wiki/Fahrenheit_451)* (see the Acknowledgements in the RFC).

## 5xx server errors

The [server](https://en.wikipedia.org/wiki/Server_(computing)) failed to fulfil a request.[[60\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-61)

Response status codes beginning with the digit "5" indicate cases in which the server is aware that it has encountered an error or is otherwise incapable of performing the request. Except when responding to a HEAD request, the server *should* include an entity containing an explanation of the error situation, and indicate whether it is a temporary or permanent condition. Likewise, user agents *should* display any included entity to the user. These response codes are applicable to any request method.[[61\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-62)

- 500 Internal Server Error

  A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.[[62\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-63)

- 501 Not Implemented

  The server either does not recognize the request method, or it lacks the ability to fulfil the request. Usually this implies future availability (e.g., a new feature of a web-service API).[[63\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-64)

- 502 Bad Gateway

  The server was acting as a [gateway](https://en.wikipedia.org/wiki/Gateway_(telecommunications)) or proxy and received an invalid response from the upstream server.[[64\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-65)

- 503 Service Unavailable

  The server cannot handle the request (because it is overloaded or down for maintenance). Generally, this is a temporary state.[[65\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-66)

- 504 Gateway Timeout

  The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.[[66\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-67)

- 505 HTTP Version Not Supported

  The server does not support the HTTP protocol version used in the request.[[67\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-68)

- 506 Variant Also Negotiates (RFC 2295)

  Transparent [content negotiation](https://en.wikipedia.org/wiki/Content_negotiation) for the request results in a [circular reference](https://en.wikipedia.org/wiki/Circular_reference).[[68\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_2295-69)

- 507 Insufficient Storage (WebDAV; RFC 4918)

  The server is unable to store the representation needed to complete the request.[[16\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_4918-17)

- 508 Loop Detected (WebDAV; RFC 5842)

  The server detected an infinite loop while processing the request (sent instead of [208 Already Reported](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#208)).

- 510 Not Extended (RFC 2774)

  Further extensions to the request are required for the server to fulfil it.[[69\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-RFC_2774-70)

- 511 Network Authentication Required (RFC 6585)

  The client needs to authenticate to gain network access. Intended for use by intercepting proxies used to control access to the network (e.g., "[captive portals](https://en.wikipedia.org/wiki/Captive_portal)" used to require agreement to Terms of Service before granting full Internet access via a [Wi-Fi hotspot](https://en.wikipedia.org/wiki/Hotspot_(Wi-Fi))).[[58\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-rfc6585-59)

  

## Unofficial codes

The following codes are not specified by any standard.

- 103 Checkpoint

  Used in the resumable requests proposal to resume aborted PUT or POST requests.[[70\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-71)

- 218 This is fine ([Apache Web Server](https://en.wikipedia.org/wiki/Apache_Web_Server))

  Used as a catch-all error condition for allowing response bodies to flow through Apache when ProxyErrorOverride is enabled.[*[dubious](https://en.wikipedia.org/wiki/Wikipedia:Accuracy_dispute#Disputed_statement) – [discuss](https://en.wikipedia.org/wiki/Talk:List_of_HTTP_status_codes#218_This_is_fine)*] When ProxyErrorOverride is enabled in Apache, response bodies that contain a status code of 4xx or 5xx are automatically discarded by Apache in favor of a generic response or a custom response specified by the ErrorDocument directive.[[71\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-ThisIsFine-72)

- 419 Page Expired ([Laravel Framework](https://en.wikipedia.org/wiki/Laravel))

  Used by the Laravel Framework when a CSRF Token is missing or expired.

- 420 Method Failure ([Spring Framework](https://en.wikipedia.org/wiki/Spring_Framework))

  A deprecated response used by the Spring Framework when a method has failed.[[72\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-73)

- 420 Enhance Your Calm ([Twitter](https://en.wikipedia.org/wiki/Twitter))

  Returned by version 1 of the Twitter Search and Trends API when the client is being rate limited; versions 1.1 and later use the [429 Too Many Requests](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#429) response code instead.[[73\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-TwitterErrorCodes-74) The phrase "Enhance your calm" comes from the [1993 movie](https://en.wikipedia.org/wiki/1993_movie) *[Demolition Man](https://en.wikipedia.org/wiki/Demolition_Man_(film))*, and its association with this number is likely a [reference to cannabis](https://en.wikipedia.org/wiki/420_(cannabis_culture)).[*[citation needed](https://en.wikipedia.org/wiki/Wikipedia:Citation_needed)*]

- 430 Request Header Fields Too Large ([Shopify](https://en.wikipedia.org/wiki/Shopify))

  Used by [Shopify](https://en.wikipedia.org/wiki/Shopify), instead of the [429 Too Many Requests](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#429) response code, when too many URLs are requested within a certain time frame.[[74\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-75)

- 450 Blocked by Windows Parental Controls (Microsoft)

  The Microsoft extension code indicated when Windows Parental Controls are turned on and are blocking access to the requested webpage.[[75\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-76)

- 498 Invalid Token (Esri)

  Returned by [ArcGIS for Server](https://en.wikipedia.org/wiki/ArcGIS_Server). Code 498 indicates an expired or otherwise invalid token.[[76\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-arcgis-77)

- 499 Token Required (Esri)

  Returned by [ArcGIS for Server](https://en.wikipedia.org/wiki/ArcGIS_Server). Code 499 indicates that a token is required but was not submitted.[[76\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-arcgis-77)

- 509 Bandwidth Limit Exceeded ([Apache Web Server](https://en.wikipedia.org/wiki/Apache_Web_Server)/[cPanel](https://en.wikipedia.org/wiki/CPanel))

  The server has exceeded the bandwidth specified by the server administrator; this is often used by shared hosting providers to limit the bandwidth of customers.[[77\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-78)

- 529 Site is overloaded

  Used by [Qualys](https://en.wikipedia.org/wiki/Qualys) in the SSLLabs server testing API to signal that the site can't process the request.[[78\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-79)

- 530 Site is frozen

  Used by the [Pantheon](https://en.wikipedia.org/wiki/Pantheon_(software)) web platform to indicate a site that has been frozen due to inactivity.[[79\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-80)

- 598 (Informal convention) Network read timeout error

  Used by some HTTP proxies to signal a network read timeout behind the proxy to a client in front of the proxy.[[80\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-81)

### Internet Information Services

Microsoft's [Internet Information Services](https://en.wikipedia.org/wiki/Internet_Information_Services) (IIS) web server expands the 4xx error space to signal errors with the client's request.

- 440 Login Time-out

  The client's session has expired and must log in again.[[81\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-MS_KB941201-82)

- 449 Retry With

  The server cannot honour the request because the user has not provided the required information.[[82\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-MS_DD891478-83)

- 451 Redirect

  Used in [Exchange ActiveSync](https://en.wikipedia.org/wiki/Exchange_ActiveSync) when either a more efficient server is available or the server cannot access the users' mailbox.[[83\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-84) The client is expected to re-run the HTTP AutoDiscover operation to find a more appropriate server.[[84\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-85)

IIS sometimes uses additional decimal sub-codes for more specific information,[[85\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-MS_KB943891-86) however these sub-codes only appear in the response payload and in documentation, not in the place of an actual HTTP status code.

### nginx

The [nginx](https://en.wikipedia.org/wiki/Nginx) web server software expands the 4xx error space to signal issues with the client's request.[[86\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-87)[[87\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-88)

- 444 No Response

  Used internally[[88\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-89) to instruct the server to return no information to the client and close the connection immediately.

- 494 Request header too large

  Client sent too large request or too long header line.

- 495 SSL Certificate Error

  An expansion of the [400 Bad Request](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#400) response code, used when the client has provided an invalid [client certificate](https://en.wikipedia.org/wiki/Client_certificate).

- 496 SSL Certificate Required

  An expansion of the [400 Bad Request](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#400) response code, used when a client certificate is required but not provided.

- 497 HTTP Request Sent to HTTPS Port

  An expansion of the [400 Bad Request](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#400) response code, used when the client has made a HTTP request to a port listening for HTTPS requests.

- 499 Client Closed Request

  Used when the client has closed the request before the server could send a response.

### Cloudflare

[Cloudflare](https://en.wikipedia.org/wiki/Cloudflare)'s reverse proxy service expands the 5xx series of errors space to signal issues with the origin server.[[89\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-90)

- 520 Web Server Returned an Unknown Error

  The origin server returned an empty, unknown, or unexpected response to Cloudflare.[[90\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-91)

- 521 Web Server Is Down

  The origin server refused connections from Cloudflare. Security solutions at the origin may be blocking legitimate connections from certain Cloudflare IP addresses.

- 522 Connection Timed Out

  Cloudflare timed out contacting the origin server.

- 523 Origin Is Unreachable

  Cloudflare could not reach the origin server; for example, if the [DNS records](https://en.wikipedia.org/wiki/DNS_record) for the origin server are incorrect or missing.

- 524 A Timeout Occurred

  Cloudflare was able to complete a TCP connection to the origin server, but did not receive a timely HTTP response.

- 525 SSL Handshake Failed

  Cloudflare could not negotiate a [SSL/TLS handshake](https://en.wikipedia.org/wiki/Transport_Layer_Security#TLS_handshake) with the origin server.

- 526 Invalid SSL Certificate

  Cloudflare could not validate the SSL certificate on the origin web server. Also used by [Cloud Foundry](https://en.wikipedia.org/wiki/Cloud_Foundry)'s gorouter.

- 527 Railgun Error

  Error 527 indicates an interrupted connection between Cloudflare and the origin server's Railgun server.[[91\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-92)

- 530

  Error 530 is returned along with a 1xxx error.[[92\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-93)

### AWS Elastic Load Balancer

[Amazon](https://en.wikipedia.org/wiki/Amazon_(company))'s [Elastic Load Balancing](https://en.wikipedia.org/wiki/Elastic_Load_Balancing) adds a few custom return codes

- 460

  Client closed the connection with the load balancer before the idle timeout period elapsed. Typically when client timeout is sooner than the Elastic Load Balancer's timeout.[[93\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-:0-94)

- 463

  The load balancer received an X-Forwarded-For request header with more than 30 IP addresses.[[93\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-:0-94)

- 561 Unauthorized

  An error around authentication returned by a server registered with a load balancer. You configured a listener rule to authenticate users, but the identity provider (IdP) returned an error code when authenticating the user.[[94\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-95)

## Caching warning codes

The following [caching](https://en.wikipedia.org/wiki/Web_cache) related warning codes are specified under RFC 7234. Unlike the other status codes above, these are not sent as the response status in the HTTP protocol, but as part of the "Warning" HTTP header.[[95\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-96)[[96\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-97) Since this header is often neither sent by servers nor acknowledged by clients, it will soon be obsoleted by the [HTTP Working Group](https://httpwg.org/).[[97\]](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#cite_note-98)

- 110 Response is Stale

  A response provided by a cache is stale (the expiration time set for it has passed).

- 111 Revalidation Failed

  An attempt to validate the response failed, due to an inability to reach the server.

- 112 Disconnected Operation

  The cache is intentionally disconnected from the rest of the network.

- 113 Heuristic Expiration

  Sent If a cache heuristically chose a freshness lifetime greater than 24 hours and the response's age is greater than 24 hours.

- 199 Miscellaneous Warning

  Arbitrary, non-specific warning.

- 214 Transformation Applied

  Added by a proxy if it applies any transformation to the representation, such as changing the content-coding, media-type or the like.

- 299 Miscellaneous Persistent Warning

  Same as 199, but indicating a persistent warning.