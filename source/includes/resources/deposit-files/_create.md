### Create

Upload a new file.

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" https://zenodo.org/api/deposit/depositions/1234/files
     -F name=myfirstfile.csv
     -F file=@path/to/local_file.csv

```

```python
import json
import requests

url = 'https://zenodo.org/api/deposit/depositions/1234/files'
headers = {'Authorization': f'Bearer {ACCESS_TOKEN}'}
data = {'name': 'myfirstfile.csv'}
files = {'file': open('path/to/local_file.csv', 'rb')}
r = requests.post(url, data=data, files=files, headers=headers)
```

#### HTTP Request

`POST  /api/deposit/depositions/:id/files`

#### Request headers

`Content-Type: multipart/form-data`

#### Scopes

`deposit:write`

#### Success response

* **Code:** `201 Created`
* **Body**: a [deposition file](#deposition-file) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
