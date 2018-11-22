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
| `q`</br>_string_     | optional | Search query (using Elasticsearch query string syntax). |
| `page`</br>_integer_ | optional | Page number for pagination.                             |
| `size`</br>_integer_ | optional | Number of results to return per page.                   |

#### Success Response

* **Code:** `200 OK`
* **Body**: an array of [license](#license) resources.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors). |
