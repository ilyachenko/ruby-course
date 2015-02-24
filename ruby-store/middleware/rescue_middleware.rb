class Rescue

  def initialize(nnext)
    @nnext = nnext
  end

  def call(env)
    begin
      @nnext.call(env)
    rescue Exception => e
      [500, {'Content-Type' => 'text/html'}, ["Error in app: " + e.message]]
    end

  end
end
