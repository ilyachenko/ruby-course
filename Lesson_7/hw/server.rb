require 'rack'
require 'cgi'
require_relative 'svg_dsl.rb'

class Responder
  def call(env)
    params = CGI::parse(env['QUERY_STRING'])
    res = ''
    if params.has_key?("x1") && params.has_key?("x2") && params.has_key?("y1") && params.has_key?("y2")
      line = Line.new(params["x1"][0], params["y1"][0], params["x2"][0], params["y2"][0], "red")
      res = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>'
      res += "\n"
      res += '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="300" height="300">'
      res += line.draw
      res += '</svg>'
    end
    # http://localhost:8080/?x1=100&y1=10&x2=10&y2=200
    [200, {'Content-Type' => 'image/svg+xml'}, [res]]
  end
end

Rack::Handler::WEBrick.run Responder.new
