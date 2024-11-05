#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Clean old assets
rm -rf public/assets

# Build assets
bundle exec rake assets:precompile
bundle exec rake assets:clean

# Run database migrations
bundle exec rake db:migrate
