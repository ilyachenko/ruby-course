#\ -w -p 1111 --host 0.0.0.0
use Rack::Reloader, 0
use Rack::ContentLength

system "clear"

require "colorize"
require "awesome_print"

require File.expand_path("./static_middleware.rb", "middleware")
require File.expand_path("./session_middleware.rb", "middleware")
require File.expand_path("./store.rb", "app")

use Static
use Session

run Store.new