### Retrieve

Retrieve a single record resource.

```shell
curl -i /api/records/1234
```

```python
import requests
r = requests.get("/api/records/1234)
```

#### HTTP Request

`GET /api/records/:id`

Again, the output format of the search can be specified in the [header](#header)

#### Success response

* **Code:** `200 OK`
* **Body**: a [record](#records) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors). |
