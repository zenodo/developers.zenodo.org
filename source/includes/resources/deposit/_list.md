### List

List all depositions for the currently authenticated user.

```python
import requests
response = requests.get('/api/deposit/depositions',
                        params={'access_token': ACCESS_TOKEN})
print response.json()
```

```shell
curl -i /api/deposit/depositions/?access_token=ACCESS_TOKEN
```

#### HTTP Request

`GET /api/deposit/depositions`

#### Success Response

* **Code:** `200 OK`
* **Body**: an array of [deposition](#deposit) resources.

#### Error Response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
