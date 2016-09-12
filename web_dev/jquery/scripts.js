$(document).ready(function() {
	$('h4').on('click', function() {
		$(this).next('.answer').slideToggle();
		$(this).toggleClass('opened');
		$(this).find('i').toggleClass('rotate-90');
	});
	$('h4').on('mouseenter', function() {
		$(this).addClass('hover');
	});
	$('h4').on('mouseleave', function() {
		$(this).removeClass('hover');
	});
});