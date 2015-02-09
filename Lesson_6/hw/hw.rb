# encoding: utf-8
system "clear"

module SVG
  def method_missing(name, *args, &block)
    if name.to_s == "SVG"
      @str = "<#{args[0]}"
      block.call
      return @str += "/>"
    end

    if ["x1", "y1", "x2", "y2", "cx", "cy", "r", "fill"].include?(name.to_s)
      @str += generate_attr(name.to_s.to_s, args[0])
    end
  end

  def generate_attr (name, value)
    " " + name + "='" + value.to_s + "'"
  end

end


class Line
  include SVG
  def initialize(x1,y1,x2,y2,width = 1)
    @x1, @y1, @x2, @y2, @width = x1, y1, x2, y2, width
  end

  def draw
    SVG:line do
      x1 @x1
      y1 @y1
      x2 @x2
      y2 @y2
      x3 666
      y3 777
    end
  end
end

line = Line.new(50, 160, 50, 220)

p line.draw # "<line x1='50' y1='160' x2='50' y2='220'/>"

class Circle
  include SVG
  def initialize(cx,cy,r,fill = "black")
    @cx,@cy,@r,@fill = cx,cy,r,fill
  end

  def draw
    SVG:circle do
      cx @cx
      cy @cy
      r @r
      fill @fill
      boolshit "nothing"
    end
  end
end

circle = Circle.new(50, 180, 3)

p circle.draw # "<circle cx='50' cy='180' r='3' fill='black'/>"
