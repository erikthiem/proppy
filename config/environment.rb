# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


# SENDGRID SETTINGS - so that mailers use sendgrid
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'prop-e.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}