## Quickstart - Upload

This short guide will give a quick overview of how to upload and publish on
Zenodo, and will be using Python together with the
[Requests](http://www.python-requests.org/en/latest/user/install/) package.

<div class="align-columns"></div>

```python
>>> import requests
>>> r = requests.get("https://zenodo.org/api/deposit/depositions")
>>> r.status_code
401
>>> r.json()
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

- Try to access the API:

<div class="align-columns"></div>

- All API access requires an access token, so
[create](https://zenodo.org/account/settings/applications/tokens/new/) one.

<div class="align-columns"></div>

```python
>>> ACCESS_TOKEN = 'ChangeMe'
>>> r = requests.get('https://zenodo.org/api/deposit/depositions',
...                  params={'access_token': ACCESS_TOKEN})
>>> r.status_code
200
>>> r.json()
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
>>> r = requests.post('https://zenodo.org/api/deposit/depositions',
...                   params=params,
...                   json={},
...                   # Headers are not necessary here since "requests" automatically
...                   # adds "Content-Type: application/json", because we're using
...                   # the "json=" keyword argument...
...                   # headers=headers, 
...                   headers=headers)
>>> r.status_code
201
>>> r.json()
```
```json
{
  "created": "2016-06-15T16:10:03.319363+00:00",
  "files": [],
  "id": 1234,
  "links": {
    "discard": "https://zenodo.org/api/deposit/depositions/1234/actions/discard",
    "edit": "https://zenodo.org/api/deposit/depositions/1234/actions/edit",
    "files": "https://zenodo.org/api/deposit/depositions/1234/files",
    "publish": "https://zenodo.org/api/deposit/depositions/1234/actions/publish",
    "newversion": "https://zenodo.org/api/deposit/depositions/1234/actions/newversion",
    "self": "https://zenodo.org/api/deposit/depositions/1234"
  },
  "metadata": {
    "prereserve_doi": {
      "doi": "10.5072/zenodo.1234",
      "recid": 1234
    }
  },
  "modified": "2016-06-15T16:10:03.319371+00:00",
  "owner": 1,
  "record_id": 1234,
  "state": "unsubmitted",
  "submitted": false,
  "title": ""
}
```

- Next, let's create a new empty upload:

<div class="align-columns"></div>

- Now, let's upload a new file.  
To do so a new API has been released, which is significantly more perfomant and which supports much larger file sizes. The old API supports 100MB per file, the new supports 50GB per file.

<div class="align-columns"></div>

```python
bucket_url = r.json()["links"]["bucket"]
```

```shell
curl https://zenodo.org/api/deposit/depositions/222761?access_token=$ACCESS_TOKEN
{ ...  
  "links": { "bucket": "https://zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b", ... },
... }
```

 - In the **new files API** we use a PUT request to a 'bucket' link, which is the container for files
bucket url looks like this: ``'https://zenodo.org/api/files/12341234-abcd-1234-abcd-0e62efee00c0'``

```shell
# This does a file stream PUT request to the "links.bucket" link
$ curl --upload-file /path/to/your/file.dat https://zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b/file.dat?access_token=$ACCES_TOKEN
{ ... }
```

```python
# NEW API
filename = "my-file.zip"
path = "/path/to/%s" % filename

# We pass the file object (fp) directly to request as 'data' for stream upload
# the target URL is the URL of the bucket and the desired filename on Zenodo seprated by slash
with open(path, "rb") as fp:
    r = requests.put(
        "%s/%s" % (bucket_url, filename),
        data=fp,
        # No headers included in the request, since it's a raw byte request
        params=params,
    )
r.json()
```
```json
{
  "mimetype": "application/pdf",
  "updated": "2020-02-26T14:20:53.811817+00:00",
  "links": {"self": "https://sandbox.zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf",
  "version": "https://sandbox.zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf?versionId=38a724d3-40f1-4b27-b236-ed2e43200f85",
  "uploads": "https://sandbox.zenodo.org/api/files/44cc40bc-50fd-4107-b347-00838c79f4c1/dummy_example.pdf?uploads"},
  "is_head": true,
  "created": "2020-02-26T14:20:53.805734+00:00",
  "checksum": "md5:2942bfabb3d05332b66eb128e0842cff",
  "version_id": "38a724d3-40f1-4b27-b236-ed2e43200f85",
  "delete_marker": false,
  "key": "dummy_example.pdf",
  "size": 13264
 }
 ```

<div class="align-columns"></div>


```python
# OLD API
>>> # Get the deposition id from the previous response
>>> deposition_id = r.json()['id']
>>> data = {'name': 'myfirstfile.csv'}
>>> files = {'file': open('/path/to/myfirstfile.csv', 'rb')}
>>> r = requests.post('https://zenodo.org/api/deposit/depositions/%s/files' % deposition_id,
...                   params={'access_token': ACCESS_TOKEN}, data=data,
...                   files=files)
>>> r.status_code
201
>>> r.json()
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
>>> data = {
...     'metadata': {
...         'title': 'My first upload',
...         'upload_type': 'poster',
...         'description': 'This is my first upload',
...         'creators': [{'name': 'Doe, John',
...                       'affiliation': 'Zenodo'}]
...     }
... }
>>> r = requests.put('https://zenodo.org/api/deposit/depositions/%s' % deposition_id,
...                  params={'access_token': ACCESS_TOKEN}, data=json.dumps(data),
...                  headers=headers)
>>> r.status_code
200
```

- Last thing missing, is just to add some metadata:

<div class="align-columns"></div>


```python
>>> r = requests.post('https://zenodo.org/api/deposit/depositions/%s/actions/publish' % deposition_id,
                      params={'access_token': ACCESS_TOKEN} )
>>> r.status_code
202
```

- And we're ready to publish:

<aside class="warning">
  Don't execute this last step - it will put your test upload straight online.
</aside>
