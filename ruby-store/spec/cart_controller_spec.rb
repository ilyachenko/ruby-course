require 'awesome_print'
require 'rack'
require_relative 'spec_helper'
require_relative '../app/controllers/cart_controller.rb'

describe CartController do

  let(:product1){Product.new("Name1", 121, "this item is AwEsoMe", "/img.jpg")}
  let(:product2){Product.new("Product-product", 202, "desc", "/image.jpg")}
  let(:cart_controller){described_class.new}

  it "show_products" do
    env = {}
    env['data'] = { 'counter' => 1, 'visit_time' => 123123 }
    env['action'] = :show_products

    body = cart_controller.call(env)[2][0]
    expect(body).to match( "Cart is empty" )

    product1.save
    env['rack.input'] = {}
    env['params'] = { 'name' => 'Name1' }
    env['action'] = :add_product
    cart_controller.call(env)

    env['action'] = :show_products
    body = cart_controller.call(env)[2][0]
    expect(body).to match( "Name1" )
  end

end
