# config.ru
# running the app with Rack!
# 
# run locally with:
# 	rackup -p 5000 config.ru
# 

require 'rack'
require 'rack/contrib/try_static'

use Rack::TryStatic, 
    :root => "public",  # static files root dir
    :urls => %w[/],     # match all requests 
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

# otherwise 404 NotFound
errorFile='./public/404.html'
run lambda { [404, {
                "Last-Modified"  => File.mtime(errorFile).httpdate,
                "Content-Type"   => "text/html",
                "Content-Length" => File.size(errorFile).to_s
            }, File.read(errorFile)] }

# superthanks to:
# http://chriscontinanza.com/2011/06/15/Jekyll-to-heroku.html
# http://yannesposito.com/Scratch/en/blog/2010-08-23-Now-heberged-on-heroku/
# http://gmarik.info/blog/2010/05/10/blogging-with-jekyll-and-heroku-for-free
