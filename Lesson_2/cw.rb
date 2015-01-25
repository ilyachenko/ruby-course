def method1 
	puts "Run method1"
	a = yield "param of yield"
	puts a
end

puts "---1---"
method1 do 
	puts "Run method without params"
end

puts "---2---"
method1 do |p|
	puts "Run method with param p. P is " + p
	p = "It's a " + p + ", bro!"
end

# Example
# Map
# map([1,2,3]) do |e|
# 	e = e * e
# end
puts

puts "myMap functon:"
def myMap array
	newArr = [];
	for arr in array
    newArr << yield(arr)
	end
	newArr
end

a = myMap ([1,2,3]) do |arr|
	 arr * arr
end

puts a