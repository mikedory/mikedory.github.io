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
def coffee(fresh=False):
	if (fresh):
		local('rm content/static/js/script.coffee')
	
	local('/usr/local/bin/coffee -c content/static/js/script.coffee')

# REMOVE ALL THE THINGS
def clean():
	notify('Hyde','Local copy torched')
	local('rm -rf ../public')

# regenerate the output files (optionally, do so with a fresh install, and/or compress the css and js)
def regen(fresh=False,compress=False,deploy=False):

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
	coffee()
		
	# generate the fancy files
	local('hyde gen')

	# if we're deploying
	if (deploy):
		# ship to s3
		# do other stuff
		pass

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
	# nuke the local public copy, then rewrite the contents fresh
	local('rm -rf ../public/')
	regen(True,True,True)
	notify('Hyde','Deploy prep finished')

def deploy():
	deploy_prep()
	local('git commit -am "deploy to production"')

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

	