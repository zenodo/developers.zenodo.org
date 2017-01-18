### Create

`POST deposit/depositions`

|                  |                                                                                                                                                  |
|:-----------------|:-------------------------------------------------------------------------------------------------------------------------------------------------|
| Description      | Create a new deposition resource.                                                                                                                |
| URL              | {{BASE_URL}}api/deposit/depositions                                                                                                              |
| Method           | POST                                                                                                                                             |
| Request headers  | Content-Type: application/json                                                                                                                   |
| Scopes           | `deposit:write`                                                             #                                                                      |
| Data parameters  | An empty JSON object `{}` or a [deposition metadata](#restapi-rep-meta) resource. Example: `{"metadata": {"upload_type": "presentation", } }`    |
| Success response | * **Code:** `201 Created`</br> * **Body**: a [deposition](#restapi-rep-dep) resource.                                                            |
| Error response   | See [HTTP status codes](#restapi-http) (400 and 500 series errors) and [error responses](#restapi-errors).                                       |

```shell
curl -i -H "Content-Type: application/json" -X POST
     --data '{}' {{BASE_URL}}api/deposit/depositions/?access_token=ACCESS_TOKEN

# or

curl -i -H "Content-Type: application/json" -X POST
     --data '{"metadata": {"title": "My first upload", "upload_type": "poster", "description": "This is my first upload", "creators": [{"name": "Doe, John", "affiliation": "Zenodo"}]}}' {{BASE_URL}}api/deposit/depositions/?access_token=ACCESS_TOKEN{{ example_end() }}
```

```python
import json
import requests

url = "{{BASE_URL}}api/deposit/depositions/?access_token=ACCESS_TOKEN"
headers = {"Content-Type": "application/json"}
r = requests.post(url, data="{}", headers=headers)
```
