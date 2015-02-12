# encoding: utf-8
system "clear"

class SVG
  def self.method_missing(name, *args, &block)
    attrs_collector = Attr.new
    block_context = eval 'self', block.binding
    block_context.instance_variables.each do |var_name|
      attrs_collector.instance_variable_set(var_name, block_context.instance_variable_get(var_name))
    end
    attrs = attrs_collector.instance_eval &block
    str = ''
    attrs.each do |key, v|
      str += " #{key}='#{v}'"
    end
    "<#{name}" + str + " />"
  end
end

class Line
  def initialize(x1,y1,x2,y2,stroke = "black")
    @x1, @y1, @x2, @y2, @stroke = x1, y1, x2, y2, stroke
  end

  def draw
    SVG.line do
      x1 @x1
      y1 @y1
      x2 @x2
      y2 @y2
      stroke @stroke
    end
  end
end

class Attr
  def initialize
    @attrs = {}
  end

  def method_missing(name, v)
    @attrs[name] = v
    @attrs
  end
end

# line = Line.new(50, 160, 50, 220)

# p line.draw # "<line x1='50' y1='160' x2='50' y2='220'/>"
