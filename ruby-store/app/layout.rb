module Layout
  def self.render(layout, template, context)
    dir = File.dirname(__FILE__) + "/layouts/"
    ERB.new(File.read(dir + layout))
    .result(context.get_binding do
              ERB.new(File.read(dir + template)).result(context.get_binding)
    end)
  end
end
