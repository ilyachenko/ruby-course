class Order

  @@orders = {}

  def initialize(name, mail, products)
    @@orders[@@orders.length] = [name, mail, products]
  end

  def self.orders
    @@orders
  end

end
