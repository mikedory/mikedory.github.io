# config.ru
# running the app with Rack!
# 
# run locally with:
# 	rackup -p 5000 config.ru
# 
# --------------------------
# 
# superthanks to:
# 
# http://chriscontinanza.com/2011/06/15/Jekyll-to-heroku.html
# http://yannesposito.com/Scratch/en/blog/2010-08-23-Now-heberged-on-heroku/
# http://gmarik.info/blog/2010/05/10/blogging-with-jekyll-and-heroku-for-free
# http://mwmanning.com/2011/12/04/Jekyll-on-Heroku-Part-2.html
# 

require 'rubygems'
require 'rack'
require 'rack/contrib/try_static'
require 'rack-rewrite'

use Rack::Rewrite do
	# rewrite doryexmachina.com to dory.me
	# r301 %r{.*}, 'http://doryexmachina.com$&',
		# :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] != 'dory.me' }

	r301 '/index.html', '/' # rewrite index.html to root
	r301 %r{^/(.*)/$}, '/$1' # rewrite out .html extensions (and everything else)
	r301 %r{/projects/(\S+).html}, '/projects/$1/'
	# http://www.doryexmachina.com/projects/concrete-crickets
end

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
