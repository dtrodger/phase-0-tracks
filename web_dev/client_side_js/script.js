document.addEventListener('DOMContentLoaded', function() {
	var lis = document.getElementsByTagName('li');
	console.log(lis[0])
	console.log(lis.length)
	for (i = 0; i < lis.length; i += 2) {
		var li = lis[i]
		li.style.border = "3px solid red"
	}
}, false);