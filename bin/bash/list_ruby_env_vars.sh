#!/bin/bash

echo "=== Checking Ruby Environment Variables ==="

# Check PATH
echo "PATH:"
echo $PATH | tr ":" "\n" | grep -E 'rbenv|rvm|rubies'
echo "------------------------------------------"

# Check RBENV_ROOT
echo "RBENV_ROOT:"
echo $RBENV_ROOT
echo "------------------------------------------"

# Check RBENV_VERSION
echo "RBENV_VERSION:"
echo $RBENV_VERSION
echo "------------------------------------------"

# Check RUBYOPT
echo "RUBYOPT:"
echo $RUBYOPT
echo "------------------------------------------"

# Check GEM_HOME
echo "GEM_HOME:"
echo $GEM_HOME
echo "------------------------------------------"

# Check GEM_PATH
echo "GEM_PATH:"
echo $GEM_PATH
echo "------------------------------------------"

# Check RUBYLIB
echo "RUBYLIB:"
echo $RUBYLIB
echo "------------------------------------------"

# Check RUBYLIB_PREFIX
echo "RUBYLIB_PREFIX:"
echo $RUBYLIB_PREFIX
echo "------------------------------------------"

# Check BUNDLE_PATH
echo "BUNDLE_PATH:"
echo $BUNDLE_PATH
echo "------------------------------------------"

echo "=== Done ==="
