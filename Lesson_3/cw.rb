system "clear"
# Вызов блока по имени чтобы прокинуть дальше по методам
# для этого оборачиваем блок в proc и её дальше можем прокидывать
# a = proc{'vars'...}
# a.call(vars)
# можно использовать лямбды, но там есть проверка по количеству аргументов
# b=lambda{|vars|}
# b.call(vars)
# альтернативный синтаксиси у лямбды:
# c=->(vars){}



# Example 1 - ? чёт не работает

a = proc{|x| x+1}
a.call(1,2,3)
puts a

# Example 2

def hello
  puts yield
end

def hello2 (&block)
  puts block.call
end

hello{"12"};
hello2{"13"};


# переписать все методы из домашки через reduce[]
# пример:
# puts "Map:"
def reduce (array, value)
  value = value
  for arr in array
    value = yield(value, arr)
  end
  return value
end

def map arr, &block
  reduce([], arr) do |sum, el|
    sum << block.call(el)
  end
end

a = map([1,2,3]) do |el|
  el * el
end

# puts a.to_s

# Реализация select
# puts "Select:"
# def select array, &block
#   val = '';
#   reduce([], arr) do |sum, el|
#     sum << block.call(el)
#   end
#   # for arr in array
#   #   if yield(arr)
#   #     newArr << yield(arr)
#   #   end
#   # end
#   val
# end

# b = select ([-5, 2, -3, 10, 1, -4]) do |arr|
#   if arr > 0
#     arr * arr
#   else
#     false
#   end
# end

# puts "Counter:"
# def count array, &block

#   reduce([], array) do |ag, el|
#     puts block.call(el)
#     if block.call(el)
#       ag + 1
#     else
#       ag
#     end
#   end
# end

# b = count ([-5, 2, -3, 10, 1, -4]){|x| x>2}

# puts b

# next ...
# Итераторы:
# arr.reduce(v, &block)
# map, select, detect, ...
# самый основной интератор each
# [].each do |el|
#   ...
# end
# each_cons(2) do |el|

# p "each_cons:"
# [1,2,4,5, "a", "a"].each_cons(3) do |el|
#   p el
# end

# тоже самое только с индексом
# each_with_index do |el ,i|

# end

# 5.
# 5.times do |i|
# end

# 3.upto(10){|i|}

# Сортировка
# [].sort{|a,b| a<=>b}
# ["a", "b"],sort_by{|a| a.length}

# Chain
# [].each_with_index.map{|v|...}

# Example
# remove all "Eduard"
staff.select{|e| e['name'] == "Edward"}.
  map {|e| e['name']}.
each_with_index do |email, index|
  send_email "you looser #" + index, email
end

# DZ
- flatten:
  ["1", ["b",2], nil] сделать плоским
сделать через reduce и не через reduce

- сортировка массива -чтобы числа шли двумя группами чётные  в порядке убывания и нечетные в порядке убывания
- реверс сделать аналог
- локальные максимумы [1,2,3,1,4,5,1] => 3,5 локальные максимумы
-   {|variable|  a=>1}.merge{b=>2}
будет: {"a"=>1, b=>"2"}
