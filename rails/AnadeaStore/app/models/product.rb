# ./app/models/product.rb

class Product < ActiveRecord::Base

  has_many :order_products
  has_many :orders, :through => :order_products

  # validates :name, :price, :desc, :img :price, presence: true
  validates :name, :price, presence: true

end
