#!/bin/bash

# Read the PID from the web_process.pid file
pid=$(cat ./tmp/pids/web_process.pid)

# Construct the UNIX socket path using the PID
unix_socket_path="/tmp/ruby-debug-sock-1000/ruby-debug-vscode-${pid}"

# Use socat to forward the UNIX socket to a TCP port
socat TCP-LISTEN:12345,fork UNIX-CONNECT:${unix_socket_path} &
