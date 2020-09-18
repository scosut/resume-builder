(function() {
	function close(nav, el, li, e) {
		if (e != undefined) {
			e.preventDefault();
		}

		var isHidden  = el.className.indexOf("hide") >= 0;
		var cls       = isHidden ? "fadeOut" : "fadeIn";
		el.className  = "fas fa-chevron-circle-down";
		el.className += isHidden ? " show" : " hide";
		nav.className = isHidden ? "dissolve" : "";
		
		for (var i=1; i<li.length; i++) {
			li[i].className = cls;
		}
	}
	
	function events() {
		var nav = document.getElementById("nav");
		var el  = document.getElementById("menu");
		var li  = nav.querySelectorAll("ul li");
		el.addEventListener("click", close.bind(this, nav, el, li));
		
		close(nav, el, li);
	}

	events();
})();