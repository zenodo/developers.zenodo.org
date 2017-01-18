### Publish

Publish a deposition. Note, once a deposition is published, you can no longer
delete it.

```shell
curl -i -X POST https://zenodo.org/api/deposit/depositions/1234/actions/publish?access_token=ACCESS_TOKEN
```

```python
import requests
r = requests.post('https://zenodo.org/api/deposit/depositions/1234/actions/publish',
                  params={'access_token': ACCESS_TOKEN})
```

#### HTTP Request

`POST /api/deposit/depositions/:id/actions/publish`

#### Scopes

`deposit:actions`

#### Success response

* **Code:** `202 Accepted`
* **Body**: a [deposition](#deposit) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
