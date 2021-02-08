# WS-Security

From Wikipedia, the free encyclopedia

[Jump to navigation](https://en.wikipedia.org/wiki/WS-Security#mw-head)[Jump to search](https://en.wikipedia.org/wiki/WS-Security#searchInput)

==**Web Services Security** (**WS-Security**, **WSS**) is an extension to [SOAP](https://en.wikipedia.org/wiki/SOAP_(protocol)) to apply security to [Web services](https://en.wikipedia.org/wiki/Web_service).== It is a member of the [Web service specifications](https://en.wikipedia.org/wiki/List_of_Web_service_specifications) and was published by [OASIS](https://en.wikipedia.org/wiki/OASIS_(organization)).

==The protocol specifies how integrity and confidentiality can be enforced on messages== and allows the communication of various security token formats, such as [Security Assertion Markup Language](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language) (SAML), [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol)), and [X.509](https://en.wikipedia.org/wiki/X.509). Its main focus is the use of [XML Signature](https://en.wikipedia.org/wiki/XML_Signature) and [XML Encryption](https://en.wikipedia.org/wiki/XML_Encryption) to provide end-to-end security.

## Features[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=1)]

WS-Security describes three main mechanisms:

- ==How to sign SOAP messages to assure integrity.== Signed messages also provide [non-repudiation](https://en.wikipedia.org/wiki/Non-repudiation).
- ==How to encrypt SOAP messages to assure confidentiality.==
- ==How to attach security tokens to ascertain the sender's identity.==

==The specification allows a variety of signature formats, encryption algorithms and multiple trust domains, and is open to various security token models, such as: X.509 certificates,Kerberos tickets,User ID/Password credentials,SAML Assertions, and custom-defined tokens.==

The token formats and semantics are defined in the associated profile documents.

==WS-Security incorporates security features in the header of a SOAP message,== working in the [application layer](https://en.wikipedia.org/wiki/Application_layer).

These mechanisms by themselves do not provide a complete security solution for Web services. Instead, this specification is a building block that can be used in conjunction with other Web service extensions and higher-level application-specific protocols to accommodate a wide variety of security models and security technologies. In general, WSS by itself does not provide any guarantee of security. When implementing and using the framework and syntax, it is up to the implementor to ensure that the result is not vulnerable.

Key management, trust bootstrapping, federation and agreement on the technical details (ciphers, formats, algorithms) is outside the scope of WS-Security.

## Use cases[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=2)]

### End-to-end security[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=3)]

If a SOAP intermediary is required, and the intermediary is not more or less trusted, messages need to be signed and optionally encrypted. This might be the case of an application-level proxy at a network perimeter that will terminate TCP (transmission control protocol) connections.

### Non-repudiation[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=4)]

One method for [non-repudiation](https://en.wikipedia.org/wiki/Non-repudiation) is to write transactions to an audit trail that is subject to specific security safeguards. Digital signatures, which WS-Security supports, provide a more direct and verifiable non-repudiation proof.

### Alternative transport bindings[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=5)]

Although almost all SOAP services implement HTTP bindings, in theory other bindings such as [JMS](https://en.wikipedia.org/wiki/Java_Message_Service) or SMTP could be used; in this case end-to-end security would be required.

### Reverse proxy/common security token[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=6)]

Even if the web service relies upon transport layer security, it might be required for the service to know about the end user, if the service is relayed by a (HTTP-) reverse proxy. A WSS header could be used to convey the end user's token, vouched for by the reverse proxy.

## Issues[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=7)]

- If there are frequent message exchanges between service provider and consumer, the overhead of XML SIG and XML ENC are significant. If end-to-end security is required, a protocol like [WS-SecureConversation](https://en.wikipedia.org/wiki/WS-SecureConversation) may reduce the overhead. If it's sufficient, use only encryption *or* signing, as the combination of both is significantly slower than the mere sum of the single operations. See [Performance](https://en.wikipedia.org/wiki/WS-Security#Performance) below.
- The merging of several XML schemata like SOAP, SAML, XML ENC, XML SIG might cause dependencies on different versions of library functions like canonicalization and parsing, which are difficult to manage in an application server.
- If only [CBC mode encryption/decryption](https://en.wikipedia.org/wiki/Padding_(cryptography)) is applied or if the CBC mode decryption is applied without verifying a secure checksum ([signature](https://en.wikipedia.org/wiki/Digital_Signature) or [MAC](https://en.wikipedia.org/wiki/Message_authentication_code)) before decryption then the implementation is likely to be vulnerable to [padding oracle attacks](https://en.wikipedia.org/wiki/Padding_oracle_attack).[[1\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-1)

## Performance[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=8)]

WS-Security adds significant overhead to SOAP processing due to the increased size of the message on the wire, XML and cryptographic processing, requiring faster CPUs and more memory and bandwidth.

An evaluation in 2005[[2\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-Lui-2) measured 25 types of SOAP messages of different size and complexity processed by WSS4J with both WS-Security and WS-SecureConversation on a Pentium 4/2.8 GHz CPU. Some findings were:

- Encryption was faster than signing.
- Encryption and signing together were 2–7 times slower than signing alone and produced significantly bigger documents.
- Depending on the type of message, WS-SecureConversation either made no difference or reduced processing time by half in the best case.
- It took less than 10 milliseconds to sign or encrypt up to an array of 100 kilobytes, but it took about 100~200 to perform the security operations for SOAP.

Another benchmark in 2006[[3\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-3) resulted in this comparison:

|                Security mechanism                | Messages/second |
| :----------------------------------------------: | :-------------: |
|  WS-Security (X.509) XML Signature & Encryption  |       352       |
| WS-SecureConversation XML Signature & Encryption |       798       |
|             Transport Layer Security             |      2918       |

## History[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=9)]

Web services initially relied on the underlying transport security. In fact, most implementations still do[*[citation needed](https://en.wikipedia.org/wiki/Wikipedia:Citation_needed)*]. As SOAP allows for multiple transport bindings, such as HTTP and SMTP, a SOAP-level security mechanism was needed. The lack of end-to-end security because of the dependence on transport security was another factor.

The protocol was originally developed by [IBM](https://en.wikipedia.org/wiki/IBM), [Microsoft](https://en.wikipedia.org/wiki/Microsoft), and [VeriSign](https://en.wikipedia.org/wiki/VeriSign). Their original specification[[4\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-Atkinson-4)[[5\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-Atkinson-alt-5) was published on 5 April 2002 and was followed up by an addendum[[6\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-Della-Libera-6) on 18 August 2002.

In 2002, two proposals were submitted to the OASIS WSS Technical Committee:[[7\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-wss-tc-7) Web Service Security (WS-Security) and Web Services Security Addendum. As a result, WS-Security was published:

- WS-Security 1.0 was released on 19 April 2004.
- Version 1.1 was released on 17 February 2006.

The version 1.0 standard published by OASIS contained a number of significant differences to the standard proposed by the IBM, Microsoft and VeriSign consortium. Many systems were developed using the proposed standard and the differences made them incompatible with systems developed to the OASIS standard.

Some refer to the pre-OASIS specification as the "WS-Security Draft 13",[[8\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-draft13-8) or as the Web Services Security Core Specification. However these names are not widely known and indeed today it is hard to clearly identify whether an application or server is using a pre- or post-OASIS specification. Most forum posts use the keyword "WSSE" to refer to the pre-OASIS version because it mandated the use of a "wsse" [XML namespace](https://en.wikipedia.org/wiki/XML_namespace) prefix to the[[9\]](https://en.wikipedia.org/wiki/WS-Security#cite_note-9) URL (and similar URLs of different versions).

The protocol is officially called WSS and developed via committee in Oasis-Open.

## Associated specifications[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=10)]

The following draft specifications are associated with WS-Security: [WS-Federation](https://en.wikipedia.org/wiki/WS-Federation), [WS-Privacy](https://en.wikipedia.org/w/index.php?title=WS-Privacy&action=edit&redlink=1), [WS-Test](https://en.wikipedia.org/w/index.php?title=WS-Test&action=edit&redlink=1).

The following approved specifications are associated with WS-Security: [WS-Policy](https://en.wikipedia.org/wiki/WS-Policy), [WS-SecureConversation](https://en.wikipedia.org/wiki/WS-SecureConversation), [WS-Trust](https://en.wikipedia.org/wiki/WS-Trust), [ID-WSF](https://en.wikipedia.org/wiki/ID-WSF).

The following architectures make use of WS-Security: [TAS3](https://en.wikipedia.org/w/index.php?title=TAS3&action=edit&redlink=1).

## Alternative[[edit](https://en.wikipedia.org/w/index.php?title=WS-Security&action=edit&section=11)]

In point-to-point situations [confidentiality](https://en.wikipedia.org/wiki/Confidentiality) and [data integrity](https://en.wikipedia.org/wiki/Data_integrity) can also be enforced on Web services through the use of [Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security) (TLS), for example, by sending messages over [HTTPS](https://en.wikipedia.org/wiki/Https). WS-Security, however, addresses the wider problem of maintaining integrity and confidentiality of messages until after a message is sent from the originating node, providing so-called [end to end security](https://en.wikipedia.org/wiki/End-to-end_principle).

Applying TLS can significantly reduce the overhead involved by removing the need to encode keys and message signatures into [XML](https://en.wikipedia.org/wiki/XML) before sending. A challenge in using TLS would be if messages needed to go through an application-level [proxy server](https://en.wikipedia.org/wiki/Proxy_server), as it would need to be able to see the request for routing. In such an example, the server would see the request coming from the proxy, not the client; this could be worked around by having the proxy have a copy of the client's key and certificate, or by having a signing certificate trusted by the server, with which it could generate a key/certificate pair matching those of the client. However, as the proxy is not operating on the message, it does not ensure end-to-end security, but only ensures point-to-point security.