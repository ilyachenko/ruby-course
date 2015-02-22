#\ -w -p 1111 --host 0.0.0.0
use Rack::Reloader, 0
use Rack::ContentLength

system "clear"

require 'colorize'
require "awesome_print"

require File.expand_path("./static_middleware.rb", "middleware")
require File.expand_path("./session_middleware.rb", "middleware")
require File.expand_path("./product.rb", "app")
require File.expand_path("./store.rb", "app")

use Static
use Session

Product.new("Lobster", 521, "Clawed lobsters comprise a family (Nephropidae, sometimes also Homaridae) of large marine crustaceans. They have long bodies with muscular tails, and live in crevices or burrows on the sea floor. Three of their five pairs of legs have claws, including the first pair, which are usually much larger than the others. Highly prized as seafood, lobsters are economically important, and are often one of the most profitable commodities in coastal areas they populate.", "http://fakeimg.pl/350x200/?text=Lobster").save

Product.new("Pizza", 202, "Pizza is an oven-baked flat bread generally topped with tomato sauce and cheese. It is commonly supplemented with a selection of meats, vegetables and condiments.", "http://fakeimg.pl/350x200/?text=Pizza").save
Product.new("Ciabatta", 20, "Ciabatta is an Italian white bread made from wheat flour, water, salt, olive oil and yeast, created in 1982 by a baker in Adria, Veneto, Italy, in response to popularity of French baguettes. Ciabatta is somewhat elongated, broad and flat and is baked in many variations.", "http://fakeimg.pl/350x200/?text=Ciabatta").save

run Store.new