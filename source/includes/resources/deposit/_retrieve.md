### Retrieve

Retrieve a single deposition resource.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" /api/deposit/depositions/1234
```

```python
import requests
r = requests.get("/api/deposit/depositions/1234", headers={'Authorization': f'Bearer {ACCESS_TOKEN}'})
```

#### HTTP Request

`GET /api/deposit/depositions/:id`

#### Success response

* **Code:** `200 OK`
* **Body**: a [deposition](#deposit) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors). |
