# encoding: utf-8
system "clear"

=begin
  
=end

require 'rack'

# class Responder
#   def call(env)
#     p :qweqwe
#     p env['QUERY_STRING'].to_s
#     p "----"
#     p env['QUERY_STRING'].split('=').to_s
#   end
# end

require 'rack'
class Responder
  def call(env)
    p env['QUERY_STRING'].to_s
    p "----"
    p env['QUERY_STRING'].split('=').to_s
    [200, {}, ['Some response body']]
  end
end

Rack::Handler::WEBrick.run Responder.new

# DZ
# class myApp
#   def call(env)
#     [200, {}, [Picture.draw]]
#   end
# end
