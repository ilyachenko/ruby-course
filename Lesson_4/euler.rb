system "clear"

def euler a
  sum = 0
  1.upto(a-1) { |i|
    if i % 3 == 0 or i % 5 == 0
      sum += i
    end
  }
  sum
end

p euler 10


p (1...10).select{ |i| i%3==0 || i%5==0 }.reduce(:+)

# p [1,2,3].reduce(:*)
