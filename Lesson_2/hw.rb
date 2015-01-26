# encoding: utf-8
system "clear"

puts "Посчитать сумму квадратов двух наибольших чисел из трех:"
def sumMaxSq array
  newArr = []
  newArr = array.sort.reverse
  return newArr[0] * newArr[0] + newArr[1] * newArr[1]
end

a = sumMaxSq ([4,2,3])

puts a

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, …
puts "Найти i-ое число Фибоначчи"
puts "Решение 1 - рекурсивное"

def fibo n
  if n == 0
    return 0
  end
  if ((n == -1) || (n == 1))
    return 1
  end
  if(n>0)
    return fibo(n-1) + fibo(n-2)
  else
    return fibo(n+2) + fibo(n+1)
  end
end

puts fibo 10

puts "Решение 2 - с применением диапазона"

def fibo n
  f = [0,1]
  for i in (2..n+1).to_a
    f << (f[i-1] + f[i-2])
  end
  return f[f.length - 2]
end

puts fibo 10

puts "Решение 3 - через loop"

def fibo n
  fib1 = 1
  fib2 = 1
  fib_sum = 0
  i = 2
  loop do
    fib_sum = fib2 + fib1
    fib1 = fib2
    fib2 = fib_sum
    i += 1
    break if i==n
  end
  return fib_sum
end

puts fibo 10

# написать map, select/detect, all?, any?, count, reduce.

# Реализация map
def map array
  newArr = [];
  for arr in array
    newArr << yield(arr)
  end
  newArr
end

a = map ([-5, 2, -3, 10, 1, -4]) do |arr|
  arr * arr
end

puts "Map: " + a.to_s

# Реализация select
def select array
  newArr = [];
  for arr in array
    if yield(arr)
      newArr << yield(arr)
    end
  end
  newArr
end

b = select ([-5, 2, -3, 10, 1, -4]) do |arr|
  if arr > 0
    arr * arr
  else
    false
  end
end

puts "Select: " + b.to_s

# Реализация detect
def detect array
  newArr = [];
  for arr in array
    if yield(arr)
      newArr << yield(arr)
    elsif yield(arr) == nil && newArr.length != 0
      break
    end
  end
  newArr
end

c = detect ([-5, 2, -3, 10, 1, -4]) do |arr|
  if arr > 0
    arr * arr
  else
    nil
  end
end

puts "Detect: " + c.to_s

# Реализация all
def all array
  for arr in array
    if !yield(arr)
      return false
      break
    end
  end
  true
end

d = all ([10, 1, -4]) do |arr|
  arr > 0
end
puts "All: " + d.to_s

d = all ([10, 1]) do |arr|
  arr > 0
end
puts "All: " + d.to_s

# Реализация any
def any array
  for arr in array
    if yield(arr)
      return true
      break
    end
  end
  false
end

e = any ([-5, 2, -3, 10, 1, -4]) do |arr|
  arr > 0
end

puts "Any: " + e.to_s

f = any ([5, 2, 3, 10, 1]) do |arr|
  arr < 0
end

puts "Any: " + f.to_s

# Реализация reduce
def reduce array
  value = false
  for arr in array
    if !value
      value = arr
    else
      value = yield(value, arr)
    end
  end
  return value
end

g = reduce (["abc", "def", 123, 456]) do |a, b|
  a.to_s + "::" + b.to_s
end

puts "Reduce: " + g.to_s

e = reduce ([0, 1, 2, 3]) do |a, b|
  a + b
end

puts "Reduce: " + e.to_s
