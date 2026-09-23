### Retrieve

Retrieve a single deposition resource.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" \
  -H "User-Agent: MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)" \
  /api/deposit/depositions/1234
```

```python
import requests
headers = {'Authorization': f'Bearer {ACCESS_TOKEN}',
           'User-Agent': 'MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)'}
r = requests.get("/api/deposit/depositions/1234", headers=headers)
```

#### HTTP Request

`GET /api/deposit/depositions/:id`

#### Success response

* **Code:** `200 OK`
* **Body**: a [deposition](#deposit) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors). |
