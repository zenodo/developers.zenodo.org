### List

List all deposition files for a given deposition.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" https://zenodo.org/api/deposit/depositions/1234/files
```

```python
import requests
r = requests.get('https://zenodo.org/api/deposit/depositions/1234/files',
                 headers={'Authorization': f'Bearer {ACCESS_TOKEN}'})
```

#### HTTP Request

`GET /api/deposit/depositions/:id/files`

#### Success response

* **Code:** `200 OK`
* **Body**: an array of [deposition file](#deposition-file) resources.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
