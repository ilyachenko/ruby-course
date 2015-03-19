require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it "add product to order" do
    order = Order.create!(shipping: "Dnepr", email: "mail@mail.ru")
    pencil = Product.create!(name: "Ruler", price: 15)
    Order.first.products << pencil

    # ??
    expect(OrderProduct.first).to eq([])
  end

end
