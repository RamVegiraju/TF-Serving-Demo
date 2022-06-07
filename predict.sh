#!/bin/bash
payload=$1
content=$2

echo ${payload}
echo ${content}

set -B
for i in {1..10}; do
  curl --data-binary @${payload} -H "Content-Type: ${content}" -v http://localhost:8501/v1/models/boston:predict
done