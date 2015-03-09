class Template

  def initialize(context)
    @context = context
  end

  def render(template, layout = nil)
    dir = File.dirname(__FILE__) + "/layouts/"
    view = ERB.new(File.read(dir + template)).result(@context.get_binding)

    if layout
      ERB.new(File.read(dir + layout)).result(@context.get_binding { view })
    else
      view
    end
  end

end
