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
    @@products.detect { |e| key == e.name }
  end

  def to_html(counter, last_visit)
    context = ERBContext.new({'product'=> self, 'counter' => counter, 'last_visit' => last_visit})
    Layout::render('layout.html', 'product.html', context)
  end

  def self.to_html(counter, last_visit)
    context = ERBContext.new({'products'=> Product.all, 'counter' => counter, 'last_visit' => last_visit})
    Layout::render('layout.html', 'products.html', context)
  end

end

Product.new("Lobster", 521, "Clawed lobsters comprise a family (Nephropidae, sometimes also Homaridae) of large marine crustaceans. They have long bodies with muscular tails, and live in crevices or burrows on the sea floor. Three of their five pairs of legs have claws, including the first pair, which are usually much larger than the others. Highly prized as seafood, lobsters are economically important, and are often one of the most profitable commodities in coastal areas they populate.", "http://fakeimg.pl/350x200/?text=Lobster").save
Product.new("Pizza", 202, "Pizza is an oven-baked flat bread generally topped with tomato sauce and cheese. It is commonly supplemented with a selection of meats, vegetables and condiments.", "http://fakeimg.pl/350x200/?text=Pizza").save
Product.new("Ciabatta", 20, "Ciabatta is an Italian white bread made from wheat flour, water, salt, olive oil and yeast, created in 1982 by a baker in Adria, Veneto, Italy, in response to popularity of French baguettes. Ciabatta is somewhat elongated, broad and flat and is baked in many variations.", "http://fakeimg.pl/350x200/?text=Ciabatta").save
