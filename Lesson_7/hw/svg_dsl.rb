# encoding: utf-8
system "clear"

class SVG
  def self.method_missing(name, *args, &block)
    a = Attr.new
    a.instance_eval &block
  end
end


class Line
  def initialize(x1,y1,x2,y2,width = 1)
    @x1, @y1, @x2, @y2, @width = x1, y1, x2, y2, width
  end

  def draw
    p @x1
    SVG.line do
      x1 @x1
      y1 @y1
    end
  end
end

class Attr
  attr_reader :attrs
  def method_missing(name, v)
    p name
    p v
    # @attrs[name] = v[0]
  end
end

line = Line.new(50, 160, 50, 220)

p line.draw # "<line x1='50' y1='160' x2='50' y2='220'/>"
