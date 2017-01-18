### Discard

Discard changes in the current editing session.

```shell
curl -i -X POST https://zenodo.org/api/deposit/depositions/1234/actions/discard?access_token=ACCESS_TOKEN
```

```python
import requests
r = requests.post('https://zenodo.org/api/deposit/depositions/1234/actions/discard',
                  params={'access_token': ACCESS_TOKEN})
```

#### HTTP Request

`POST /api/deposit/depositions/:id/actions/discard`

#### Scopes

`deposit:actions`

#### Success response

* **Code:** `201 Created`
* **Body**: a [deposition](#deposit) resource.

#### Error response

* `400 Bad Request`: Deposition is not being edited.

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
