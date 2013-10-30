# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# Usefull for swager ui to request APIs.
# @see https://github.com/intridea/grape#cors
require 'rack/cors'
use Rack::Cors do
  allow do
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :delete, :options]
  end
end

run Rails.application
