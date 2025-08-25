### Retrieve

Retrieve a single deposition file.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" https://zenodo.org/api/deposit/depositions/1234/files/12345678-9abc-def1-2345-6789abcdef12

```

```python
import requests
r = requests.get('https://zenodo.org/api/deposit/depositions/1234/files/12345678-9abc-def1-2345-6789abcdef12',
                 headers={'Authorization': f'Bearer {ACCESS_TOKEN}'})
```

#### HTTP Request

`GET /api/deposit/depositions/:id/files/:file_id`


#### Success Response

* **Code:** `200 OK`
* **Body**: a [deposition file](#deposition-file) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
