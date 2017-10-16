# Dylan's Datadog Solutions

## Collecting Metrics
By adding a mix of one worded and key-value pair tags in the Agent config folder, I generated tags for the Datadog agent.

````
# Set the host's tags (optional)
tags: test, env:prod, role:database, stage:testing, role:admin, region:us-east, user:dylan
````
Below is a screenshot of the Host Map with the above tags in effect.
![tags](./images/dd_host_map_tags.png)
