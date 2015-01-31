# encoding: utf-8
system "clear"

=begin
gem install rspec
rbenv rehash - for use rbenv drom CLI
rspec --init
in "spec" folder create a cpec-file.
=end

# Example 1

require_relative 'spec_helper'

describe ... do
  it ... do
  end
end

# Example 2

require_relative 'spec_helper'
require_relative '../add'
# OR
def add a,b
  a+b
end

describe 'add' do
  it "adds" do
    expect(add "1", 3).to eq(5)
  end
end

# https://projecteuler.net/problem=1


# group_by(1..5) to_a {[e] e%3}
# результат
# {0 => [3]
# 1=> [1,4]
# 2=> [2,5]}
