#!/bin/bash

# Check network by pinging a critical service (e.g., google.com)
ping -c 1 google.com > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Network check failed"
  exit 1
fi

# Check memory usage
memory_usage=$(ps -o %mem= -p 1) # Replace '1' with the PID of your application process
memory_threshold=80.0
memory_usage_int=${memory_usage%.*}

if [ $memory_usage_int -gt $memory_threshold ]; then
  echo "Memory usage is too high: ${memory_usage}%"
  exit 1
fi

echo "All checks passed"
exit 0


