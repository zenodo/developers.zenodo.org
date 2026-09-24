### List

List all deposition files for a given deposition.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" \
  -H "User-Agent: MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)" \
  https://zenodo.org/api/deposit/depositions/1234/files
```

```python
import requests
headers = {'Authorization': f'Bearer {ACCESS_TOKEN}',
           'User-Agent': 'MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)'}
r = requests.get('https://zenodo.org/api/deposit/depositions/1234/files',
                 headers=headers)
```

#### HTTP Request

`GET /api/deposit/depositions/:id/files`

#### Success response

* **Code:** `200 OK`
* **Body**: an array of [deposition file](#deposition-file) resources.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
