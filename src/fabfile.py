# use Fabric to do my bidding with Hyde
# adopted largely from the awesome post at http://stevelosh.com/blog/2010/01/moving-from-django-to-hyde/ (thanks!)

from fabric.api import *
import os
import fabric.contrib.project as project

# run the sass update on the .scss file.
def scss(watch=False,fresh=False):
	# kill the local copy if desired
	if (fresh):
		local('rm -rf ./content/static/css/style.css')

	# watch dis?
	if (watch):
		local('sass --watch ./content/static/css/')
	else: 
		local('sass --update ./content/static/css/style.scss:content/static/css/style.css')

# update the coffeescript script
def coffee():
	local('/usr/local/bin/coffee -c content/static/js/script.coffee')

# REMOVE ALL THE THINGS
def clean():
	notify('Hyde','Local copy torched')
	local('rm -rf ./deploy')

# regenerate the output files (optionally, do so with a fresh install, and/or compress the css and js)
def regen(fresh=False,compress=False):

	# compress (not yet implemented)
	if (compress):
		# compressorize()
		pass

	# if a clean run is desired, nuke everything
	if (fresh):
		clean()

	# run the scss->css update
	scss(False,fresh)
	
	# run the coffeescript->js update
	# coffee()
		
	# generate the fancy files
	local('hyde gen')

# just serve dis
def serve():
	local('hyde serve')

# generate a fresh copy of everything and serve it on :8080
def reserve(fresh=False,compress=False):
	regen(fresh,compress)
	notify('Hyde','Finished building')
	serve()

#### DEPLOY #######

def deploy_prep():
	local('rm -rf ../public/')
	local('cp -r ./deploy ../public/')
	notify('Hyde','Deploy prep finished')

# # the user to use for the remote commands
# env.user = 'mjd'
# # the servers where the commands are executed
# env.hosts = ['mjd.xen.prgmr.com']
# 
# # def pack():
# #     # create a new source distribution as tarball
# #     local('python setup.py sdist --formats=gztar', capture=False)
# 
# def deploy():
#     # upload the source tarball to the temporary folder on the server
#     put('dist/%s.tar.gz' % dist, '/tmp/yourapplication.tar.gz')
#     # create a place where we can unzip the tarball, then enter
#     # that directory and unzip it
#     run('mkdir /tmp/yourapplication')
#     with cd('/tmp/yourapplication'):
#         run('tar xzf /tmp/yourapplication.tar.gz')
#         # now setup the package with our virtual environment's
#         # python interpreter
#         run('/var/www/yourapplication/env/bin/python setup.py install')
#     # now that all is set up, delete the folder again
#     run('rm -rf /tmp/yourapplication /tmp/yourapplication.tar.gz')
#     # and finally touch the .wsgi file so that mod_wsgi triggers
#     # a reload of the application
#     run('touch /var/www/yourapplication.wsgi')



#### HELPERS #######

import sys
import os
from Growl import GrowlNotifier
from Growl import Image

def notify(header,body):
	gi = Image.imageFromPath('./content/static/images/_apple-touch-icon.png')
	gn = GrowlNotifier(applicationName="DxNotifier",notifications=[header,body],applicationIcon=gi)
	gn.register()
	gn.notify(noteType='Hyde',title=header,description=body,icon=gi)

	