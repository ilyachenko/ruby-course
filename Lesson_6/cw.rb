# encoding: utf-8
system "clear"

=begin
  
eval
instance_evel
class_eval
  
=end

class K

end

K.instance_eval 'def say; "Hello from instance_evel"; end'

p K.say

K.class_eval 'def say_second; "Hello from class_eval"; end'

# p K.say_second

k = K.new
p k.say_second

# define_method
class Doctor
  define_method :name do |a,b,c|

  end
end


class Circle

  attr_accessor :radius
  attr_accessor :center

  # выше упрощённвя запись, можно было сделать так:
  # def radius=(val)
  #   @radius = val
  # end

  # def center=(val)
  #   @center = val
  # end

  # def radius=(str)
  #   p "rad"
  #   @radius = str
  # end

  def initialize &block
    p "init"

    block.call(self)
    # or
    # yield self
  end
end

# ###########
circle = Circle.new do |c|
  p 'block'
  c.radius = 12
  c.center = [5,6]
end

p circle


# Второй варик

class Circle
  def radius (v)
    @radius = v
  end
  def center(v)
    @center = v
  end
  def r
    @radius
  end
  def c
    @center
  end
  def initialize(&block)
    self.instance_eval(&block)
  end
end

circle = Circle.new do
  radius 12
  center [5,6]
end

p circle

# третий варик

class CircleDSL
  def initialize(circle)
    @circle = circle
  end
  def radius(r)
    @circle.radius = r
  end
  def center(r)
    @circle.center = r
  end
  def enlarge
    @circle.radius *= 2
  end
end

class Circle
  attr_accessor :radius
  attr_accessor :center
  def initialize(&block)
    CircleDSL.new(self).instance_eval(&block)
  end
end

circle = Circle.new do
  radius 12
  center [5,6]
end

p circle

=begin
ДЗ
дописать для классов  
дописать модуль svg
=end

def draw
  SVG::line do
    x1 @x1
    x2 @x2
  end
end
