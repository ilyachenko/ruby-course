class Store
  def call(env)
    status = 200
    q = env['PATH_INFO']
    name = q.split('/')[1];
    html = ''
    if(name)
      product = Product.find(name)
      if product
        html = product.to_html
      else
        html = "Product not found"
        status = 401
      end
    else
      html = Product.to_html
    end
    [status, {'Content-Type' => 'text/html'}, [html]]
  end
end
