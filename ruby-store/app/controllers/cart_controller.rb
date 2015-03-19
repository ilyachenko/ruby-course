require_relative './controller.rb'
require_relative '../product.rb'
require_relative '../cart.rb'

class CartController < Controller

  def cart
    # @env['data']['cart'] = Cart.new unless @env['data']['cart']
    # @env['data']['cart']
    @env['data']['cart'] ||= Cart.new
  end

  def show_products
    set_counter
    @products = cart.products
    render 'cart.html'
  end

  def add_product
    product = Product.find(params['name'])

    if product
      cart.add(product)
      @body = "ok"
    else
      @code = 404
      @body = "no such prod"
    end
  end

  def remove_prod
    product = Product.find(params['name'])
    cart.delete(product)
  end

  def order
    cart.delete_all
    @body = "ok"
  end

  def order_message
    set_counter
    @text = "Thank you for your order. <a href='/'>Back to main page.</a>"
    render 'plain_text.html'
  end

end
