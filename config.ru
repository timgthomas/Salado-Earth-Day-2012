require 'app'

use Rack::Static, :urls => ['/css', '/img', '/favicon.ico'], :root => 'public'

run Sinatra::Application