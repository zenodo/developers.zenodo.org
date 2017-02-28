## Testing

We provide a sandbox environment where you can test your API integration
during development. The sandbox environment is available at
[http://sandbox.zenodo.org](https://sandbox.zenodo.org).

Please note that the sandbox environment can be **cleaned at anytime**.
Also, the sandbox environment will issue test DOIs using the 10.5072 prefix
instead of Zenodo's normal prefix (10.5281).

## Versioning

The REST API is versioned. We strive not to make backward incompatible changes
to the API, but if we do, we release a new version. [Changes](#changes) to the
API are documented on this page, and advance notification is given on our
[Twitter account](https://twitter.com/zenodo_org).

## Authentication

All API requests must be authenticated and over HTTPS. Any request over plain
HTTP will fail. We support authentication with via OAuth 2.0.

### Creating a personal access token

1. [Register](https://zenodo.org/signup) for a Zenodo account if you don't
   already have one.
2. Go to your [Applications](https://zenodo.org/account/settings/applications/),
   to [create a new token](
   https://zenodo.org/account/settings/applications/tokens/new/).
3. Select the OAuth scopes you need (for the quick start tutorial you need
   `deposit:write` and `deposit:actions`).

<aside class="warning">
  Do not share your personal access token with anyone else, and only use it over
  HTTPS.
</aside>

### Using access tokens

An access token must be included in all requests as either:

```
GET /api/deposit/depositions?access_token=<ACCESS_TOKEN>
```

- an URL parameter (named ``access_token``):

<div class="align-columns"></div>

```
GET /api/deposit/depositions
Authorization: Bearer <ACCESS_TOKEN>
```

- or as HTTP request header (``Authorization``):

<div class="align-columns"></div>

### Scopes

Scopes assigns permissions to your access token to limit access to data and
actions in Zenodo. The following scopes exist:

| Name              | Description                                                                   |
|:------------------|:------------------------------------------------------------------------------|
| `deposit:write`   | Grants write access to depositions, but does not allow publishing the upload. |
| `deposit:actions` | Grants access to publish, edit and discard edits for depositions.             |


## Requests

The base URL of the API is `https://zenodo.org/api/`.

All `POST` and `PUT` request bodies must be JSON encoded, and must have content
type of `application/json` unless specified otherwise in the specific resource
(e.g. in the case of file uploads). The API will return a `415` error (see [HTTP
status codes](#http-status-codes) and [error responses](#errors)) if the wrong
content type is provided.

## Responses

```json
{
    "field1": "value",
    "...": "..."
}
```

All response bodies are JSON encoded (UTF-8 encoded). A single resource is
represented as a JSON object:

<div class="align-columns"></div>

```json
[
    {
        "field1": "value",
        "...": "..."
    }
    "..."
]
```

A collection of resources is represented as a JSON array of objects:

<div class="align-columns"></div>

```
YYYY-MM-DDTHH:MM:SS+00:00
```

Timestamps are in UTC and formatted according to [ISO
8601](http://en.wikipedia.org/wiki/ISO_8601):

## HTTP status codes

We use the following HTTP status codes to indicate success or failure of a
request.

| Code  | Name                   | Description                                                                                                                                                              |
|:------|:-----------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `200` | OK                     | Request succeeded. Response included. Usually sent for GET/PUT/PATCH requests.                                                                                           |
| `201` | Created                | Request succeeded. Response included. Usually sent for POST requests.                                                                                                    |
| `202` | Accepted               | Request succeeded. Response included. Usually sent for POST requests, where background processing is needed to fulfill the request.                                      |
| `204` | No Content             | Request succeeded. No response included. Usually sent for DELETE requests.                                                                                               |
| `400` | Bad Request            | Request failed. [Error response](#errors) included.                                                                                                                      |
| `401` | Unauthorized           | Request failed, due to an invalid access token. [Error response](#errors) included.                                                                                      |
| `403` | Forbidden              | Request failed, due to missing authorization (e.g. deleting an already submitted upload or missing scopes for your access token). [Error response](#errors) included.    |
| `404` | Not Found              | Request failed, due to the resource not being found. [Error response](#errors) included.                                                                                 |
| `405` | Method Not Allowed     | Request failed, due to unsupported HTTP method. [Error response](#errors) included.                                                                                      |
| `409` | Conflict               | Request failed, due to the current state of the resource (e.g. edit a deopsition which is not fully integrated). [Error response](#errors) included.                     |
| `415` | Unsupported Media Type | Request failed, due to missing or invalid request header `Content-Type`. [Error response](#errors) included.                                                             |
| `429` | Too Many Requests      | Request failed, due to rate limiting. [Error response](#errors) included.                                                                                                |
| `500` | Internal Server Error  | Request failed, due to an internal server error. Error response _NOT_ included. Don't worry, Zenodo admins have been notified and will be dealing with the problem ASAP. |


## Errors

Error responses for 400 series errors (e.g. 400, 401, 403, ...) are returned as
a JSON object with two attributes `message` and `status` (HTTP status code), and
possibly an attribute `errors` with a list of more detailed errors.

<div class="align-columns"></div>

```json
{
    "message": "Deposition not found",
    "status": 404
}
```

Example of a simple error message without further detailed errors:


<div class="align-columns"></div>

```json
{
    "message": "Validation error",
    "status": 400,
    "errors": [
        {"code": 10, "message":"Not a valid choice", "field": "access_right"}
    ]
}
```

Example of an error message with additional detailed error messages:

The attribute `errors` is a JSON array of objects, with the attributes `message`
and `code`, and possibly `field` for validation errors.
