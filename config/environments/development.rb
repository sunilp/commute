Commute::Application.configure do
  
require 'pusher'

Pusher.app_id = '26615'
Pusher.key    = '00cfb85d263630a60071'
Pusher.secret = '74ff158093156a4399e2'

PUBNUB_PUBLISH_KEY = 'pub-c-2f362d40-f91b-4e07-96cb-c44636de6572'
PUBNUB_SUBSCRIBE_KEY = 'sub-c-2421483a-fa46-11e1-a7b4-7f11646c67a0'
PUBNUB_SECRET_KEY = 'sec-c-NjQxZWFmMDItMDA3MS00NjNjLTg3ZTUtYWU4MGYxNmUxMzgy'


  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
