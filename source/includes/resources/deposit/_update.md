### Update

Update an existing deposition resource.


```shell
curl -i -H "Content-Type: application/json" -X PUT
     --data '{"metadata": {"title": "My first upload", "upload_type": "poster", "description": "This is my first upload", "creators": [{"name": "Doe, John", "affiliation": "Zenodo"}]}}' https://zenodo.org/api/deposit/depositions/1234?access_token=ACCESS_TOKEN
```

```python
import json
import requests

data = {
    "metadata": {
        "title": "My first upload",
        "upload_type": "poster",
        "description": "This is my first upload",
        "creators": [
            {"name": "Doe, John", "affiliation": "Zenodo"}
        ]
    }
}
url = "https://zenodo.org/api/deposit/depositions/1234?access_token=ACCESS_TOKEN"
headers = {"Content-Type": "application/json"}

r = requests.put(url, data=json.dumps(data), headers=headers)
```

#### HTTP Request

`PUT /api/deposit/depositions/:id`

#### Request headers

`Content-Type: application/json`

#### Scopes

`deposit:write`

<div class="align-columns"></div>

```json
{
    "metadata": {
        "upload_type": "presentation",
        "...": "..."
    }
}
```

#### Data parameters

A [deposition metadata](#deposit-metadata) resource.

#### Success response

* **Code:** `200 OK`
* **Body**: a [deposition](#deposit) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
