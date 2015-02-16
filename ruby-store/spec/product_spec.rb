require_relative 'spec_helper'
require_relative '../product.rb'

describe Product do

  before do
    described_class.purge
  end

  let(:product1){described_class.new("Name1", 121)}
  let(:product2){described_class.new("Name2", 202)}
  # есть ещё subject
  it "counts product" do
    expect(described_class.count).to eq(0)
    product1.save
    expect(described_class.count).to eq(1)
    # OR
    # expect{Product.new("Name", 12)}.to change { Product.count }.by(1)
    # OR
    # expect{Product.new("Name", 12)}.to change { Product.count }.from(2).to(3)
  end

  it "all product" do
    expect(described_class.all).to eq([])
    product1.save
    expect(described_class.all).to eq([product1])
    product2.save
    expect(described_class.all).to eq([product1, product2])
  end

  it "save product" do
    expect{ product1.save }.to change { described_class.all }.from([]).to([product1])
    expect{ product2.save }.to change { described_class.all }.from([product1]).to([product1, product2])
  end

  it "find product" do
    expect( described_class.find( "Name1" ) ).to eq( nil )
    product1.save
    product2.save
    expect( described_class.find( "Name1" ) ).to eq( product1 )
    expect( described_class.find( "Name2" ) ).to eq( product2 )
  end

  it "html of product" do

  end

end
