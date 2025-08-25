### Update

Update a deposition file resource. Currently the only use is renaming an already
uploaded file. If you one to replace the actual file, please delete the file and
upload a new file.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" https://zenodo.org/api/deposit/depositions/1234/files/21fedcba-9876-5432-1fed-cba987654321 -X PUT
     -H "Content-Type: application/json"
     --data '{"filename": "someothername.csv"}'
```

```python
import json
import requests

url = 'https://zenodo.org/api/deposit/depositions/1234/files/21fedcba-9876-5432-1fed-cba987654321'
headers = {"Content-Type": "application/json", "Authorization": f"Bearer {ACCESS_TOKEN}"}
data = {"name": "someothername.csv"}
r = requests.put(url, data=json.dumps(data), headers=headers)
```

#### HTTP Request

`PUT /api/deposit/depositions/:id/files/:file_id`

#### Request headers

`Content-Type: application/json`


#### Scopes

`deposit:write`

#### Data

A partial [deposition file](#deposition-file) resources with only the
`filename` attributes. Example:

```json
{
    "name": "<new_file_name>"
}
```

#### Success response

* **Code:** `200 OK`
* **Body**: a [deposition file](#deposition-file) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
