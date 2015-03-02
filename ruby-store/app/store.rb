require_relative 'product.rb'
require_relative 'cart.rb'
require_relative 'order.rb'

# IS IT OK?
require_relative 'ERBContext.rb'
require_relative 'layout.rb'

# ? counter in each calls

class Store

  @@cart = {}

  def call(env)
    request = Rack::Request.new(env)

    status = 200

    counter = env['session_counter'] ? env['session_counter'] : 1
    last_visit = env['last_visit']
    token = request.cookies["AUTH_TOKEN"]

    if !@@cart[token]
      @@cart[token] = Cart.new
    end

    cart = @@cart[token]

    case request.path
    when '/'
      [status, {'Content-Type' => 'text/html'}, [ Product.to_html(counter, last_visit) ]]
    when '/cart'
      if env['REQUEST_METHOD'] == "POST"
        rack_input = env["rack.input"].read
        rack_input = rack_input.gsub("&","%26")
        params = Rack::Utils.parse_query(rack_input, "&")

        if params['add_prod']
          product = Product.find(params['add_prod'])
          cart.add(product)
          [200, {'Content-Type' => 'text/html'}, ["ok"]]
        elsif params['remove_prod']
          product = Product.find(params['remove_prod'])
          cart.delete(product)
          [200, {'Content-Type' => 'text/html'}, ["ok"]]
        else
          [400, {'Content-Type' => 'text/html'}, ["error"]]
          cart.add(product)
          [200, {'Content-Type' => 'text/html'}, ["ok"]]
        end
      else
        context = ERBContext.new({'products'=> cart.products, 'last_visit' => last_visit, 'counter' => counter})
        render = Layout::render('layout.html', 'cart.html', context)
        [ 200, {'Content-Type' => 'text/html'}, [ render ]]
      end
    when '/order'
      if env['REQUEST_METHOD'] == "POST"
        rack_input = env["rack.input"].read
        params = Rack::Utils.parse_query(rack_input, "&")
        Order.new(params['name'], params['mail'], cart.products)
        puts "order".red
        ap Order.orders
        cart.delete_all()
        [200, {'Content-Type' => 'text/html'}, ["ok"]]
      else
        context = ERBContext.new({'text'=> "Thank you for your order. <a href='/'>Back to main page.</a>"})
        render = Layout::render('layout.html', 'plain_text.html', context)
        [ 200, {'Content-Type' => 'text/html'}, [ render ]]
      end
    when /^\/(\w+)$/
      pr = Product.find($1)
      if pr
        [status, {'Content-Type' => 'text/html'}, [ pr.to_html(counter, last_visit) ]]
      else
        context = ERBContext.new({'text'=> "No such product"})
        render = Layout::render('layout.html', 'plain_text.html', context)
        [ 404, {'Content-Type' => 'text/html'}, [ render ]]
      end
    else
      status = 404
      context = ERBContext.new({'text'=> "No such page"})
      render = Layout::render('layout.html', 'plain_text.html', context)
      [ status, {'Content-Type' => 'text/html'}, [ render ]]
    end
  end

end
