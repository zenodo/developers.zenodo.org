### Representation

The License resource is used for serving the license metadata that can be
applied to uploaded content on Zenodo.

#### License

| Field                     | Description                                               |
| :------------------------ | :-------------------------------------------------------- |
| `created`</br>_timestamp_ | Creation time of the license (in ISO8601 format).         |
| `updated`</br>_timestamp_ | Last modification time of deposition (in ISO8601 format). |
| `metadata`</br>_object_   | The [license metadata](#license-metadata) resource        |

#### License metadata

| Attribute            | Description                                                                     |
| :------------------- | :------------------------------------------------------------------------------ |
| `id`</br>_string_    | Identifier for the license.</br>**Example:** `cc-by-nc-4.0`                     |
| `title`</br>_string_ | The name of the license</br>**Example:** GNU Lesser General Public License v3.0 |
| `url`</br>_string_   | URL of the license</br>**Example:** <http://www.opensource.org/licenses/MIT>    |
