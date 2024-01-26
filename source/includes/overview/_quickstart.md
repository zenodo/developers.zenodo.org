## Quickstart - Upload

This short guide will give a quick overview of how to upload and publish on
Zenodo, and will be using either:

1. Python together with the [Requests](http://www.python-requests.org/en/latest/user/install/) package.
2. Javascript together with the [axios](https://github.com/axios/axios) package.

```terminal
# Install 'requests' module for python
pip install requests

# Install 'axios' module for nodejs 
npm install axios
```

- First, make sure you have the
[Requests](http://www.python-requests.org/en/latest/user/install/) module
installed for python or [axios](https://github.com/axios/axios) for nodeJS:

<div class="align-columns"></div>

```python
python
# Python 3.6.5
# [GCC 4.8.1] on linux2
# Type "help", "copyright", "credits" or "license" for more information.
```

``` javascript
node
// Welcome to Node.js v14.19.0.
// Type ".help" for more information.
```

- Next, fire up a command prompt:

<div class="align-columns"></div>

```python
import requests
```

```javascript
const axios = require('axios');
```

- Import the module to handle requests:

<div class="align-columns"></div>

```python
import requests
r = requests.get("https://zenodo.org/api/deposit/depositions")
r.status_code
# 401
r.json()
```

```javascript
const axios = require('axios');

axios.get("https://zenodo.org/api/deposit/depositions").then(response => {
  console.log(response);
}).catch(error => {
  console.log(error.response.data);
});
```

```json
{
  "message": "The server could not verify that you are authorized to access
  the URL requested. You either supplied the wrong credentials (e.g. a bad
  password), or your browser doesn't understand how to supply the credentials
  required.",
  "status": 401
}
```

- We will try to access the API without an authentication token:

<div class="align-columns"></div>

- All API access requires an access token, so
[create](https://zenodo.org/account/settings/applications/tokens/new/) one.

<div class="align-columns"></div>

```python
ACCESS_TOKEN = 'ChangeMe'
r = requests.get('https://zenodo.org/api/deposit/depositions',
                  params={'access_token': ACCESS_TOKEN})
r.status_code
# 200
r.json()
# []
```

```javascript
const ACCESS_TOKEN = 'ChangeMe'

const requestParams = {
  params: {
    'access_token': ACCESS_TOKEN
  }
}
axios.get("https://zenodo.org/api/deposit/depositions", requestParams).then(response => {
  console.log(response.status);
  // > 200
  console.log(response.data);  
  // > []
}).catch(error => {
  console.log(error.response.data);
});
```

- Let's try again (replace `ACCESS_TOKEN` with your newly created personal
access token):

<aside class="notice">
  Note, if you already uploaded something, the output will be different.
</aside>

<div class="align-columns"></div>

```python
headers = {"Content-Type": "application/json"}
params = {'access_token': ACCESS_TOKEN}
r = requests.post('https://sandbox.zenodo.org/api/deposit/depositions',
                   params=params,
                   json={},
                   '''
                   Headers are not necessary here since "requests" automatically
                   adds "Content-Type: application/json", because we're using
                   the "json=" keyword argument
                   headers=headers, 
                   '''
                   headers=headers)
r.status_code
# 201
r.json()
```

```javascript
const requestParams = {
  params: {
    'access_token': ACCESS_TOKEN
  },
  headers : {
    "Content-Type": "application/json"
  }
}

axios.post("https://zenodo.org/api/deposit/depositions", requestParams).then(response => {
  console.log(response.status);
  // 201
  console.log(response.data);  
}).catch(error => {
  console.log(error.response.data);
});

```

```json
{
    "conceptrecid": "542200",
    "created": "2020-05-19T11:58:41.606998+00:00",
    "files": [],
    "id": 542201,
    "links": {
        "bucket": "https://zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b",
        "discard": "https://zenodo.org/api/deposit/depositions/542201/actions/discard",
        "edit": "https://zenodo.org/api/deposit/depositions/542201/actions/edit",
        "files": "https://zenodo.org/api/deposit/depositions/542201/files",
        "html": "https://zenodo.org/deposit/542201",
        "latest_draft": "https://zenodo.org/api/deposit/depositions/542201",
        "latest_draft_html": "https://zenodo.org/deposit/542201",
        "publish": "https://zenodo.org/api/deposit/depositions/542201/actions/publish",
        "self": "https://zenodo.org/api/deposit/depositions/542201"
    },
    "metadata": {
        "prereserve_doi": {
            "doi": "10.5072/zenodo.542201",
            "recid": 542201
        }
    },
    "modified": "2020-05-19T11:58:41.607012+00:00",
    "owner": 12345,
    "record_id": 542201,
    "state": "unsubmitted",
    "submitted": false,
    "title": ""
}
```

- Next, let's create a new empty upload:

<div class="align-columns"></div>

- Now, let's upload a new file. We have recently released a new API, which is significantly more perfomant and supports much larger file sizes. While the older API supports 100MB per file, the new one has a limit of 50GB total in the record (and any given file), and up to 100 files in the record.

<div class="align-columns"></div>

```python
bucket_url = r.json()["links"]["bucket"]
```

```shell
curl https://zenodo.org/api/deposit/depositions/222761?access_token=$ACCESS_TOKEN
{ ...
  "links": {
    "bucket": "https://zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b",
    ...,
  },
... }
```

- To use the **new files API** we will do a PUT request to the `bucket` link. The bucket is a folder-like object storing the files of our record. Our bucket URL will look like this: `https://zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b` and can be found under the `links` key in our records metadata.

```shell
''' 
This will stream the file located in '/path/to/your/file.dat' and store it in our bucket.
The uploaded file will be named according to the last argument in the upload URL,
'file.dat' in our case. 
'''
$ curl --upload-file /path/to/your/file.dat https://zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b/file.dat?access_token=$ACCES_TOKEN
{ ... }
```

```python
''' New API '''
filename = "my-file.zip"
path = "/path/to/%s" % filename

''' 
The target URL is a combination of the bucket link with the desired filename
seperated by a slash.
'''
with open(path, "rb") as fp:
    r = requests.put(
        "%s/%s" % (bucket_url, filename),
        data=fp,
        params=params,
    )
r.json()
```

``` javascript
const fs = require('fs');
const axios = require('axios');

const filePath = '<FILE_PATH>'; // Replace with file path
const bucketURL = '<BUCKET_URL>'; // Replace with bucket url
const fileName = '<FILE_NAME>'; // Replace with file name
const token = 'TOKEN'; // Replace with token value

// Create a form
const form = new FormData();

// Read file as a stream
const stream = fs.createReadStream(filePath);
form.append('file', stream);

// Create request
let url = `${bucketURL}/${fileName}`;

let params = { 'access_token': token }

let headers = {
    'Content-type': 'application/zip'
}

const requestConfig = {
    data: {
      name: fileName,
      ...form
    },
    headers: headers,
    params: params
}

axios.put(url, requestConfig).then(response => {
  console.log(response.data);
}).catch(error => {
  console.log(error.response.data);
});
```

```json
{
  "key": "my-file.zip",
  "mimetype": "application/zip",
  "checksum": "md5:2942bfabb3d05332b66eb128e0842cff",
  "version_id": "38a724d3-40f1-4b27-b236-ed2e43200f85",
  "size": 13264,
  "created": "2020-02-26T14:20:53.805734+00:00",
  "updated": "2020-02-26T14:20:53.811817+00:00",
  "links": {
    "self": "https://zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf",
    "version": "https://zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf?versionId=38a724d3-40f1-4b27-b236-ed2e43200f85",
    "uploads": "https://zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf?uploads"
  },
  "is_head": true,
  "delete_marker": false
}
```

<div class="align-columns"></div>

```python
'''
Old API
Get the deposition id from the previous response
'''
deposition_id = r.json()['id']
data = {'name': 'myfirstfile.csv'}
files = {'file': open('/path/to/myfirstfile.csv', 'rb')}
r = requests.post('https://zenodo.org/api/deposit/depositions/%s/files' % deposition_id,
                   params={'access_token': ACCESS_TOKEN}, data=data,
                   files=files)
r.status_code
# 201
r.json()
```

```javascript
// Old API documentation not available for javascript / NodeJS
```

```json
{
  "checksum": "2b70e04bb31f2656ce967dc07103297f",
  "name": "myfirstfile.csv",
  "id": "eb78d50b-ecd4-407a-9520-dfc7a9d1ab2c",
  "filesize": "27"
}
```

- Here are the instructions for the **old files API**:

<div class="align-columns"></div>

```python
data = {
     'metadata': {
         'title': 'My first upload',
         'upload_type': 'poster',
         'description': 'This is my first upload',
         'creators': [{'name': 'Doe, John',
                       'affiliation': 'Zenodo'}]
     }
 }
r = requests.put('https://zenodo.org/api/deposit/depositions/%s' % deposition_id,
                  params={'access_token': ACCESS_TOKEN}, data=json.dumps(data),
                  headers=headers)
r.status_code
# 200
```

```javascript
// Old API documentation not available for javascript / NodeJS
```

- Last thing missing, is just to add some metadata:

<div class="align-columns"></div>

```python
r = requests.post('https://zenodo.org/api/deposit/depositions/%s/actions/publish' % deposition_id,
                      params={'access_token': ACCESS_TOKEN} )
r.status_code
# 202
```

```javascript
// Old API documentation not available for javascript / NodeJS
```

- And we're ready to publish:

<aside class="warning">
  Don't execute this last step - it will put your test upload straight online.
</aside>
