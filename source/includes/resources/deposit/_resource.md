
### Deposition resource

The Deposition resource is used for uploading and editing records on Zenodo.
(`TODO: add richer description of the resource`)


| Field                      | Description                                                                                                                                                                                                                                                                             |
|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `created`</br>_timestamp_  | Creation time of deposition (in ISO8601 format).                                                                                                                                                                                                                                        |
| `doi`</br>_string_         | Digital Object Identifier (DOI). When you publish your deposition, we register a DOI in [DataCite](http://www.datacite.org) for your upload, unless you manually provided us with one. This field is only present for published depositions.                                            |
| `doi_url`</br>_url_        | Persistent link to your published deposition. This field is only present for published depositions.                                                                                                                                                                                     |
| `files`</br>_array_        | A list of [deposition files](#restapi-rep-files) resources.                                                                                                                                                                                                                             |
| `id`</br>_integer_         | Deposition identifier                                                                                                                                                                                                                                                                   |
| `metadata`</br>_object_    | A [deposition metadata](#restapi-rep-meta) resource                                                                                                                                                                                                                                     |
| `modified`</br>_timestamp_ | Last modification time of deposition (in ISO8601 format).                                                                                                                                                                                                                               |
| `owner`</br>_integer_      | User identifier of the owner of the deposition.                                                                                                                                                                                                                                         |
| `record_id`</br>_integer_  | Record identifier. This field is only present for published depositions.                                                                                                                                                                                                                |
| `record_url`</br>_url_     | URL to public version of record for this deposition. This field is only present for published depositions.                                                                                                                                                                              |
| `state`</br>_string_       | One of the values:<br/>* `"inprogress"`: Deposition metadata can be updated. If deposition is also unsubmitted (see `submitted`) files can be updated as well. <br/>* `"done"`: Deposition has been published. <br/>* `"error"`: Deposition is in an error state - contact our support. |
| `submitted`</br>_bool_     | True of deposition has been published, False otherwise.                                                                                                                                                                                                                                 |
| `title`</br>_string_       | Title of deposition (automatically set from `metadata`). Defaults to empty string.                                                                                                                                                                                                      |