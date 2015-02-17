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

  def self.all
    @@products
  end

  def self.count
    @@products.length
  end

  def self.purge
    @@products = []
  end

  def self.find(key)
    @@products.detect { |e|
      if key == e.name
        return e
      end
    }
  end

  def self.to_html
    @@products.reduce('') do |html, value|
      html + value.to_html
    end
  end

  def to_html
    if self == nil
      "<div>Not found</div>"
    else
      "<div><b>Name: </b> #{self.name}<br><b>Price:</b> #{self.price}</div>"
    end
  end

end
