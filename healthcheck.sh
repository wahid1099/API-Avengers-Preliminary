#!/bin/bash
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/health)
if [ "$STATUS" -eq 200 ]; then
    echo "App is healthy!"
    exit 0
else
    echo "App is not healthy!"
    exit 1
fi
