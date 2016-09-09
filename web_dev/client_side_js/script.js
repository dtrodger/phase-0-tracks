document.addEventListener('DOMContentLoaded', function() {
	var lis = document.getElementsByTagName('li');
	for (i = 0; i < lis.length; i += 2) {
		var li = lis[i]
		li.style.border = '3px solid red'
	}

	function hideGhost(event) {
		event.target.className += 'hidden';
		var ghost = document.getElementById('ghost');
		ghost.className += 'hidden';
		var show = document.getElementById('show');
		show.className = '';
	}

	function showGhost(event) {
		event.target.className += 'hidden';
		var ghost = document.getElementById('ghost');
		ghost.className = '';
		var hide = document.getElementById('hide');
		hide.className = '';
	}

	var hide_ghost = document.getElementById('hide');
	hide_ghost.addEventListener('click', hideGhost);

	var show_ghost = document.getElementById('show');
	show_ghost.addEventListener('click', showGhost);


}, false);