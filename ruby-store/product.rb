class Product
  @@products = []

  attr_reader :name
  attr_reader :price

  def initialize(name, price)
    @name, @price = name, price
  end

  def save
    @@products << self
  end

  def self.all &block
    if block
      @@products.each { |e|
        block.call(e)
      }
    else
      @@products
    end

  end

  def self.count
    @@products.length
  end

  def self.purge
    @@products = []
  end

  def self.find(key)
    @@products.each { |e|
      if key == e.name
        return e
      end
    }
    return nil
  end

  def to_html
    if !self
      "<div>Not found</div>"
    else
      "<div><b>Name: </b> #{self.name}<br><b>Price:</b> #{self.price}</div>"
    end
  end

end

# Product.new("Name1", 121).save
# Product.new("Name2", 202).save

=begin
  
config.ru 
store.rb  

class Store
  def call(env)
    []
  end
end

сдеать метода html с выводом товаров
/name - если есть то показываем его
Product.find(name).to_html
если нету /name то показывать все продукты

=end
