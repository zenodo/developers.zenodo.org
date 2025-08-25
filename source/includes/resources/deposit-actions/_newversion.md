### New version

Create a new version of a deposition.

This action will create a new deposit, which will be a snapshot of the current resouce, inheriting the metadata as well as snapshot of files.
The new version deposit will have a state similar to a new, unpublished deposit, most importantly its files will be modifiable as for a new deposit.

Only one unpublished new version deposit can be available at any moment, i.e.: calling new version action multiple times will have no effect, as long as the resulting new version deposit from the first call is not published or deleted.

NOTES: 
- The response body of this action is NOT the new version deposit, but the original resource.
The new version deposition can be accessed through the ``"latest_draft"`` under ``"links"`` in the response body.
- The ``id`` used to create this new version has to be the ``id`` of the latest version. It is not possible to use the global id that references all the versions.

```shell
curl -i -X POST -H "Authorization: Bearer ACCESS_TOKEN" \
  https://zenodo.org/api/deposit/depositions/1234/actions/newversion
```

```python
import requests
headers = {'Authorization': f'Bearer {ACCESS_TOKEN}'}
r = requests.post('https://zenodo.org/api/deposit/depositions/1234/actions/newversion',
                  headers=headers)
```

#### HTTP Request

`POST /api/deposit/depositions/:id/actions/newversion`

#### Scopes

`deposit:actions`

#### Success response

* **Code:** `201 Created`
* **Body**: a [deposition](#deposit) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
