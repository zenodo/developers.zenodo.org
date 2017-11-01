# OAI-PMH

Zenodo allows you to harvest our entire repository via the Open Archives
Initiative Protocol for Metadata Harvesting ([OAI-
PMH](http://www.openarchives.org/pmh/)). OAI-PMH is a widely used protocol for
harvesting metadata and most popular repository software provide support for
this protocol.

All metadata is licensed under [Creative Commons
Zero](http://about.zenodo.org/terms), while the data files may be either open
access and subject to a license described in the metadata or closed access and
not available for download.


## Base URL

`https://zenodo.org/oai2d`

## Resumption tokens

Resumption tokens are only valid for **2 minutes**. In case a token expired, you will receive a ``422 Unprocessable Entity`` HTTP error.

<aside class="notice">
  This means that you must execute the next HTTP request using the
  resumption token within those two minutes. We recommend that you offload any post processing of the harvested record to a background queue.
</aside>

## Rate limit

The OAI-PMH API is rated limited like the REST API - i.e. you will receive
a ``429 Too Many Requests`` HTTP error if you exceed the limit.

## Metadata formats

Metadata for each record is available in several formats. The available formats
include:

**`oai_datacite`**

OAI DataCite (latest schema version) — This metadata format has been
specifically established for the dissemination of DataCite records using
OAI-PMH. In addition to the original DataCite metadata, this format contains
several other elements describing the version of the metadata, whether it is of
reference quality, and the registering datacentre. For more information about
this format and its schema please see the
[DataCite OAI schema](http://oai.datacite.org/) website.

This metadata format will always deliver metadata according to the latest
available DataCite schema version.

[See example](https://zenodo.org/oai2d?verb=ListRecords&metadataPrefix=oai_datacite&set=openaire_data)

<aside class="notice">
  To get the raw XML output of the example above, view the page's source using
  the web browser's "view source" option.
</aside>

<aside class="success">
    We recommend you harvest using the ``oai_datacite`` metadata format. The
    format contains the most complete metadata and is our primary supported
    export format.
</aside>

**`oai_datacite3`**

OAI DataCite — This metadata format has been specifically established for the
dissemination of DataCite records using OAI-PMH. In addition to the original
DataCite v3.0 metadata, this format contains several other elements describing
the version of the metadata, whether it is of reference quality, and the
registering datacentre. For more information about this format and its schema
please see the [DataCite OAI schema](http://oai.datacite.org/) web site.

<aside class="notice">
    Heads up! We will be upgrading to <a
    href="http://schema.datacite.org/meta/kernel-4/index.html">DataCite
    Metadata Schema v4.0</a> and discontinue support for DataCite v3.0 by end
    February 2018, hence please ensure your OAI-PMH client are capable of
    reading both versions. There are only few backwards incompatible changes
    between v4.0 and v3.0.
</aside>

[See example](https://zenodo.org/oai2d?verb=ListRecords&metadataPrefix=oai_datacite3&set=openaire_data)

**`datacite`**

DataCite (latest version) — This metadata format contains only the original
DataCite metadata without additions or alterations according to the latest
DataCite schema. Please note that this format is not OAI-PMH  version 2.0
compliant.

[See example](https://zenodo.org/oai2d?verb=ListRecords&metadataPrefix=datacite&set=openaire_data)

**`datacite3`**

DataCite v3.0 — This metadata format contains only the original DataCite
metadata without additions or alterations. The schema for this format does
not exist and metadata will not validate against it. Please note that this
format is not OAI-PMH version 2.0 compliant.

<aside class="notice">
    Heads up! We will discontinue support for DataCite v3.0 by end
    February 2018.
</aside>

[See example](https://zenodo.org/oai2d?verb=ListRecords&metadataPrefix=datacite3&set=openaire_data)

**`oai_dc`**

Dublin Core — only minimal metadata is included in this format. The format is exported according to the [OpenAIRE Guidelines](http;//guidelines.openaire.eu).

[See example](https://zenodo.org/oai2d?verb=ListRecords&metadataPrefix=oai_dc&set=openaire)

**`marc21`**

MARC21 — export format primarily supported for legacy reasons. Please consider
using one of the other export formats as we may discontinue support for MARC21.

[See example](https://zenodo.org/oai2d?verb=ListRecords&metadataPrefix=marc21&set=openaire)


## Sets

We support both harvesting of the _entire repository_ as well as _selective
harvesting_ of communities.


**Entire repository**

In order to harvest the entire repository you make an OAI-PMH request without
passing any set specification.

[See example](https://zenodo.org/oai2d?verb=ListRecords&
metadataPrefix=oai_datacite)


**`user-<identifier>`**

Community sets — allows selective harvesting of specific communities. Replace
`<identifier>` with the community identifier. Alternatively each community
provides a direct harvesting API link on their front-page, which includes the
correct community identifier.

[See example](https://zenodo.org/oai2d?verb=ListRecords&
metadataPrefix=oai_datacite&set=user-cfa)

If you need selective harvesting and your use case is not supported by above
sets, please [contact us](http://about.zenodo.org/contact/) and we may possible
create a specific set for you.

## Update schedule

Most updates are available immediately, some few updates are only reflected in the OAI sets once an hour.

## Changes

**2016-09-12**

- Deprecated metadata formats `datacite3` and `oai_datacite3`. End of life is February 2018.
- Removed rate limit of 0.5 requests/second.
- Changed resumption token expiry to two minutes due to major update of our
  underlying repository software.

**2014-03-10**

- Added metadata formats `datacite3` and `oai_datacite3` to support DataCite
  v3.0.

**2013-05-08**

Initial release of OAI-PMH API.
