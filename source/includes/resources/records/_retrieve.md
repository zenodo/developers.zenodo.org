### Retrieve

Retrieve a single record.

```shell
curl -i https://zenodo.org/api/records/1234
```

```python
import requests
r = requests.get("https://zenodo.org/api/records/1234)
```

#### HTTP Request

`GET https://zenodo.org/api/records/:id`

Again, the output format of the search can be specified in the [header](#header)

#### Success response

* **Code:** `200 OK`
* **Body**: a [record](#records).

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors). |
