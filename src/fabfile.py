# use Fabric to do my bidding with Hyde
# adopted largely from the awesome post at http://stevelosh.com/blog/2010/01/moving-from-django-to-hyde/ (thanks!)

from fabric.api import *
import os
import fabric.contrib.project as project

# run the sass update on the .scss file.
def scss():
	local('sass --update content/static/css/style.scss:content/static/css/style.css')

def coffee():
	local('/usr/local/bin/coffee -c content/static/js/script.coffee')

# REMOVE ALL THE THINGS
def clean():
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
	scss()
	
	# run the coffeescript->js update
	# coffee()
		
	# generate the fancy files
	local('hyde gen')


def serve():
	local('sass --watch content/static/css/')
	local('hyde serve')


def reserve(fresh=False,compress=False):
	regen(fresh,compress)
	notify("sup",'Finished building')
	serve()

#### DEPLOY #######

def deploy_prep():
	local('rm -rf ../public/')
	local('cp -r ./deploy ../public/')

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
	gi = Image.imageFromPath('./deploy/static/images/_apple-touch-icon.png')
	gn = GrowlNotifier(applicationName="DxNotifier",notifications=[header,body],applicationIcon=gi)
	gn.register()
	gn.notify(noteType='sup',title=header,description=body,icon=gi)

	