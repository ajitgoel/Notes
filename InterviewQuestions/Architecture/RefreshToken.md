## WHAT ARE REFRESH TOKENS?

==Modern secure applications often use **[access tokens](https://auth0.com/docs/tokens/overview-access-tokens)** to ensure a user has access to the appropriate resources, and these access tokens typically have a limited lifetime.== This is done for various security reasons: for one, limiting the lifetime of the access token limits the amount of time an attacker can use a stolen token. In addition, the information contained in or referenced by the access token could become stale.

When access tokens expire or become invalid but the application still needs to access a protected resource, the application faces the problem of getting a new access token without forcing the user to once again grant permission. To solve this problem, OAuth 2.0 introduced an artifact called a **[refresh token](https://auth0.com/docs/tokens/refresh-token/current)**. ==A refresh token allows an application to obtain a new access token without prompting the user.==

==A refresh token can be requested by an application as part of the process of obtaining an access token.== Many authorization servers implement the [refresh token request mechanism](https://openid.net/specs/openid-connect-core-1_0.html#OfflineAccess) defined in the OpenID Connect [specification](https://openid.net/specs/openid-connect-core-1_0.html). In this case, an application must include the `offline_access` scope when initiating a request for an authorization code. After the user successfully authenticates and grants consent for the application to access the protected resource, the application will receive an authorization code that can be exchanged at the token endpoint for both an access and a refresh token.

## USING REFRESH TOKENS

When a new access token is needed, the application can make a `POST` request back to the token endpoint using a grant type of `refresh_token` (web applications need to include a [client secret](https://auth0.com/docs/applications/concepts/client-secret)). To use a refresh token to obtain a new ID token, the authorization server would need to support OpenID Connect and the [scope](https://auth0.com/docs/scopes/current) of the original request would need to include `openid`.

While refresh tokens are often long-lived, the authorization server can invalidate them. Some of the reasons a refresh token may no longer be valid include:

- the authorization server has revoked the refresh token
- the user has revoked their consent for authorization
- the refresh token has expired
- the authentication policy for the resource has changed (e.g., originally the resource only used usernames and passwords, but now it requires [MFA](https://auth0.com/docs/multifactor-authentication))

Because refresh tokens have the potential for a long lifetime, developers should ensure that strict storage requirements are in place to keep them from being leaked. For example, on web applications, refresh tokens should only leave the backend when being sent to the authorization server, and the backend should be secure. The client secret should be protected in a similar fashion. Mobile applications do not require a client secret, but they should still be sure to store refresh tokens somewhere only the client application can access.