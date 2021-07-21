# Rate Limiting

For our content and services to be available to everyone we have to make sure that our resources are being distributed fairly. 
To achieve this, we have rate-limiting measures in place which limit the number of requests users can perform in a time window. Depending on the complexity and load of each request, different endpoints have different limits configured.

| Pages              | Limitations                                                                   |
|:------------------|:------------------------------------------------------------------------------|
| Global limit for guest users | 60 requests per minute, 2000 requests per hour |
| Global limit for [authenticated users](#authentication) | 100 requests per minute, 5000 requests per hour |
| OAI-PMH API harvesting | 120 requests per minute |
| Thumbnails for image records  | 20 requests per minute |
