# Rate Limiting

For our content and services to be available to everyone we have to make sure that our resources are being distributed fairly.
To achieve this, we have rate-limiting measures in place which limit the number of requests users can perform in a time window. Depending on the complexity and load of each request, different endpoints have different limits configured.

| Pages              | Limitations                                                                   |
|:------------------|:------------------------------------------------------------------------------|
| Global limit for guest users | 60 requests per minute, 2000 requests per hour |
| Global limit for [authenticated users](#authentication) | 100 requests per minute, 5000 requests per hour |
| Search REST API endpoints | 30 requests per minute |
| OAI-PMH API harvesting | 30 requests per minute |
| Thumbnails for image records  | 20 requests per minute |

When you are making requests to any of our endpoints, you can inspect the following HTTP response headers for more information of your current rate-limit status:

| HTTP header | Description |
|:------------|:------------|
|`X-RateLimit-Limit`| Current rate-limit policy, i.e. maximum number of requests per minute |
|`X-RateLimit-Remaining`| Number of requests remaining in the current rate limit |
|`X-RateLimit-Reset`| Reset time of the current rate limit |

## User-Agent

When performing requests via APIs, please use a clear and identifiable `User-Agent`. We recommend a format such as:

`MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)`

which allows us to identify the source of traffic, apply appropriate measures, or contact you in case of need.

```python
import requests
headers = {'User-Agent': 'MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)'}
r = requests.get('https://zenodo.org/api/records', headers=headers)
```

```shell
curl -H "User-Agent: MyTooName/1.0 (+https://changeme.com; ChangeMe@changeme.com)" \
  https://zenodo.org/api/records
```

<aside class="notice">
  To prevent automated abuse, high-volume requests using generic User-Agents (such as the default <code>curl</code> or <code>python-requests</code>) may
  be rate-limited or blocked. We strongly encourage adding a custom User-Agent string to your scripts.
</aside>
