require 'rack'
class Responder
  def call(env)
    [200, {}, ['Some response body']]
  end
end

Rack::Handler::WEBrick.run Responder.new
