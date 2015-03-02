require_relative 'spec_helper'
require_relative '../app/order.rb'
require_relative '../app/product.rb'

describe Order do

  before do
    @product1 = Product.new("Name1", 121, "desc", "/img.jpg")
    @product2 = Product.new("Name2", 221, "desc", "/img.jpg")
    @products = {@product1 => 1, @product2 => 1}

  end

  describe "#new" do
    it "new order" do
      Order.new('Ilya', 'ilya@mail.com', @products)
      expect(Order.orders).to eq( { 0 => ['Ilya', 'ilya@mail.com', @products] } )

      Order.new('Ilya', 'ilya@mail.com', @products)
      expect(Order.orders).to eq( { 0 => ['Ilya', 'ilya@mail.com', @products], 1 => ['Ilya', 'ilya@mail.com', @products] } )
    end
  end

end
