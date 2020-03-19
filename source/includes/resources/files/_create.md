### Create

<div class="align-columns"></div>

```shell
curl --upload-file /path/to/your/file.dat https://zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b/file.dat?access_token=$ACCESS_TOKEN
```

```python
import json
import requests

filename = "my-file.zip"
path = "/path/to/%s" % filename
bucket_url = r.json()['links']['bucket']

with open(path, "rb") as fp:
     r = requests.put(
         "%s/%s" % (bucket_url, filename),
         data=fp,
         # No headers included in the request, since it's a raw byte request
         params=params,
     )
```

```json
{"mimetype": "application/pdf",
 "updated": "2020-02-27T16:51:25.538105+00:00",
 "links": {"self": "https://sandbox.zenodo.org/api/files/e68058df-573d-485a-842d-aeab42f3ffd4/dummy_example.pdf",
  "version": "https://sandbox.zenodo.org/api/files/e68058df-573d-485a-842d-aeab42f3ffd4/dummy_example.pdf?versionId=fd204a79-49ee-4407-857b-81c60ab31d72",
  "uploads": "https://sandbox.zenodo.org/api/files/e68058df-573d-485a-842d-aeab42f3ffd4/dummy_example.pdf?uploads"},
 "is_head": true,
 "created": "2020-02-27T16:51:25.526680+00:00",
 "checksum": "md5:2942bfabb3d05332b66eb128e0842cff",
 "version_id": "fd204a79-49ee-4407-857b-81c60ab31d72",
 "delete_marker": false,
 "key": "dummy_example.pdf",
 "size": 13264}
```

Upload a new file.

<div class="align-columns"></div>

#### HTTP Request

`PUT  /api/deposit/depositions/:id/files`

#### Request headers

`Content-Type: application/json`

#### Scopes

`deposit:write`

#### Success response

* **Code:** `201 Created`
* **Body**: a [file](#files) resource.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
