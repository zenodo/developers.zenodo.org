### Create

Create a new deposition resource.

```shell
curl -i -H "Content-Type: application/json" -X POST
     --data '{}' /api/deposit/depositions/?access_token=ACCESS_TOKEN

# or

curl -i -H "Content-Type: application/json" -X POST
     --data '{"metadata": {"title": "My first upload", "upload_type": "poster", "description": "This is my first upload", "creators": [{"name": "Doe, John", "affiliation": "Zenodo"}]}}' /api/deposit/depositions/?access_token=ACCESS_TOKEN
```

```python
import json
import requests

url = "/api/deposit/depositions/?access_token=ACCESS_TOKEN"
headers = {"Content-Type": "application/json"}
r = requests.post(url, data="{}", headers=headers)
```

#### HTTP Request

`POST /api/deposit/depositions`


#### Request headers

`Content-Type: application/json`


#### Data

An empty JSON object `{}` or a [deposition metadata](#deposit-metadata)
resource. Example: `{"metadata": {"upload_type": "presentation" } }`


#### Scopes

`deposit:write`


#### Success Response

* **Code:** `201 Created`
* **Body**: a [deposition](#deposit) resource.

#### Error Response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).

