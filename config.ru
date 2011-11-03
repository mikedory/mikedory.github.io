# use Rack::Static, 
#   :urls => ["/css", "/images", "/js"],
#   :root => "public"

# run lambda { |env|
#   [
#     200, 
#     {
#       'Content-Type'  => 'text/html', 
#       'Cache-Control' => 'public, max-age=86400' 
#     },
#     File.open('public/index.html', File::RDONLY)
#   ]
# }

require 'rubygems'
require 'rack'
require 'rack/contrib'

use Rack::ETag

map "/projects" do
  run Rack::File.new('/projects')
end

map "/" do
  run Rack::File.new('/public/')
end