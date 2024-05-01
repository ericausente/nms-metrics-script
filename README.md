# nms-metrics-script

##Sample output: 

```
# bash fetch_metrics.sh
Fetching plus.http.request.bytes_rcvd for instance group 'piramal-ig':
{
  "name": "plus.http.request.bytes_rcvd",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    10401672
  ]
}

Fetching plus.http.request.bytes_sent for instance group 'piramal-ig':
{
  "name": "plus.http.request.bytes_sent",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    28339634
  ]
}

Fetching plus.http.request.count for instance group 'piramal-ig':
{
  "name": "plus.http.request.count",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    82741
  ]
}

Fetching plus.http.response.count for instance group 'piramal-ig':
{
  "name": "plus.http.response.count",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    82718
  ]
}

Fetching plus.http.status.1xx for instance group 'piramal-ig':
{
  "name": "plus.http.status.1xx",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    0
  ]
}

Fetching plus.http.status.2xx for instance group 'piramal-ig':
{
  "name": "plus.http.status.2xx",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    28470
  ]
}

Fetching plus.http.status.3xx for instance group 'piramal-ig':
{
  "name": "plus.http.status.3xx",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    28325
  ]
}

Fetching plus.http.status.4xx for instance group 'piramal-ig':
{
  "name": "plus.http.status.4xx",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    25868
  ]
}

Fetching plus.http.status.5xx for instance group 'piramal-ig':
{
  "name": "plus.http.status.5xx",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    55
  ]
}

Fetching nginx.http.method.get for instance group 'piramal-ig':
{
  "name": "nginx.http.method.get",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    1796293
  ]
}

Fetching nginx.http.method.head for instance group 'piramal-ig':
{
  "name": "nginx.http.method.head",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    274
  ]
}

Fetching nginx.http.method.options for instance group 'piramal-ig':
{
  "name": "nginx.http.method.options",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    109
  ]
}

Fetching nginx.http.method.others for instance group 'piramal-ig':
{
  "name": "nginx.http.method.others",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    1698
  ]
}

Fetching nginx.http.method.post for instance group 'piramal-ig':
{
  "name": "nginx.http.method.post",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    5310
  ]
}

Fetching nginx.http.method.put for instance group 'piramal-ig':
{
  "name": "nginx.http.method.put",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    32
  ]
}

Fetching nginx.http.method.delete for instance group 'piramal-ig':
{
  "name": "nginx.http.method.delete",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    15
  ]
}

Fetching plus.http.status.discarded for instance group 'piramal-ig':
{
  "name": "plus.http.status.discarded",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    23
  ]
}

Fetching plus.http.status.processing for instance group 'piramal-ig':
{
  "name": "plus.http.status.processing",
  "aggr": "SUM",
  "dimensions": {
    "instance_group": "piramal-ig"
  },
  "values": [
    0.28560606
  ]
}

Calculating success and failure percentages for instance group 'piramal-ig':
Total Successful (2xx) Requests: 28470
Total Failed (4xx and 5xx) Requests: 25923
Success Percentage: 52.00%
Failure Percentage: 47.00%
```
