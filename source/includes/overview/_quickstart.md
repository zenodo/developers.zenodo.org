## Quickstart

This short guide will give a quick overview of how to upload and publish on Zenodo, and will be using Python together with the [Requests](http://www.python-requests.org/en/latest/user/install/) package.

> First, make sure you have the [Requests](http://www.python-requests.org/en/latest/user/install/) module installed

```terminal
$ pip install requests
```

> Next, fire up a Python command prompt:

```terminal
$ python
Python 2.7.5+
[GCC 4.8.1] on linux2
Type "help", "copyright", "credits" or "license" for more information.
```

> Import the `requests` and `json` modules:

```python
import requests
import json
```

> Try to access the API:

```python
r = requests.get("https://zenodo.org/api/deposit/depositions")
r.status_code
401
r.json()
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

<div class="align-columns"></div>


> All API access requires an access token, so [create](#restapi-auth) one.
> Let's try again (replace `ACCESS_TOKEN` with your newly created personal access token):

```python
>>> r = requests.get('https://zenodo.org/api/deposit/depositions',
...                  params={'access_token': ACCESS_TOKEN})
>>> r.status_code
200
r.json()
[]
```

<aside class="notice">Note, if you already uploaded something, the output will be different.</aside>

> Next, let's create a new empty upload:

```python
>>> headers = {"Content-Type": "application/json"}
>>> r = requests.post('https://zenodo.org/api/deposit/depositions',
...                   params={'access_token': ACCESS_TOKEN}, data="{}",
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

> Now, let's upload a new file:

```python
>>> # Get the deposition id from the previous response
>>> deposition_id = r.json()['id']
>>> # Maximum total record size is 50GB.
>>> data = {'filename': 'myfirstfile.csv'}
>>> files = {'file': open('/path/to/myfirstfile.csv', 'rb')}
>>> r = requests.post('https://zenodo.org/api/deposit/depositions/%s/files' % deposition_id,
...                  params={'access_token': ACCESS_TOKEN}, data=data,
...                  files=files)
>>> r.status_code
201

>>> r.json()

```

```json
{
  "checksum": "2b70e04bb31f2656ce967dc07103297f",
  "filename": "myfirstfile.csv",
  "id": "eb78d50b-ecd4-407a-9520-dfc7a9d1ab2c",
  "filesize": "27"
}
```

> Last thing missing, is just to add some metadata:

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
200
```

<div class="align-columns"></div>


> And we're ready to publish:


```python
r = requests.post('https://zenodo.org/api/deposit/depositions/%s/actions/publish' % deposition_id,
                  params={'access_token': ACCESS_TOKEN} )
r.status_code
202
```

<aside class="warning">Don't execute this last step - it will put your test upload straight online.</aside>
