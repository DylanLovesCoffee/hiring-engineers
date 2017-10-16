# Dylan's Datadog Solutions

## Collecting Metrics
By adding a mix of one worded and key-value pair tags in the Agent config folder, I generated tags for the Datadog agent.

````
# Set the host's tags (optional)
tags: test, env:prod, role:database, stage:testing, role:admin, region:us-east, user:dylan
````
Below is a screenshot of the Host Map with the above tags in effect.
![tags](./images/dd_host_map_tags.png)

A screenshot of Datadog's MySQL integration below:

![mysql](./images/dd_mysql.png)

I created a custom Agent check by first creating a ````my_metric.py```` file in the ````/.datadog-agent/checks.d```` directory and a ````my_metric.yaml```` file in the ````/.datadog-agent/conf.d```` directory.

Within the ````my_metric.py```` file, I sent a metric to the DD agent with a random value between 0 and 1000:

````python
from checks import AgentCheck
from random import randint

class MyMetric(AgentCheck):
  def check(self, instance):
    self.gauge('my_metric', randint(0, 1000))
````

Under the ````my_metric.yaml```` file I set the collection interval to a minimum of 45 seconds:
````yaml
init_config:
  min_collection_interval: 45

instances:
  [{}]
````
