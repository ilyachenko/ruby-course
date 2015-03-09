require_relative 'product.rb'
require_relative 'controllers/product_controller.rb'
require_relative 'controllers/cart_controller.rb'

class Store

  def call(env)
    request = Rack::Request.new(env)

    status = 200

    counter = env['session_counter'] ? env['session_counter'] : 1
    last_visit = env['last_visit']

    case request.path
    when '/'
      env['controller'] = ProductController
      env['action'] = :show_products
    when '/cart'
      if request.post?
        rack_input = env["rack.input"].read
        rack_input = rack_input.gsub("&","%26")
        params = Rack::Utils.parse_query(rack_input, "&")
        if params['add_prod']
          env['params'] = { 'name' => params['add_prod'] }
          env['action'] = :add_product
        else params['remove_prod']
          env['params'] = { 'name' => params['remove_prod'] }
          env['action'] = :remove_prod
        end
      else
        env['action'] = :show_products
      end
      env['controller'] = CartController
    when '/order'
      if request.post?
        rack_input = env["rack.input"].read
        params = Rack::Utils.parse_query(rack_input, "&")
        env['controller'] = CartController
        env['params'] = { 'name' => params['name'], 'mail' => params['mail'] }
        env['action'] = :order
      else
        env['controller'] = CartController
        env['action'] = :order_message
      end
    when /^\/(\w+)$/
      env['params'] = { 'name' => $1 }
      env['controller'] = ProductController
      env['action'] = :show_product
    end
    env['controller'].new.call(env)
  end
end
