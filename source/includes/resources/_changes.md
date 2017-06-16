## Changes

**2017-06-15**

- Added support for DOI versioning as part of deposit actions.

**2016-09-12**

- Added support for search, pagination, sorting and filtering.
- Improved speed significantly.

**2015-10-06**

- Added new optional field `contributors` to deposition metadata.
- Added new optional field `subjects` to deposition metadata.
- Added new optional subfield `gnd` to `creators` in deposition metadata.


**2014-12-20**

- Added new relationship `isAlternateIdentifier` in subfield `relation` to
  `related_identifiers` in deposition metadata.

**2014-12-10**

- Added new relationships `hasPart`, `isPartOf` & `isIdenticalTo` in subfield
  `relation` to `related_identifiers` in deposition metadata.

**2014-11-20**

- Added new optional subfield `orcid` to `creators` in deposition metadata.

**2014-10-21**

- Added new optional fields `conference_session` and `conference_session_part`
  to deposition metadata.

**2014-09-09**

- Added new optional field `references` to deposition metadata.

**2014-06-13**

- Authentication changed from API keys to OAuth 2.0. API key authentication is
  deprecated and will be phased out in October, 2014. Please use [personal
  access tokens](#creating-a-personal-access-token) instead of API keys.

**2013-12-18**

REST API version 1.0 final release:

* Deposition actions moved from `deposit/depositions/:id/action` to
  `deposit/depositions/:id/actions`
* Added `edit` and `discard` deposition action resources.
* Deposition resource representation:
  * `state`: Controlled vocabulary changed.
  * `submitted`: Data type changed from Timestamp to Bool.

**2013-11-13**

REST API initial release candidate.
