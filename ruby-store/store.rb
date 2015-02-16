class Store

  Product.new("Name1", 121).save
  Product.new("Name2", 202).save

  def call(env)
    q = env['PATH_INFO']
    name = q.split('/')[1];
    html = ''
    if(name)
      product = Product.find(name)
      if Product.find(name)
        html = product.to_html
      else
        html = "Product not found"
      end
    else
      Product.all do |i|
        html += "<div style='border: 1px solid red; width: 300px;'>" + i.to_html + "</div>"
      end
    end
    [200, {'Content-Type' => 'text/html'}, [html]]
  end
end
