require 'rack'
require_relative 'product.rb'
require_relative 'store.rb'

# Store.new.call

Rack::Handler::WEBrick.run Store.new
