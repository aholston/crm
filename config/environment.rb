# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings[:enable_starttls_auto] = false


# Initialize the Rails application.
Rails.application.initialize!
