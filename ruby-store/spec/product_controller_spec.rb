require 'awesome_print'
require 'rack'
require_relative 'spec_helper'
require_relative '../app/controllers/product_controller.rb'

describe ProductController do

  let(:product1){Product.new("Name1", 121, "this item is AwEsoMe", "/img.jpg")}
  let(:product2){Product.new("Product-product", 202, "desc", "/image.jpg")}
  let(:product_controller){described_class.new}

  it "show products" do
    product1.save
    product2.save

    env = {}
    env['data'] = { 'counter' => 1, 'visit_time' => 123123 }
    env['action'] = :show_products
    body = product_controller.call(env)[2][0]
    expect(body).to match( "Product-product" )
    expect(body).to match( "AwEsoMe" )
    expect(body).to match( "/image.jpg" )
  end

end
