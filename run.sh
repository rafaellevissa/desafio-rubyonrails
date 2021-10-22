#!/bin/sh

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec puma -C config/puma.rb