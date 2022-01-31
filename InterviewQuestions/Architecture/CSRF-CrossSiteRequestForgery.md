## Definition

==Cross-Site Request Forgery (CSRF) is an attack that forces authenticated users to submit a request to a Web application against which they are currently authenticated.== CSRF attacks exploit the trust a Web application has in an authenticated user. (Conversely, cross-site scripting (XSS) attacks exploit the trust a user has in a particular Web application). A CSRF attack exploits a vulnerability in a Web application if it cannot differentiate between a request generated by an individual user and a request generated by a user without their consent.

## How does Cross-Site Request Forgery work?

An attacker’s aim for carrying out a CSRF attack is to force the user to submit a state-changing request. Examples include:

- Submitting or deleting a record.
- Submitting a transaction.
- Purchasing a product.
- Changing a password.
- Sending a message.

Social engineering platforms are often used by attackers to launch a CSRF attack. This tricks the victim into clicking a URL that contains a maliciously crafted, unauthorized request for a particular Web application. The user’s browser then sends this maliciously crafted request to a targeted Web application. The request also includes any credentials related to the particular website (e.g., user session cookies). If the user is in an active session with a targeted Web application, the application treats this new request as an authorized request submitted by the user. Thus, the attacker succeeds in exploiting the Web application’s CSRF vulnerability.

A CSRF attack targets Web applications failing to differentiate between valid requests and forged requests controlled by attacker. There are many ways for an attacker to try and exploit the CSRF vulnerability.

To give you an example, let’s say that Bob has an online banking account on samplebank.com. He regularly visits this site to conduct transactions with his friend Alice. Bob is unaware that samplebank.com is vulnerable to CSRF attacks. Meanwhile, an attacker aims to transfer $5,000 from Bob’s account by exploiting this vulnerability. ==To successfully launch this attack:==

1. ==The attacker must build an exploit URL.==
2. ==The attacker must also trick Bob into clicking the exploit URL.==
3. ==Bob needs to have an active session with samplebank.com.==

==Let’s say that the online banking application is built using the GET method to submit a transfer request. As such, Bob’s request to transfer $500 to Alice (with account number 213367) might look like this:==

==*GET https://samplebank.com/onlinebanking/transfer?amount=500&accountNumber=213367 HTTP/1.1*==

==Aligning with the first requirement to successfully launch a CSRF attack, an attacker must craft a malicious URL to transfer $5,000 to the account 425654:==

==https://samplebank.com/onlinebanking/transfer?amount=5000&accountNumber=425654==

==Using various social engineering attack methods, an attacker can trick Bob into loading the malicious URL. This can be achieved in various ways. For instance, including malicious HTML image elements onto forms, placing a malicious URL on pages that are often accessed by users while logged into the application, or by sending a malicious URL through email.==

==The following is an example of a disguised URL:==

==<img src  = “https://samplebank.com/onlinebanking/transfer?amount=5000&accountNumber=425654” width=“0” height= “0”>==

==Consider the scenario that includes an image tag in an attacker-crafted email to Bob. Upon receiving it, Bob’s browser application opens this URL automatically—without human intervention. As a result, without Bob’s permission, a malicious request is sent to the online banking application. If Bob has an active session with samplebank.com, the application would treat this as an authorized amount transfer request coming from Bob. It would then transfer the amount to the account specified by an attacker.==

There are some limitations. To carry out a successful CSRF attack, consider the following:

- The success of a CSRF attack depends on a user’s session with a vulnerable application. The attack will only be successful if the user is in an active session with the vulnerable application.
- An attacker must find a valid URL to maliciously craft. The URL needs to have a state-changing effect on the target application.
- An attacker also needs to find the right values for the URL parameters. Otherwise, the target application might reject the malicious request.

## How can an application prevent a Cross-Site Request Forgery attack?

To defeat a CSRF attack, applications need a way to determine if the HTTP request is legitimately generated via the application’s user interface. The best way to achieve this is through a CSRF token. A CSRF token is a secure random token (e.g., synchronizer token or challenge token) that is used to prevent CSRF attacks. The token needs to be unique per user session and should be of large random value to make it difficult to guess.

A CSRF secure application assigns a unique CSRF token for every user session. These tokens are inserted within hidden parameters of HTML forms related to critical server-side operations. They are then sent to client browsers.

It is the application team’s responsibility to identify which server-side operations are sensitive in nature. The CSRF tokens must be a part of the HTML form—not stored in session cookies. The easiest way to add a non-predictable parameter is to use a secure hash function (e.g., SHA-2) to hash the user’s session ID. To ensure randomness, the tokens must be generated by a cryptographically secure random number generator.

Whenever a user invokes these critical operations, a request generated by the browser must include the associated CSRF token. This will be used by the application server to verify the legitimacy of the end-user request. The application server rejects the request if the CSRF token fails to match the test.