### Edit

Unlock already submitted deposition for editing.

```shell
curl -i -X POST https://zenodo.org/api/deposit/depositions/1234/actions/edit?access_token=ACCESS_TOKEN
```

```python
import requests
r = requests.post('https://zenodo.org/api/deposit/depositions/1234/actions/edit',
                  params={'access_token': ACCESS_TOKEN})
```

#### HTTP Request

`POST /api/deposit/depositions/:id/actions/edit`

#### Scopes

`deposit:actions`

#### Success response

* **Code:** `201 Created`
* **Body**: a [deposition](#deposit) resource.

#### Error response

* `400 Bad Request`: Deposition state does not allow for editing (e.g.
  depositions in state `inprogress`).
* `409 Conflict`: Deposition is in the process of being integrated, please wait
  5 minutes before trying again.

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
