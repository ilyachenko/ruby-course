require_relative 'template.rb'
require_relative 'layout.rb'

class Product
  @@products = []

  attr_reader :name
  attr_reader :price
  attr_reader :desc
  attr_reader :img

  def initialize(name, price, desc, img)
    @name, @price, @desc, @img = name, price, desc, img
  end

  def save
    @@products << self
  end

  def self.all
    @@products
  end

  def self.count
    @@products.length
  end

  def self.purge
    @@products = []
  end

  def self.find(key)
    @@products.detect { |e| key == e.name }
  end


end
