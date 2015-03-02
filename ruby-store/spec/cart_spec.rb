require_relative 'spec_helper'
require_relative '../app/cart.rb'
require_relative '../app/product.rb'

describe Cart do

  before do
    @cart = Cart.new
    @product1 = Product.new("Name1", 121, "desc", "/img.jpg")
    @product2 = Product.new("Name2", 221, "desc", "/img.jpg")
  end

  before :each do
    @cart.delete_all
  end

  describe "#new" do
    it "return a Cart object" do
      expect(@cart).to be_an_instance_of(Cart)
    end
  end

  describe "#products and #add" do
    it "show empty cart" do
      expect(@cart.products).to eq({})
    end

    it "add products to cart" do
      @cart.add(@product1)
      expect(@cart.products).to eq( {@product1 => 1} )

      @cart.add(@product2)
      expect(@cart.products).to eq( {@product1 => 1, @product2 => 1})

      @cart.add(@product1)
      expect(@cart.products).to eq( {@product1 => 2, @product2 => 1} )

      @cart.delete(@product1)
      expect(@cart.products).to eq( {@product2 => 1} )
    end

  end
end
