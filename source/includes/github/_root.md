# GitHub

## Add metadata to your GitHub repository release

We automatically extract metadata about your release from GitHub APIs. For example, the authors are determined from the repository's contributor statistics. To overwrite some of the default metadata that would come from a regular GitHub release you can include a `.zenodo.json` file at the root of your GitHub repository.

The contents of the `.zenodo.json` file are based on our [deposit metadata documentation](https://developers.zenodo.org/#deposit-metadata) and can be structurally validated by our [deposit JSON Schema](https://zenodo.org/schemas/deposits/records/legacyrecord.json). 

In the example shown, we add metadata regarding:

- software authorship and ORCiDs, via the `creators` field
- Apache-2.0 licensing, via the `license` field
- a custom title, via the `title` field
- a related identifier to the software paper, via the `related_identifiers` field
- keywords, via the `keywords` field
- Zenodo communities, via the `communities` field
- funding information, via the `grants` field


```python
{
    "creators": [
        {   
            "orcid": "0000-0002-1825-0097",
            "affiliation": "Feline reasearch institute",
            "name": "Field, Gar"
        },
        {   
            "orcid": "0000-0002-1825-0097",
            "affiliation": "Feline reasearch institute",
            "name": "Cat, Felix"
        }
    ],    

    "license": "Apache-2.0",
    
    "title": "Red-Dot: ML-powered laser vector detection",
    
    "related_identifiers": [
        {
            "scheme": "doi",
            "identifier": "10.1234/software.paper.5678",
            "relation": "isDocumentedBy",
            "resource_type": {
                "type": "publication",
                "subtype": "article"
            }
        }
    ],
    
    "keywords": ["Cats", "Laser", "Behavior"],

    "communities": [
        {"identifier": "software-cats"}
    ],
    
    "grants": [{"id":"777541"}]
}
```

## How to verify your `.zenodo.json`?

After creating your `.zenodo.json` file you should validate it to make sure that it contains valid JSON. You can use a tool like the [JSON Formatter & Validator](https://jsonformatter.curiousconcept.com), or load it via your favorite programming language.
