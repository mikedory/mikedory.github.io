# $ = require '/usr/local/lib/node_modules/jquery'

#-----------------------


###
Portfolio page
###


# animations for the menu on the portfolio
$(".project-sort-buttons li a.clickable").click ->

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

	# hide the right groups
	$('.post-group').fadeOut()

	# remove active highlights, restore clickable classes
	$(div).closest('ul').each (index, element) =>
		$(element).find('li').removeClass('active')
		$(element).find('li a').addClass('clickable')

	# set the right tab to be active, remove its clickable class
	$(div).closest('li').addClass('active')
	$(div).closest('li a').removeClass('clickable')

	# show the new one
	$('.'+classToShow).delay(200).fadeIn(150)

# stop people from clicking the Writing tab on first load
$('li.writing a').removeClass('clickable')


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