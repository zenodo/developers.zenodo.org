
### Delete

Delete an existing deposition resource. Note, only unpublished depositions may
be deleted.

```shell
curl -i -X DELETE -H "Authorization: Bearer ACCESS_TOKEN" \
  -H "User-Agent: MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)" \
  https://zenodo.org/api/deposit/depositions/1234
```

```python
import requests
headers = {'Authorization': f'Bearer {ACCESS_TOKEN}',
           'User-Agent': 'MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)'}
r = requests.delete('https://zenodo.org/api/deposit/depositions/1234',
                    headers=headers)
```

#### HTTP Request

`DELETE /api/deposit/depositions/:id`

#### Scopes

`deposit:write`

#### Success Response

* **Code:** `201 Created`
* **Body**: Empty.

#### Error Response

* `404 Not found`: Deposition does not exist.
* `403 Forbidden`: Deleting an already published deposition.

See also [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
