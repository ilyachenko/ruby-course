class Rescue

  def initialize(nnext)
    @nnext = nnext
  end

  def call(env)
    begin
      @nnext.call(env)
    rescue Exception => e
      [404, {'Content-Type' => 'text/html'}, ["Error in app: " + e.message]]
    end

  end
end
