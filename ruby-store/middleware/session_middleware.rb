require "securerandom"

class Session

  @@session = {}

  def initialize(nnext)
    @nnext = nnext
  end

  def call(env)
    request = Rack::Request.new(env)
    token = request.cookies["AUTH_TOKEN"]
    if token && @@session[token]
      puts "token exist".red
      @@session[token]["counter"] = @@session[token]["counter"] + 1
      env['session_counter'] = @@session[token]["counter"]
      env['last_visit'] = @@session[token]["visit_time"]
      @@session[token]["visit_time"] = Time.now
      @nnext.call(env)
    else
      token = create_key
      @@session[token] = {"counter" => 1, "visit_time" => Time.now}
      status, headers, body = @nnext.call(env)
      [status, headers.merge({"Set-Cookie" => "AUTH_TOKEN="+token+"; Path=/;"}), body]
    end
  end

  private
  def create_key(len=10)
    SecureRandom.hex(len)
  end

end
