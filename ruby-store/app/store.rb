require_relative 'layout.rb'

class Store
  include Layout

  def call(env)
    ap env
    request = Rack::Request.new(env)
    status = 200
    case request.path
    when '/'
      html = Product.to_html
    when /^\/(\w+)$/
      pr = Product.find($1)
      if pr
        html = pr.to_html
      else
        html = "Sorry, No Such Product"
      end
    else
      status = 400
      html = "Sorry, No Such Page"
    end
    counter = env['session_counter'] ? env['session_counter'] : 1
    last_visit = env['last_visit']
    [status, {'Content-Type' => 'text/html'}, [Layout.layout { {"content" => html, "counter" => counter, "last_visit" => last_visit} }]]
  end

end
