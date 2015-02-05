# OOP

# Class
class A
end

A.new

# Module
module B
end

# Usega of modules
module B
  class A
  end
end

B::A.new

# We can export modules
class A
  include B
end

# Наследование (только единичное!!!)
class C<A
end

# Methods
class A
  def meth1
  end
end

# Constructor
class A
  def meth1
  end

  def initialize()
  end
end

# self-method - метод класса, т.е. статический метод
def self.meth2
end

# аналогично можно записать так
def A.meth2
end

# вызов
A.meth2

# разница include and extend
# include не экспортирует self-методы
# extend присваивает методы в родительский класс из подключаемого класса

# Цепочка наследований
class A
  include B
  include C
end

module B
  def meth
  end
end
