#\ -w -p 8765 
use Rack::Reloader, 0
use Rack::ContentLength

require File.join(File.dirname(__FILE__), 'product.rb')
require File.join(File.dirname(__FILE__), 'store.rb')

Product.new("Name1", 121).save
Product.new("Name2", 202).save

run Store.new