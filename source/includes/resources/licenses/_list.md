### List

Search through licenses.

```python
import requests
response = requests.get('/api/licenses/')
print(response.json())
```

```shell
curl /api/licenses/
```

#### HTTP Request

`GET /api/licenses/`

#### Query arguments

| Parameter            | Required | Description                                             |
| :------------------- | :------- | :------------------------------------------------------ |
| `q`</br>_string_     | optional | Search query (using [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html) query string syntax - note that some characters have special meaning here, including ``/``, which is also present in full DOIs). |
| `page`</br>_integer_ | optional | Page number for pagination.                             |
| `size`</br>_integer_ | optional | Number of results to return per page.                   |

#### Success Response

* **Code:** `200 OK`
* **Body**: an array of [license](#license) resources.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors). |
