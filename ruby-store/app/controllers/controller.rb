class Controller

  def initialize
    @code = 200
    @headers = {'Content-Type' => 'text/html'}
    @body = ""
    @layout = "layout.html"
  end

  def set_counter
    data = @env['data']
    @counter = data['counter'] ? data['counter'] : 1
    @last_visit = data['visit_time'] ? data['visit_time'] : ''
  end

  def params
    @request.params.merge(@env['params'] || {})
  end

  def render(view)
    @body = Template.new(self).render(view, @layout)
  end

  def redirect_to(uri)
    @code = 302
    @headers['Location'] = uri
  end

  def get_binding
    binding
  end

  def call(env)
    @env = env
    @request = Rack::Request.new(@env)
    send env['action']
    [@code, @headers, [@body]]
  end
end
