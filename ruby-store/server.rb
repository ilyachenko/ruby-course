# For debug only

require_relative 'product.rb'
require_relative 'store.rb'

Product.new("Name1", 121).save
Product.new("Name2", 202).save

p Product.to_html
