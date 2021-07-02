## Quickstart - Upload

This short guide will give a quick overview of how to upload and publish on
Zenodo, and will be using Python together with the
[Requests](http://www.python-requests.org/en/latest/user/install/) package or
alternatively .
We suggest to use our testing instance for the following example, to avoid
creating test records in our production one.

```python
$ pip install requests
```

- First, make sure you have the
[Requests](http://www.python-requests.org/en/latest/user/install/) module
installed unless you are going to be using the curl section of the docs:

<div class="align-columns"></div>

```python
$ python
Python 3.6.5
[GCC 4.8.1] on linux2
Type "help", "copyright", "credits" or "license" for more information.
```
- Next, if you are using the python section fire up a Python command prompt:

<div class="align-columns"></div>

```python
import requests
```

- and import the `requests` module:


<div class="align-columns"></div>

```python
>>> import requests
>>> r = requests.get("https://sandbox.zenodo.org/api/deposit/depositions")
>>> r.status_code
401
>>> r.json()
```

```shell
  curl https://sandbox.zenodo.org/api/deposit/depositions
```

```python
{
  "message": "The server could not verify that you are authorized to access
  the URL requested. You either supplied the wrong credentials (e.g. a bad
  password), or your browser doesn't understand how to supply the credentials
  required.",
  "status": 401
}
```

```shell
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

- Some API access, e.g. listing your deposits, requires an access token, you can
create one
[here](https://sandbox.zenodo.org/account/settings/applications/tokens/new/).

<div class="align-columns"></div>

```python
>>> ACCESS_TOKEN = 'ChangeMe'
>>> r = requests.get('https://sandbox.zenodo.org/api/deposit/depositions',
...                  params={'access_token': ACCESS_TOKEN})
>>> r.status_code
200
>>> r.json()
[]
```

```shell
  ACCESS_TOKEN=ChangeMe
  curl -X GET "https://sandbox.zenodo.org/api/deposit/depositions?access_token=$ACCESS_TOKEN"
```

```shell
 []
```

- Let's try again (replace `ACCESS_TOKEN` with your newly created personal
access token):

<aside class="notice">
  Note, if you already uploaded something, the output will be different.
</aside>

<div class="align-columns"></div>

```python
>>> headers = {"Content-Type": "application/json"}
>>> params = {'access_token': ACCESS_TOKEN}
>>> r = requests.post('https://sandbox.zenodo.org/api/deposit/depositions',
                   params=params,
                   json={},
                   # Headers are not necessary here since "requests" automatically
                   # adds "Content-Type: application/json", because we're using
                   # the "json=" keyword argument
                   # headers=headers,
                   headers=headers)
>>> r.status_code
201
>>> r.json()
```

```shell
curl -X POST  --header "Content-Type: application/json" "https://sandbox.zenodo.org/api/deposit/depositions?access_token=$ACCESS_TOKEN" --data {}
```

```json
{
    "conceptrecid": "542200",
    "created": "2020-05-19T11:58:41.606998+00:00",
    "files": [],
    "id": 542201,
    "links": {
        "bucket": "https://sandbox.zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b",
        "discard": "https://sandbox.zenodo.org/api/deposit/depositions/542201/actions/discard",
        "edit": "https://sandbox.zenodo.org/api/deposit/depositions/542201/actions/edit",
        "files": "https://sandbox.zenodo.org/api/deposit/depositions/542201/files",
        "html": "https://sandbox.zenodo.org/deposit/542201",
        "latest_draft": "https://sandbox.zenodo.org/api/deposit/depositions/542201",
        "latest_draft_html": "https://sandbox.zenodo.org/deposit/542201",
        "publish": "https://sandbox.zenodo.org/api/deposit/depositions/542201/actions/publish",
        "self": "https://sandbox.zenodo.org/api/deposit/depositions/542201"
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

- Now, let's upload a new file. We have recently released a new API, which is significantly more perfomant and supports much larger file sizes. While the older API supports 100MB per file, the new one has no size limitation.

<div class="align-columns"></div>

```python
bucket_url = r.json()["links"]["bucket"]
```

```shell
$ curl "https://sandbox.zenodo.org/api/deposit/depositions/542201?access_token=$ACCESS_TOKEN"
{ ...
  "links": {
    "bucket": "https://sandbox.zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b",
    ...,
  },
... }
```

- To use the **new files API** we will do a PUT request to the `bucket` link. The bucket is a folder-like object storing the files of our record. Our bucket URL will look like this: `https://sandbox.zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b` and can be found under the `links` key in our deposit metadata.

```shell
# This will stream the file located in '/path/to/your/file.dat' and store it in our bucket.
# The uploaded file will be named according to the last argument in the upload URL,
# 'file.dat' in our case.
$ curl --upload-file /path/to/your/file.dat "https://sandbox.zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b/file.dat?access_token=$ACCESS_TOKEN"
{ ... }
```

```python
# New API
filename = "my-file.zip"
path = "/path/to/%s" % filename

# The target URL is a combination of the bucket link with the desired filename
# seperated by a slash.
with open(path, "rb") as fp:
    r = requests.put(
        "%s/%s" % (bucket_url, filename),
        data=fp,
        params=params,
    )
r.json()
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
    "self": "https://sandbox.zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf",
    "version": "https://sandbox.zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf?versionId=38a724d3-40f1-4b27-b236-ed2e43200f85",
    "uploads": "https://sandbox.zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf?uploads"
  },
  "is_head": true,
  "delete_marker": false
}
```

<div class="align-columns"></div>

```python
# Old API
>>> # Get the deposition id from the previous response
>>> deposition_id = r.json()['id']
>>> data = {'name': 'myfirstfile.csv'}
>>> files = {'file': open('/path/to/myfirstfile.csv', 'rb')}
>>> r = requests.post('https://sandbox.zenodo.org/api/deposit/depositions/%s/files' % deposition_id,
...                   params={'access_token': ACCESS_TOKEN}, data=data,
...                   files=files)
>>> r.status_code
201
>>> r.json()
```

```shell
# Get the deposit id from the response of the request creating our deposit
curl -X POST "https://sandbox.zenodo.org/api/deposit/depositions/542201/files?access_token=$ACCESS_TOKEN" -F 'file=@myfirstfile.csv'
```

```json
{
  "checksum": "2b70e04bb31f2656ce967dc07103297f",
  "name": "myfirstfile.csv",
  "id": "eb78d50b-ecd4-407a-9520-dfc7a9d1ab2c",
  "filesize": "27"
}
```

- Alternatively you can still use the  **old files API**:

<div class="align-columns"></div>

```python
>>> data = {
...     'metadata': {
...         'title': 'My first upload',
...         'upload_type': 'poster',
...         'description': 'This is my first upload',
...         'creators': [{'name': 'Doe, John',
...                       'affiliation': 'Zenodo'}]
...     }
... }
>>> r = requests.put('https://sandbox.zenodo.org/api/deposit/depositions/%s' % deposition_id,
...                  params={'access_token': ACCESS_TOKEN}, data=json.dumps(data),
...                  headers=headers)
>>> r.status_code
200
```

```shell
# Get the deposit id from the response of the request creating our deposit
curl -X PUT --header "Content-Type: application/json"
 "https://sandbox.zenodo.org/api/deposit/depositions/542201?access_token=$ACCESS_TOKEN" --data '{
     "metadata": {
         "title": "My first upload",
         "upload_type": "poster",
         "description": "This is my first upload",
         "creators": [{"name": "Doe, John",
                       "affiliation": "Zenodo"}]
     }
 }'
 # You should receive in the response the updated metadata of the deposit
```

- Finally we can proceed to add metadata to our deposit:

<div class="align-columns"></div>


```python
>>> r = requests.post('https://sandbox.zenodo.org/api/deposit/depositions/%s/actions/publish' % deposition_id,
                      params={'access_token': ACCESS_TOKEN} )
>>> r.status_code
202
```

```shell
curl -X POST "https://sandbox.zenodo.org/api/deposit/depositions/542201/actions/publish?access_token=$ACCESS_TOKEN"

```

- And we're ready to publish:

<aside class="warning">
  Before executing this last step please make sure that you are using our 
  test infrastructure as instructed at the start of the example.
</aside>
