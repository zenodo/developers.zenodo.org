
### Delete

Delete an existing deposition resource. Note, only unpublished depositions may
be deleted.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" https://zenodo.org/api/deposit/depositions/1234 -X DELETE
```

```python
import requests
r = requests.delete('https://zenodo.org/api/deposit/depositions/1234',
                    headers={'Authorization': f'Bearer {ACCESS_TOKEN}'})
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
