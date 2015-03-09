require_relative './controller.rb'
require_relative '../product.rb'

class ProductController < Controller

  def show_products
    set_counter
    @products = Product.all
    render 'products.html'
  end

  def show_product
    set_counter
    name = params['name']
    @product = Product.find(name)
    if @product
      render 'product.html'
    else
      @code = 404
      @text = "No such product"
      render 'plain_text.html'
    end
  end

end
