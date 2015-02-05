# encoding: utf-8
system "clear"

class Line
  def initialize(x1,y1,x2,y2,width = 1)
    @x1, @y1, @x2, @y2, @width = x1, y1, x2, y2, width
  end

  def draw
    "<line x1='#{@x1}' y1='#{@y1}' x2='#{@x2}' y2='#{@y2}' style='stroke:black;stroke-width:2'  />"
  end
end

class Circle
  def initialize(cx,cy,r,fill = "black")
    @cx,@cy,@r,@fill = cx,cy,r,fill
  end

  def draw
    "<circle cx='#{@cx}' cy='#{@cy}' r='#{@r}' fill='#{@fill}' />"
    # <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />
  end
end

class Rect
  def initialize(x,y,width,height)
    @x,@y,@width,@height = x,y,width,height
  end

  def draw
    "<rect x='#{@x}' y='#{@y}' width='#{@width}' height='#{@height}' style='fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)' />"
  end
end

class Arrow
  def initialize(x1,y1,x2,y2,width = 1)
    @x1,@y1,@x2,@y2,@width = x1,y1,x2,y2,width
  end

  def draw
    "<line x1='#{@x1}' y1='#{@y1}' x2='#{@x2}' y2='#{@y2}' style='stroke:red;stroke-width:#{@width}' marker-end='url(#myMarker)'/>"
  end
end

elements = [
  Line.new(50, 160, 50, 220),
  Rect.new(42, 120, 16, 40),
  Line.new(75, 235, 100, 235),
  Line.new(50, 275, 200, 275),
  Circle.new(50, 180, 3, 'black'),
  Line.new(50, 100, 50, 120),
  Arrow.new(200, 250, 175, 240),
  Line.new(75, 220, 75, 250, 3),
  Circle.new(100, 100, 3, 'black'),
  Line.new(100, 160, 100, 180),
  Line.new(200, 220, 175, 230),
  Line.new(110, 290, 140, 290),
  Line.new(178, 165, 178, 195),
  Line.new(200, 160, 200, 220),
  Line.new(100, 180, 150, 235),
  Line.new(150, 180, 100, 235),
  Line.new(200, 250, 200, 275),
  Line.new(200, 100, 200, 120),
  Circle.new(125, 275, 3, 'black'),
  Line.new(78, 165, 78, 195),
  Arrow.new(50, 100, 250, 100),
  Circle.new(100, 180, 3, 'black'),
  Line.new(100, 100, 100, 120),
  Rect.new(92, 120, 16, 40),
  Circle.new(200, 100, 3, 'black'),
  Circle.new(200, 180, 3, 'black'),
  Line.new(50, 180, 72, 180),
  Line.new(72, 165, 72, 195),
  Circle.new(70, 235, 25),
  Line.new(150, 100, 150, 120),
  Line.new(125, 275, 125, 290),
  Line.new(78, 180, 100, 180),
  Line.new(150, 180, 172, 180),
  Circle.new(180, 235, 25),
  Line.new(172, 165, 172, 195),
  Circle.new(150, 180, 3, 'black'),
  Arrow.new(178, 180, 250, 180),
  Line.new(150, 160, 150, 180),
  Line.new(175, 235, 150, 235),
  Rect.new(142, 120, 16, 40),
  Line.new(50, 250, 50, 275),
  Circle.new(150, 100, 3, 'black'),
  Rect.new(192, 120, 16, 40),
  Line.new(50, 220, 75, 230),
  Line.new(175, 220, 175, 250, 3),
  Arrow.new(50, 250, 75, 240)
]

body = ''
elements.each { |i| body += i.draw }

File.open("index.html", "w+") do |f|
  str = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>'
  str += "\n"
  str += '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="300" height="300">'
  str += '<defs><marker id="myMarker" viewBox="0 0 10 10" refX="1" refY="5" markerUnits="strokeWidth" orient="auto" markerWidth="20" markerHeight="10"><polyline points="0,0 10,5 0,10 1,5" fill="red" /></marker></defs>'
  str += body
  str += '</svg>'
  f.write(str)
end
