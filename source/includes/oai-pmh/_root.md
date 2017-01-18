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


## Metadata formats

Metadata for each record is available in several formats. The available formats
include:


**`oai_datacite3`**

OAI DataCite — This metadata format has been specifically established for the
dissemination of DataCite records using OAI-PMH. In addition to the original
DataCite v3.0 metadata, this format contains several other elements describing
the version of the metadata, whether it is of reference quality, and the
registering datacentre. For more information about this format and its schema
please see the [DataCite OAI schema](http://oai.datacite.org/) web site.

<aside class="success">
    We recommend you harvest using this metadata format. The format
    contains the most complete metadata and is our primary supported format.
</aside>

[See example](view-source:https://zenodo.org/oai2d?verb=ListRecords
&metadataPrefix=oai_datacite3&set=openaire_data)


**`oai_datacite`**

OAI DataCite — This metadata format has been specifically established for the
dissemination of DataCite records using OAI-PMH. In addition to the original
DataCite metadata, this format contains several other elements describing the
version of the metadata, whether it is of reference quality, and the registering
datacentre. For more information about this format and its schema please see the
[DataCite OAI schema](http://oai.datacite.org/) web site.

[See example](view-source:https://zenodo.org/oai2d?verb=ListRecords&
metadataPrefix=oai_datacite&set=openaire_data)


**`datacite3`**

DataCite v3.0 — This metadata format contains only the original DataCite
metadata without additions or alterations. The schema for this format does
not exist and metadata will not validate against it. Please note that this
format is not OAI-PMH version 2.0 compliant.

[See example](view-source:https://zenodo.org/oai2d?verb=ListRecords&
metadataPrefix=datacite3&set=openaire_data)


**`datacite`**

DataCite v2.2 — This metadata format contains only the original DataCite
metadata without additions or alterations. The schema for this format does not
exist and metadata will not validate against it. Please note that this format is
not OAI-PMH version 2.0 compliant.

<aside class="notice">
    Heads up! We will be upgrading to <a
    href="http://schema.datacite.org/meta/kernel-3/index.html">DataCite Metadata
    Schema v3.0</a> and discontinue support for DataCite v2.2, hence please
    ensure your OAI-PMH client are capable of reading both versions. There are
    only few backwards incompatible changes between v3.0 and v2.2.
</aside>

[See example](view-source:https://zenodo.org/oai2d?verb=ListRecords&
metadataPrefix=datacite&set=openaire_data)


**`oai_dc`**

Dublin Core — only minimal metadata is included in this format, and is primarily
provided for clients which does not support `oai_datacite`.

[See example](view-source:https://zenodo.org/oai2d?verb=ListRecords&
metadataPrefix=oai_dc&set=openaire)


## Sets

We support both harvesting of the _entire repository_ as well as _selective
harvesting_ of communities.


**Entire repository**

In order to harvest the entire repository you make an OAI-PMH request without
passing any set specification.

[See example](view-source:https://zenodo.org/oai2d?verb=ListRecords&
metadataPrefix=oai_datacite)


**`user-<identifier>`**

Community sets — allows selective harvesting of specific communities. Replace
`<identifier>` with the community identifier. Alternatively each community
provides a direct harvesting API link on their front-page, which includes the
correct community identifier.

[See example](view-source:https://zenodo.org/oai2d?verb=ListRecords&
metadataPrefix=oai_datacite&set=user-cfa)

If you need selective harvesting and your use case is not supported by above
sets, please [contact us](http://about.zenodo.org/contact/) and we may possible
set a specific set for you.


## Update schedule

Sets are updated once an hour.


## Rate limit

The OAI-PMH API is rated limited to one request per 2 seconds. We would be
grateful if you [notify us](https://zenodo.org/support) that you are harvesting
us and in which context. It allows us to take your use case into consideration
for future developments.


## Changes

**2014-03-10**

- Added metadata formats `datacite3` and `oai_datacite3` to support DataCite
  v3.0.

**2013-05-08**

Initial release of OAI-PMH API.
