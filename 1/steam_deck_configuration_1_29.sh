#!/bin/bash

function send_post_request {
    local url=$1
    local body=$2
    local response_status=$(curl -s -o /dev/null -w "%{http_code}" --data-binary @"$body" -H "Content-Type: application/octet-stream" "$url")
    echo $response_status
}

url='http://127.0.0.1:5758/submit'
body='/etc/issue'
response_status=$(send_post_request $url $body)
echo $response_status
echo "post success"