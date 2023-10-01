#!/bin/bash

# Start Puma
bundle exec puma -C config/puma.rb

# Read and echo the PID
if [ -f "tmp/pids/puma.pid" ]; then
  PID=$(cat tmp/pids/puma.pid)
  echo "Puma is running with PID $PID"
fi
