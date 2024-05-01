#!/bin/bash

# API endpoint and credentials
url="https://<NMS_IP>/api/platform/v1/analytics/metrics"
auth="Authorization: Basic <base64 encoded username:password credentials>"
start_time="now-30d"

# List of metric names to query
declare -a metrics=("plus.http.request.bytes_rcvd"
                    "plus.http.request.bytes_sent"
                    "plus.http.request.count"
                    "plus.http.response.count"
                    "plus.http.status.1xx"
                    "plus.http.status.2xx"
                    "plus.http.status.3xx"
                    "plus.http.status.4xx"
                    "plus.http.status.5xx"
                    "nginx.http.method.get"
                    "nginx.http.method.head"
                    "nginx.http.method.options"
                    "nginx.http.method.others"
                    "nginx.http.method.post"
                    "nginx.http.method.put"
                    "nginx.http.method.delete"
                    "plus.http.status.discarded"
                    "plus.http.status.processing")

# Function to fetch and display metrics
fetch_metrics() {
    for metric in "${metrics[@]}"
    do
        echo "Fetching $metric for instance group 'piramal-ig':"
        curl -s -H "$auth" -k -G \
            --data-urlencode "names=SUM($metric)" \
            --data-urlencode "groupBy=instance_group" \
            --data-urlencode "filter=instance_group='piramal-ig'" \
            --data-urlencode "startTime=$start_time" \
            "$url" | jq --arg metric "$metric" '.metrics[] | select(.name == $metric) | {name: .name, aggr: "SUM", dimensions: .series[].dimensions, values: .series[].values}'
        echo ""  # Newline for better readability between results
    done
}

# Function to calculate success and failure percentages
calculate_percentages() {
    echo "Calculating success and failure percentages for instance group 'piramal-ig':"
    # Fetch total successful (2xx) and failed (4xx and 5xx) responses
    success=$(curl -s -H "$auth" -k -G \
        --data-urlencode "names=SUM(plus.http.status.2xx)" \
        --data-urlencode "groupBy=instance_group" \
        --data-urlencode "filter=instance_group='piramal-ig'" \
        --data-urlencode "startTime=$start_time" \
        "$url" | jq '[.metrics[].series[].values[]] | add')

    failures=$(curl -s -H "$auth" -k -G \
        --data-urlencode "names=SUM(plus.http.status.4xx),SUM(plus.http.status.5xx)" \
        --data-urlencode "groupBy=instance_group" \
        --data-urlencode "filter=instance_group='piramal-ig'" \
        --data-urlencode "startTime=$start_time" \
        "$url" | jq '[.metrics[].series[].values[]] | add')

    # Echo total counts for clarity
        echo "Total Successful (2xx) Requests: $success"
        echo "Total Failed (4xx and 5xx) Requests: $failures"

    # Calculate total requests
    total_requests=$(echo "$success + $failures" | bc)

    # Calculate percentages
    if [ "$total_requests" -gt 0 ]; then
        success_percent=$(echo "scale=2; ($success / $total_requests) * 100" | bc)
        failure_percent=$(echo "scale=2; ($failures / $total_requests) * 100" | bc)
        echo "Success Percentage: $success_percent%"
        echo "Failure Percentage: $failure_percent%"
    else
        echo "No requests found in the given timeframe."
    fi
}

# Call functions
fetch_metrics
calculate_percentages
