require "securerandom"
require_relative '../app/cart.rb'

class Session

  @@session = {}

  def initialize(nnext)
    @nnext = nnext
  end

  def call(env)
    request = Rack::Request.new(env)
    token = request.cookies["AUTH_TOKEN"]
    if token && @@session[token]
      @@session[token]["counter"] = @@session[token]["counter"] + 1
      env['data'] = @@session[token]
      @@session[token]["visit_time"] = Time.now.strftime("%d/%m/%Y %H:%M:%S").to_s
      @nnext.call(env)
    else
      token = create_key
      time = Time.now.strftime("%d/%m/%Y %H:%M:%S").to_s
      @@session[token] = { "counter" => 1, "visit_time" =>  time }
      env['data'] = @@session[token]
      status, headers, body = @nnext.call(env)
      [status, headers.merge({"Set-Cookie" => "AUTH_TOKEN="+token+"; Path=/;"}), body]
    end
  end

  private
  def create_key(len=10)
    SecureRandom.hex(len)
  end

end
