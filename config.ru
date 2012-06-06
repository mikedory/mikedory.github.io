# config.ru
# running the app with Rack!
# 
# run locally with:
# 	rackup -p 5000 config.ru
# 

require 'rack'
require 'rack/contrib/try_static'
require 'rack-rewrite'

use Rack::Rewrite do
	# rewrite '/', '/index.html'
	r301 '/index.html', '/'
	# r301 '/projects.html', '/projects/'
	# r301 '/projects', '/projects/'
	# r301 '/about.html', '/about'

	# r301 %r{/projects/(\S+)/.html}, '/projects/$1/'
	# r301 '/about.html', '/about/'
	# r301 %r{^/(.html)$}, '/$1'
	r301 %r{^/(.*)/$}, '/$1'
end

use Rack::TryStatic, 
	:root => "public",  # static files root dir
	:urls => %w[/],     # match all requests 
	:try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

# otherwise 404 NotFound
errorFile='./public/static/404.html'
run lambda { [404, {
				"Last-Modified"  => File.mtime(errorFile).httpdate,
				"Content-Type"   => "text/html",
				"Content-Length" => File.size(errorFile).to_s
			}, File.read(errorFile)] }

# superthanks to:
# http://chriscontinanza.com/2011/06/15/Jekyll-to-heroku.html
# http://yannesposito.com/Scratch/en/blog/2010-08-23-Now-heberged-on-heroku/
# http://gmarik.info/blog/2010/05/10/blogging-with-jekyll-and-heroku-for-free
# http://mwmanning.com/2011/12/04/Jekyll-on-Heroku-Part-2.html