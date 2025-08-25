### Discard

Discard changes in the current editing session.

```shell
curl -i -X POST -H "Authorization: Bearer ACCESS_TOKEN" \
  https://zenodo.org/api/deposit/depositions/1234/actions/discard
```

```python
import requests
headers = {'Authorization': f'Bearer {ACCESS_TOKEN}'}
r = requests.post('https://zenodo.org/api/deposit/depositions/1234/actions/discard',
                  headers=headers)
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
