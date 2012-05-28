# log wrapper
log = (msg) ->
	if console
		console.log(msg) 
	else
		# alert(msg)

# animations for the menu on the portfolio
$(".project-sort-buttons").children().click ->

	$('.post-group').slideUp()
	classToShow = $(event.target).attr('class').split(' ')[0]
	$('.'+classToShow).delay(200).slideDown(150)

	# $('.post-group').fadeOut(
	# 	-> $('.'+classToShow).delay(200).show(1500)
	# )

	
	# 	$('.post-group').fadeOut(100) and $('.'+classToShow).show()

