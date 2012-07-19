# Load the rails application
require File.expand_path('../application', __FILE__)
Rails.logger = Logger.new("LOG")
# Initialize the rails application
Harvestgeek::Application.initialize!
