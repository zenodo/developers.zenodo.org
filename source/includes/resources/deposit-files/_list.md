### List

List all deposition files for a given deposition.

```shell
curl -i https://zenodo.org/api/deposit/depositions/1234/files?access_token=ACCESS_TOKEN
```

```python
import requests
r = requests.get('https://zenodo.org/api/deposit/depositions/1234/files',
                 params={'access_token': ACCESS_TOKEN})
```

#### HTTP Request

`GET /api/deposit/depositions/:id/files`

#### Success response

* **Code:** `200 OK`
* **Body**: an array of [deposition file](#deposition-file) resources.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
