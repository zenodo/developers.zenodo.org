### List

List all depositions for the currently authenticated user.

```python
import requests
response = requests.get('/api/deposit/depositions',
                        params={'q': 'my title'},
                        headers={'Authorization': f'Bearer {ACCESS_TOKEN}'})
print(response.json())
```

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" /api/deposit/depositions/
```

#### HTTP Request

`GET /api/deposit/depositions`

#### Query arguments

| Parameter | Required | Description |
|:----------|:---------|:------------|
| `q`</br>_string_  | optional | Search query (using [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html) query string syntax - note that some characters have special meaning here, including ``/``, which is also present in full DOIs). |
| `status`</br>_string_ | optional | Filter result based on deposit status (either ``draft`` or ``published``) |
| `sort`</br>_string_ | optional | Sort order (``bestmatch`` or ``mostrecent``). Prefix with minus to change form ascending to descending (e.g. ``-mostrecent``). |
| `page`</br>_integer_ | optional | Page number for pagination. |
| `size`</br>_integer_ | optional | Number of results to return per page. |
| `all_versions`</br>_integer/string_ | optional | Show (`true` or `1`) or hide (`false` or `0`) all versions of deposits. |

#### Success Response

* **Code:** `200 OK`
* **Body**: an array of [deposition](#deposit) resources.

#### Error Response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
