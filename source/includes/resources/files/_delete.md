### Delete

<div class="align-columns"></div>

```shell
curl -i -X DELETE https://zenodo.org/api/files/21fedcba-9876-5432-1fed-cba987654321/filename?access_token=ACCESS_TOKEN
```

```python
r = requests.delete(
    "%s/%s" % (bucket_url, filename),
    params=params,
)
```

Delete an existing deposition file resource.  
Note, only deposition files for unpublished depositions may be deleted.

<div class="align-columns"></div>

#### HTTP Request

`DELETE /api/files/:bucket_id/:filename`

#### Scopes

`deposit:write`

#### Success response

* **Code:** `204 No Content`
* **Body**: Empty.

#### Error response

* `404 Not found`: Deposition file does not exist.
* `403 Forbidden`: Deleting an already published deposition.

See also [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).
