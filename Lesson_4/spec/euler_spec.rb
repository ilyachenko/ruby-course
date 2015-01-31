require_relative 'spec_helper'
require_relative '../euler'
# OR

describe 'euler' do
  it "multiple" do
    expect(euler 3).to eq(23)
  end

  it "multiple" do
    expect(euler 12).to eq(33)
  end

end
