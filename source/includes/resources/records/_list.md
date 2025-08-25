### List

List all open access records.

```python
import requests
response = requests.get('https://zenodo.org/api/records',
                        params={'q': 'my title'},
                        headers={'Authorization': f'Bearer {ACCESS_TOKEN}'})
print(response.json())
```

```shell
curl -i -H "Authorization: Bearer ACCESS_TOKEN" /api/records/
```

#### HTTP Request

`GET /api/records/`

#### Query arguments

| Parameter                   | Required | Description                                                                                                                    |
|:----------------------------|:---------|:-------------------------------------------------------------------------------------------------------------------------------|
| `q`</br>_string_            | optional | Search query (using [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html) query string syntax - note that some characters have special meaning here, including ``/``, which is also present in full DOIs). |
| `status`</br>_string_       | optional | Filter result based on the deposit status (either ``draft`` or ``published``)                                                  |
| `sort`</br>_string_         | optional | Sort order (``bestmatch`` or ``mostrecent``). Prefix with minus to change form ascending to descending (e.g. ``-mostrecent``). |
| `page`</br>_integer_        | optional | Page number for pagination.                                                                                                    |
| `size`</br>_integer_        | optional | Number of results to return per page.                                                                                          |
| `all_versions`</br>_integer/string_ | optional | Show (`true` or `1`) or hide (`false` or `0`) all versions of records. |
| `communities`</br> _string_ | optional | Return records that are part of the specified communities. (Use of `community identifier`)                                     |
| `type`</br> _string_        | optional | Return records of the specified type. (`Publication`, `Poster`, `Presentation`...)                                             |
| `subtype`</br> _string_     | optional | Return records of the specified subtype. (`Journal article`, `Preprint`, `Proposal`...)                                        |
| `bounds`</br> _string_      | optional | Return records filtered by a geolocation bounding box. (Format `bounds=143.37158,-38.99357,146.90918,-37.35269`)               |
| `custom`</br> _string_      | optional | Return records containing the specified custom keywords. (Format `custom=[field_name]:field_value`)                            |

#### Header

The response format of the search can be requested by specifying it in the header.

| Accept                                    | Description       |
|:------------------------------------------|:------------------|
| `application/json`                        | JSON              |
| `application/vnd.zenodo.v1+json`          | Zenodo            |
| `application/marcxml+xml`                 | Marc XML          |
| `application/x-bibtex`                    | Bibtex            |
| `application/x-datacite+xml`              | Datacite XML      |
| `application/x-dc+xml`                    | Dublin Core       |


#### Success Response

* **Code:** `200 OK`
* **Body**: an array of [record](#records) resources.

#### Error Response

See [HTTP status codes](#http-status-codes) (400 and 500 series errors) and
[error responses](#errors).

#### Search guide

Advanced search queries can as well be performed on Zenodo website through the search box. This is documented in the [search guide](https://help.zenodo.org/guides/search/)
