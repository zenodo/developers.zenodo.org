### Retrieve

Retrieve a single license resource.

```python
import requests
r = requests.get("/api/licenses/cc-by-nc-4.0")
```

```shell
curl /api/licenses/cc-by-nc-4.0
```

#### HTTP Request

`GET /api/licenses/:id`

#### Success response

* **Code:** `200 OK`
* **Body**: a [license](#license) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors). |
