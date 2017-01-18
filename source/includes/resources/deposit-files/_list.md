### List

`GET deposit/depositions`

|                    |                                                                                                            |
|:-------------------|:-----------------------------------------------------------------------------------------------------------|
| **Description**      | List all depositions for the currently authenticated user                                                  |
| **URL**              | {{BASE_URL}}api/deposit/depositions                                                                        |
| **Method**           | GET                                                                                                        |
| **Success response** | * **Code:** `200 OK`</br> * **Body**: an array of [deposition](#restapi-rep-dep) resources.                |
| **Error response**   | See [HTTP status codes](#restapi-http) (400 and 500 series errors) and [error responses](#restapi-errors). |


```shell
curl -i {{BASE_URL}}api/deposit/depositions/?access_token=ACCESS_TOKEN
```

```python
import requests
response = requests.get("{{BASE_URL}}api/deposit/depositions/?access_token=ACCESS_TOKEN")
print response.json()
```
