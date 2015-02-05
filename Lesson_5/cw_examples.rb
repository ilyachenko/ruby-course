class A
  def meth1
    p self
    p "meth1"
  end

  def initialize
    p "init!"
  end

  def self.meth2
    p "meth2"
  end

  def method_missing(name)
    p "no method " + name.to_s
  end

  def self.method_missing(name)
    p "no self method " + name.to_s
  end

end

class B<A

end

a = A.new
a.meth1

A.meth2

a.meth3
A.meth3

B.new.meth1

# если не знаем заранее название метода, можно вызвать через send
# аналог call и apply в JS
a.send(:meth1)

# public, protected (только для себя и потомков), private (только для себя)
# public always by default

# class variables, instance variables, getter/setter

# instance variable - атрибут объекта
def a
  @x = 2
end

# class variables @@
class A
  @x = 3
  @@x = 4
end

# getters, setters
attr_reader :x
attr_writer :x
# or
attr_accessor :x

=begin
  
ДЗ
спроектировать несколько классов:
Line (коорд и пятый параметр по умолчанию - толщина), 
Arrow (толщина 1 всегда, остальные это 4 координаты), 
Rect (коорд, шир и высота), 
Circle (координаты центра, радиус, и необязательный параметр цвет заливки)
напр Circle.new(125, 275, 3, 'black')
y вниз смотрит, x вправо

Толщина это stroke-width="2"
Заливка fill="red"
Методы:
draw

save to svg file
File.open(name, "w+") do |f|
  f.write(str)
end
  
end
