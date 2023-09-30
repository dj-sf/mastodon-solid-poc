#!/bin/bash

# Remove Gemfile.lock
echo "Removing Gemfile.lock..."
rm -f Gemfile.lock

# Remove vendor/bundle directory
echo "Removing vendor/bundle directory..."
rm -rf vendor/bundle

# Run bundle install
echo "Running bundle install..."
bundle install

echo "Clean bundle install completed."
