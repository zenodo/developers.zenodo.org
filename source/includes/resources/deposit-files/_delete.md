### Delete

Delete an existing deposition file resource. Note, only deposition files for
unpublished depositions may be deleted.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" -X DELETE https://zenodo.org/api/deposit/depositions/1234/files/21fedcba-9876-5432-1fed-cba987654321
```

```python
import requests
r = requests.delete('https://zenodo.org/api/deposit/depositions/1234/files/21fedcba-9876-5432-1fed-cba987654321',
                    headers={'Authorization': f'Bearer {ACCESS_TOKEN}'})
```

#### HTTP Request

`DELETE /api/deposit/depositions/:id/files/:file_id`

#### Scopes

`deposit:write`

#### Success response

* **Code:** `204 No Content`
* **Body**: Empty.

#### Error response

* `404 Not found`: Deposition file does not exist.
* `403 Forbidden`: Deleting an already published deposition.

See also [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
