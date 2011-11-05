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

# require 'rubygems'
# require 'rack'
# require 'rack/contrib'

# use Rack::ETag

# map "/projects" do
#   run Rack::File.new('./projects')
# end

# map "/" do
#   run Rack::File.new('./public')
# end

require 'bundler'
Bundler.setup
Bundler.require
require 'rack/contrib/try_static'

use Rack::TryStatic, 
    :root => "public",  # static files root dir
    :urls => %w[/],     # match all requests 
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially
# otherwise 404 NotFound
run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}
