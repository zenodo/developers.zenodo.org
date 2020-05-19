### List

List all files for a given deposition.

<div class="align-columns"></div>

```shell
curl -k https://sandbox.zenodo.org/api/deposit/depositions/503451?access_token=$ACCESS_TOKEN
{ ...  
  "links": { "bucket": "https://zenodo.org/api/files/568377dd-daf8-4235-85e1-a56011ad454b", ... },
... }
```

```python
r = requests.get(
    "%s/api/deposit/depositions/503451" % url,
    params={"access_token": ACCESS_TOKEN},
    json={},
    headers=headers,
)
bucket = r.json()['links']['bucket'].split('/')[-1]
```

- In order to list files, we need to retrieve the `bucket_id` of the deposition.

<div class="align-columns"></div>

```shell
curl -k https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745?access_token=$ACCESS_TOKEN
```

```python
r = requests.get(
    "%s/api/files/%s" % (url, bucket),
    params={"access_token": ACCESS_TOKEN},
    json={},
    headers=headers,
)
```

```json
{"max_file_size": 50000000000,
 "updated": "2020-02-27T13:49:38.691360+00:00",
 "locked": true,
 "links": {"self": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745",
  "uploads": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745?uploads",
  "versions": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745?versions"},
 "created": "2020-02-27T13:48:53.238371+00:00",
 "quota_size": 50000000000,
 "id": "9a6431d2-7a70-4426-8937-7fc513c61745",
 "contents": [{"mimetype": "application/pdf",
   "updated": "2020-02-27T13:48:53.661733+00:00",
   "links": {"self": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745/dummy_example.pdf",
    "version": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745/dummy_example.pdf?versionId=07b79ac5-e916-4a57-b867-32fd0be92d6d",
    "uploads": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745/dummy_example.pdf?uploads"},
   "is_head": true,
   "created": "2020-02-27T13:48:53.653459+00:00",
   "checksum": "md5:2942bfabb3d05332b66eb128e0842cff",
   "version_id": "07b79ac5-e916-4a57-b867-32fd0be92d6d",
   "delete_marker": false,
   "key": "dummy_example.pdf",
   "size": 13264},
  {"mimetype": "text/xml",
   "updated": "2020-02-27T13:48:53.818217+00:00",
   "links": {"self": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745/dummy.xml",
    "version": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745/dummy.xml?versionId=2211e7f0-621c-4196-90ab-6bd3b1b3f09a",
    "uploads": "https://sandbox.zenodo.org/api/files/9a6431d2-7a70-4426-8937-7fc513c61745/dummy.xml?uploads"},
   "is_head": true,
   "created": "2020-02-27T13:48:53.810332+00:00",
   "checksum": "md5:096f5764575997fd339c16240e87f505",
   "version_id": "2211e7f0-621c-4196-90ab-6bd3b1b3f09a",
   "delete_marker": false,
   "key": "dummy.xml",
   "size": 693}],
 "size": 13957}
```

- This allow to retrieve files contained in the bucket.

<div class="align-columns"></div>

#### HTTP Request

`GET /api/files/:bucket_id`

#### Success response

* **Code:** `200 OK`
* **Body**: an object of [files](#files) resources.

#### Error response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).