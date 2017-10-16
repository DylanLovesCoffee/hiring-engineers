require 'rubygems'
require 'dogapi'

api_key = ENV[API_KEY]
app_key = ENV[APP_KEY]

dog = Dogapi::Client.new(api_key, app_key)

title = 'MyMetric Timeboard'
description = "My timeboard created using Datadog's API"
graphs = [
  {
    'definition': {
      'requests': [
        {'q': 'avg:my_metric{*} by {host}'}
      ],
      'viz': 'timeseries'
    },
    'title': 'My_Metric Over Time'
  },
  {
    'definition': {
      'requests': [
        {'q': "anomalies(avg:mysql.net.connections{*}, 'basic', 2)"}
      ],
      'viz': 'timeseries'
    },
    'title': 'MySQL Anomalies'
  },
  {
    'definition': {
      'requests': [
        {'q': 'avg:my_metric{*}.rollup(sum, 1440)'},
      ],
      'viz': 'timeseries'
    },
    'title': 'My_Metric Past Hour Rollup'
  },
  {
    'definition': {
      'requests': [
        {'q': 'avg:my_metric{*} by {host}.rollup(sum, 1440)'},
        {'q': "anomalies(avg:mysql.net.connections{*}, 'basic', 2)"}
      ],
      'viz': 'timeseries'
    },
    'title': 'My_Metric Rollup and MySQL Connection Anomalies'
  },
]

template_variables = [{
    'name': 'host1',
    'prefix': 'host',
    'default': 'Dylans-Air'
}]

dog.create_dashboard(title, description, graphs, template_variables)
