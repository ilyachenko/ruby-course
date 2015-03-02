class Cart

  attr_accessor :products

  def initialize
    @products = {}
  end

  def add(product)
    if @products[product]
      @products[product] = @products[product] + 1
    else
      @products[product] = 1
    end
  end

  def delete(product)
    @products.delete(product)
  end

  def total_price
  end

  def delete_all
    @products = {}
  end

  def products
    @products
  end

end
