# ==|== primary coffeescript -> javascript =================================
#   Author: Mike Dory | http://dory.me
# ==========================================================================

# uncomment this line only if running coffeescript interactive:
# $ = require '/usr/local/lib/node_modules/jquery'

#-----------------------

###
Portfolio page
###


# bind clicks for the portfolio tab menu
$(".project-sort-buttons li a.clickable").click ->

	# what did you click on there buddy?
	if $(@).closest('li a').hasClass('clickable')
		# the user clicked a non-active one, so show it
		hideAndShow(@)
	else 
		# user is clicking the currently highlighted one, so do nothing
	return false


# hide all categories, then show the right one
hideAndShow = (div) -> 

	# which one are we talking about here?
	classToShow = $(div).closest('li').attr('class').split(' ')[0]

	# hide all the groups
	$('.post-group').hide()

	# remove active highlights, restore clickable classes
	$(div).closest('ul').each (index, element) =>
		$(element).find('li').removeClass('active')
		$(element).find('li a').addClass('clickable')

	# set the right tab to be active, remove its clickable class
	$(div).closest('li').addClass('active')
	$(div).closest('li a').removeClass('clickable')

	# show the new one
	if $(div).closest('li').hasClass('all')
		# show everything
		$('.post-group').fadeIn(150)
	else
		# show the category that was selected
		$('.'+classToShow).fadeIn(150)


# stop people from clicking the first (default) tab on page load
$('li:first a').removeClass('clickable')


# black-and-white mouseovers
$('.bwrollover').hover(
	-> colorizeRollover(@)
	-> unColorizeRollover(@)
)

colorizeRollover = (div) ->
	$(div).find('img.gray').hide()
	$(div).find('img.color').show()

unColorizeRollover = (div) ->
	$(div).find('img.color').hide()
	$(div).find('img.gray').show()

# colorizeRollover = (div, text) ->

# 	magickly = "http://dory-magickly.herokuapp.com"
# 	img = $(div).attr('src')

# 	if img.indexOf "grayscale=true"
# 		#  do nothing
# 	else
# 		$(div).attr('src', magickly+"?src="+img+"&grayscale=true")

# unColorizeRollover = (div, text) ->
# 	magickly = "http://dory-magickly.herokuapp.com"
# 	img = $(div).attr('src')

# 	if img.indexOf "grayscale=true"
# 		img.replace /grayscale=true/, "grayscale=false"
# 		# $(div).attr('src', magickly+"?src="+img)
# 		$(div).attr('src',img)


### 
HEY - i am doing this all wrong.  load both images, hide
###

#-----------------------

###
Helper functions
###

# log wrapper
log = (msg) ->
	if console
		console.log(msg) 
	else
		# alert(msg)