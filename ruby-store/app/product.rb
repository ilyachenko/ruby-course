class Product
  @@products = []

  attr_reader :name
  attr_reader :price
  attr_reader :desc
  attr_reader :img

  def initialize(name, price, desc, img)
    @name, @price, @desc, @img = name, price, desc, img
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
    "<div class='item'>
      <div class='box'>
        <div><a href='#{self.name}'>#{self.name}</a></div>
        <div class='price'>#{self.price}$</div>
        <div><i>#{self.desc}</i></div>
      </div>
      
      <div><a href='#{self.name}'><img src='#{self.img}'></a></div>
    </div>"
  end

end
