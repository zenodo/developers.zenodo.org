### Sort

Sort the files for a deposition. By default, the first file is shown in the file
preview.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" https://zenodo.org/api/deposit/depositions/1234/files -X PUT
     -H "Content-Type: application/json"
     --data '[{"id":"21fedcba-9876-5432-1fed-cba987654321"}, {"id":"12345678-9abc-def1-2345-6789abcdef12"}]'
```

```python
import json
import requests

url = 'https://zenodo.org/api/deposit/depositions/1234/files'
headers = {"Content-Type": "application/json", "Authorization": f"Bearer {ACCESS_TOKEN}"}
data = [{'id': '21fedcba-9876-5432-1fed-cba987654321'},
        {'id': '12345678-9abc-def1-2345-6789abcdef12'}]
r = requests.put(url, data=json.dumps(data), headers=headers)
```

#### HTTP Request

`PUT /api/deposit/depositions/:id/files`

#### Request headers

`Content-Type: application/json`

#### Scopes

`deposit:write`

#### Data

A JSON array of partial [deposition file](#deposition-file) resources with only
the `id` attribute. Example:

```json
[
    {"id": "<file_id_1>"},
    {"id": "<file_id_2>"},
    "..."
]
```

#### Success response

* **Code:** `200 OK`
* **Body**: an array of [deposition file](#deposition-file) resources.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
