request = requestRack::Request.new(nev)
request.path

Rack::Response.new
r.body = html

case r.path
when /^\/(\w+)$/
  pr = Product.find($1)
  if pr
    [200, {}, []]


    #

    def initialize(next)
      @next = next
    end

    def call(env)
      @next.call(env)
    end

    # for css for example

    def call(env)
      if env[path].path

      else
        @next.call(env)
      end
    end

    # DZ middlware для статики, лайауты, навигация и товары со ссылками

    begin
      ...
      rescue
        ...
          end

      # block for layout вынести в модуль
      # include layout
      def layout
        content = "<doctype html>\n"
        content << "<link style bla bla bla type=css>"
        content << yield
        content << "<di>приходите ещё</div>"
      end

      layout do "Asdsadadasd sdvsdvsd" + p.name + "ascsacasc"
      end
