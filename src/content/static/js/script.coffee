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


# black-and-white mouseovers
$('.bwrollover').hover(
	-> colorizeRollover(@)
	-> unColorizeRollover(@)
)

# stop people from clicking the first (default) tab on page load
$('li:first a').removeClass('clickable')


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


# black-and-white mouseover functions
colorizeRollover = (div) ->
	$(div).find('img.gray').hide()
	$(div).find('img.color').show()

unColorizeRollover = (div) ->
	$(div).find('img.color').hide()
	$(div).find('img.gray').show()


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