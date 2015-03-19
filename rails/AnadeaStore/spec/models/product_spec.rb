require 'rails_helper'

RSpec.describe Product, type: :model do
  it "no products" do
    expect(Product.all).to eq([])
  end

  it "add products" do
    pencil = Product.create!(name: "Ruler", price: 15)
    eraser = Product.create!(name: "Eraser", price: 10)

    expect(Product.all).to eq([pencil, eraser])
  end

  it "validation" do
    pencil = Product.new(name: "Ruler").save

    expect(Product.all).to eq([])
  end


end
