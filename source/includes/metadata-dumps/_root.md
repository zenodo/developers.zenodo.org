# Metadata Dumps

For users who need to download large subsets of Zenodo records, making individual API calls for each record can be inefficient.
To address this, we provide bulk metadata dumps that contain exports of Zenodo record metadata in DataCite XML and JSON formats, as well as a CSV list of deleted records.

These dumps are generated **monthly** at the beginning of each month and are available via the `/api/exporter` endpoint.
We maintain the latest 3 snapshots of each dump variant, including creation timestamp, version ID, file size, checksum, and download links.

## List available dumps

List all available metadata dumps with their version history.

```python
import requests
resp = requests.get('https://zenodo.org/api/exporter')
```

```shell
curl https://zenodo.org/api/exporter
```

```json
{
  "records-xml.tar.gz": [
    {
      "version_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
      "created": "2025-09-13T06:25:32.054451+00:00",
      "is_head": true,
      "size": 3970234567,
      "checksum": "md5:1c1fd4ab805d52729cdee94d199f7729",
      "links": {
        "self": "https://zenodo.org/api/exporter/records-xml.tar.gz/a1b2c3d4-e5f6-7890-abcd-ef1234567890",
        "self_head": "https://zenodo.org/api/exporter/records-xml.tar.gz"
      }
    }
  ],
  "records-deleted.csv.gz": [
    {
      "version_id": "e2d16608-5d00-41ae-905e-11aa44643228",
      "created": "2025-09-01T23:24:03.867786+00:00",
      "is_head": true,
      "size": 26820485,
      "checksum": "md5:4605fbea12cab96f3a79d91a9f69f286",
      "links": {
        "self": "https://zenodo.org/api/exporter/records-deleted.csv.gz/e2d16608-5d00-41ae-905e-11aa44643228",
        "self_head": "https://zenodo.org/api/exporter/records-deleted.csv.gz"
      }
    }
  ]
}
```

#### HTTP Request

`GET /api/exporter`

#### Success Response

* **Code:** `200 OK`
* **Body**: JSON object where each key represents a dump variant, and the value is an array of the 3 most recent versions.

#### Response format

Each dump variant includes an array of versions with:

| Field | Description |
|:------|:------------|
| `version_id` | Unique identifier for this version |
| `created` | ISO 8601 timestamp of when the dump was created |
| `is_head` | Boolean indicating if this is the latest version |
| `size` | File size in bytes |
| `checksum` | File checksum for verification |
| `links.self` | URL to download this specific version |
| `links.self_head` | URL to download the latest version (only present for `is_head: true`) |

## Download a dump

Download the latest version of a specific metadata dump.

```python
import requests

# Download latest version
resp = requests.get('https://zenodo.org/api/exporter/records-xml.tar.gz')

# Download specific version
resp = requests.get('https://zenodo.org/api/exporter/records-xml.tar.gz/a1b2c3d4-e5f6-7890-abcd-ef1234567890')
```

```shell
# Download latest version
curl -O https://zenodo.org/api/exporter/records-xml.tar.gz

# Download specific version
curl -O https://zenodo.org/api/exporter/records-xml.tar.gz/a1b2c3d4-e5f6-7890-abcd-ef1234567890
```

#### HTTP Request

`GET /api/exporter/:key`

`GET /api/exporter/:key/:version_id`

#### URL Parameters

| Parameter | Required | Description |
|:----------|:---------|:------------|
| `key` | required | The dump variant key (e.g., `records-xml.tar.gz`) |
| `version_id` | optional | Specific version UUID. If omitted, returns the latest version. |

#### Success Response

* **Code:** `200 OK`
* **Body**: Binary file content (typically `.tar.gz` archive)

#### Archive structure

**Metadata dumps** (`.tar.gz` archives) contain one file per record:

- Filename format: `<record_id>.<extension>` (e.g., `8435696.xml`)
- Each file contains the complete metadata for that record in the specified format

**Deleted records dump** (`records-deleted.csv.gz`) is a gzip-compressed CSV file with the following columns:

| Column | Description |
|:-------|:------------|
| `record_id` | Zenodo record ID |
| `doi` | Record DOI |
| `parent_id` | Parent record ID (concept record) |
| `parent_doi` | Parent record DOI |
| `removal_note` | Reason for removal |
| `removal_reason` | Category (e.g., "spam") |
| `removal_date` | Date the record was removed |
| `citation_text` | Citation text (if available) |

## Streaming processing example

```python
import requests
import tarfile
import itertools
import xml.etree.ElementTree as ET

url = "https://zenodo.org/api/exporter/records-xml.tar.gz"
resp = requests.get(url, stream=True)
resp.raw.decode_content = True

namespaces = {
    'datacite': 'http://datacite.org/schema/kernel-4',
    'oai_datacite': 'http://schema.datacite.org/oai/oai-1.1/'
}

with tarfile.open(fileobj=resp.raw, mode="r|gz") as tar:
    for member in itertools.islice(tar, 10):
        if member.isfile():
            content = tar.extractfile(member).read()
            root = ET.fromstring(content)

            # Extract DOI and title from DataCite XML
            resource = root.find('.//datacite:resource', namespaces)
            doi = resource.find('datacite:identifier', namespaces).text
            title = resource.find('datacite:titles/datacite:title', namespaces).text

            print(f"{member.name}: {doi} - {title}")

# Outputs:
# 12345.xml: 10.5281/zenodo.12345 - Dataset for XYZ
# ...
```

```shell
# List files without extracting
curl -s https://zenodo.org/api/exporter/records-xml.tar.gz | tar -tzf - | head -10

# Outputs:
# 12345.xml
# 12346.xml
# ...
```

For large dumps, use streaming to avoid loading the entire file into memory.
This example shows how to download and process a metadata dump by streaming the `tar.gz` archive and extracting individual record files on-the-fly.
