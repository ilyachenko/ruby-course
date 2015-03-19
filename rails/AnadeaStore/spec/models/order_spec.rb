require 'rails_helper'

RSpec.describe Order, type: :model do
  it "no orders" do
    expect(Order.all).to eq([])
  end

  it "add order" do
    order = Order.create!(shipping: "Dnepr", email: "mail@mail.ru")

    expect(Order.all).to eq([order])
  end

  it "validation" do
    # order = Order.create!(shipping: "Dnepr", email: "mailmail.ru")

    # expect(Product.all).to raise_error
  end
end
