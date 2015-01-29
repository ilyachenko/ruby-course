# encoding: utf-8
system "clear"

def reduce (array, value)
  value = value
  for arr in array
    value = yield(value, arr)
  end
  value
end

# p "Map by reduce:"

def map arr, &block
  reduce(arr, []) do |sum, el|
    sum << block.call(el)
  end
end

a = map([1,2,3]) do |el|
  el * el
end

# puts "Map by reduce: " + a.to_s

# p "Select by reduce:"

def select array, &block
  reduce(array, []) do |sum, el|
    value = block.call(el)
    if value
      sum << value
    else
      sum
    end
  end
end

b = select ([-5, 2, -3, 10, 1, -4]) do |arr|
  if arr > 0
    arr * arr
  end
end

# puts "Select by reduce: " + b.to_s

# Реализация detect
def detect array, &block
  reduce(array, []) do |sum, el|
    value = block.call(el)
    if value
      sum << el
      return sum
      break
    else
      sum
    end
  end
end

c = detect ([-5, 2, -3, 10, 1, -4]) do |arr|
  arr > 0
end

# puts "Detect: " + c.to_s

# Count
# ary = [1, 2, 4, 2]
# ary.count             #=> 4
# ary.count(2)          #=> 2
# ary.count{|x|x%2==0}  #=> 3

def count array, &block
  _sum = ''
  reduce(array, []) do |sum, el|
    value = block.call(el)
    if value
      sum << el
    end
    _sum = sum
  end
  _sum.length
end

c = count ([1,2,4,3,0,-1,3,9]) do |arr|
  arr > 2
end

# puts "Count: " + c.to_s

# Реализация all
def all? array, &block
  reduce(array, []) do |sum, el|
    value = block.call(el)
    if value
      sum << el
    else
      return  false
      break
    end
    return true
  end
end

d = all? ([10, -1, 4]) do |arr|
  arr > 0
end
# puts "All: " + d.to_s

d = all? ([10, 1]) do |arr|
  arr > 0
end
# puts "All: " + d.to_s

# flatten ["1", ["b",2], nil] => ["1", "b", 2, nil]
# без reduce
def flatten array
  newArr = []
  for arr in array
    if arr.is_a?(Array)
      recAr = flatten(arr)
      newArr = newArr + recAr
    else
      newArr << arr
    end
  end
  newArr
end

# p flatten (["1", ["b",2, 3, [true, false]], nil])

# Локальные максимумы

def localMax array
  newArr = []
  count = 0
  for arr in array
    if count != 0 && count<array.length-1 && arr>array[count-1] && arr>array[count+1]
      newArr << array[count]
    end
    count += 1
  end
  newArr
end

# p localMax ([1,2,3,1,4,5,1])

# Сортировка массива -чтобы числа шли двумя группами чётные  в порядке убывания и нечетные в порядке убывания
def sortAnEven array
  arrEven = []
  arrNotEven = []
  for arr in array
    arr.to_i.even? ? arrEven << arr : arrNotEven << arr
  end
  arrEven.sort{|a,b| a<=>b} + arrNotEven.sort{|a,b| a<=>b}
end

# p sortAnEven ([4,1,6,3,5,3,1,2,8])

def reverse array
  newArr = []
  count = array.length - 1
  for arr in array
    newArr << array[count]
    count -= 1
  end
  newArr
end

# p reverse ([4,1,6,3,5,3,1,2,8])

# merge

def merge hash1, hash2
  acc = {}
  hash1.each do |key, value|
    acc.store(:key, value)
  end
end

# p merge({ "a" => 100, "b" => 200 }, { "b" => 254, "c" => 300 })
