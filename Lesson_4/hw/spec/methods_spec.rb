require_relative 'spec_helper'
require_relative '../hw'
# OR

describe 'map' do
  it "2*a" do
    expect(map([1, 2, 3, 4, 5]) {|el| 2*el}).to match_array([2, 4, 6, 8, 10])
  end
  it "2**a" do
    expect(map([1, 2, 3, 4, 5]) {|el| el**2}).to match_array([1, 4, 9, 16, 25])
  end
  it "sting concat" do
    expect(map(["a", "b", "c"]) {|el|
             el+"abc"
    }).to match_array(["aabc", "babc", "cabc"])
  end
end

describe 'select' do
  it "even" do
    expect(select([1, 2, 3, 4, 5]) { |el| el.even? }).to match_array([2, 4])
  end
  it "even by do" do
    expect(
      select([1, 2, 3, 4, 5]) do |el|
        el.even?
      end
    ).to match_array([2, 4])
  end
  it "characters and reg exdpression" do
    expect(select(%w{ a b c d e f }) { |v| v =~ /[aeiou]/ }).to match_array(["a", "e"])
  end
end

describe 'count' do
  it "simple" do
    expect(count([0,10,13])).to eq(3)
  end
  it "bigger than" do
    expect(
      count([-4,2,0,10,3,75,34]){|i| i>10}
    ).to eq(2)
  end
  # ??????????????
  it "raises" do
    expect { count("qwe") }.to raise_error
  end
end

describe 'flatten' do
  it "test 1" do
    expect(
      flatten([ 1, 2, 3 ])
    ).to match_array([ 1, 2, 3 ])
  end
  it "test 2" do
    expect(
      flatten(["1", ["b",2, 3, [true, false]], nil])
    ).to match_array(["1", "b", 2, 3, true, false, nil])
  end
end

describe 'merge' do
  it "simple merge" do
    expect(
      merge({ "a" => 100, "b" => 200 }, { "c" => 254, "d" => 300 })
    ).to eq( { "a" => 100, "b" => 200, "c" => 254, "d" => 300 } )
  end
  it "same keys" do
    expect(
      merge({ "a" => 100, "b" => 200 }, { "b" => 254, "d" => 300 })
    ).to eq( { "a" => 100, "b" => 254, "d" => 300 } )
  end
end
