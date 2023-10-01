#!/bin/bash

bundle exec puma -C config/puma.rb &
web_pid=$!



# Use socat to forward the UNIX socket to a TCP port
socat TCP-LISTEN:12345,fork UNIX-CONNECT:${unix_socket_path}
