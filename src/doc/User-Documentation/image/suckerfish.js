// based on http://www.alistapart.com/articles/dropdowns and http://www.htmldog.com/articles/suckerfish/dropdowns/
function MenuListElementHoverFix() {
	var _this	= this;
	
	if (typeof(Array.prototype.push) == 'undefined') {
		// IE < 5.5 does not support push/pop
		function push() {
			var j = this.length;
			for (var i = 0; i < push.arguments.length; ++i) {
				this[j] = push.arguments[i];
				j++;
			}
		}
		function pop() {
			var i = this[this.length - 1];
			this.length--;
			return i;
		}
		Array.prototype.push	= push;
		Array.prototype.pop		= pop;
	}
	
	this.className				= 'hover';	// change the class name to use here if you are not happy with it
	this.classNameSuffix		= ' ' + this.className;
	this.removeClassNameRegExp	= new RegExp("\\b ?" + this.className + "\\b");
	this.hoverElementStack		= new Array();
	
	this.onmouseover	= function() {
		if (!_this.isHover(this)) {
			if (this.getAttribute('is_hover_class_removing') != 'true') {
				this.className	+= _this.classNameSuffix;
			}
			this.setAttribute('is_hover', 'true');
		}
	}
	this.isHover	= function(element) {
		return (element.getAttribute('is_hover') == 'true');
	}
	this.checkNonHoverState	= function(element) {
		if (!_this.isHover(element)) {
			element.className	= element.className.replace(_this.removeClassNameRegExp, '');
		}
		element.removeAttribute('is_hover_class_removing');
	}
	this.checkLastNonHoverState	= function() {
		var hoverElement	= null;
		if (_this.hoverElementStack.length > 0) {
			hoverElement	= _this.hoverElementStack.pop();
		}
		for (var i = _this.hoverElementStack.length - 1; i >= 0; i--) {
			// we need to apply the "non-hover" class to the children first - else the result is mixed in the IE
			var o = _this.hoverElementStack[i];
			while (o != null) {
				o	= o.offsetParent;
				if (o == hoverElement) {
					_this.checkNonHoverState(_this.hoverElementStack[i]);
					break;
				}
			}
		}
		if (hoverElement != null) {
			_this.checkNonHoverState(hoverElement);
		}
	}
	this.onmouseout		= function() {
		// all this mess to not change the class immediately (which would cause flickering in the IE)
		this.setAttribute('is_hover', 'false');
		if (this.getAttribute('is_hover_class_removing') != 'true') {
			this.setAttribute('is_hover_class_removing', 'true');
			_this.hoverElementStack.push(this);
			window.setTimeout(_this.checkLastNonHoverState, 100);
		}
	}
	this.fixElement		= function(elementRoot) {
		for (var i=0; i < elementRoot.childNodes.length; i++) {
			var node = elementRoot.childNodes[i];
			if (node.nodeName == "LI") {
				node.onmouseover	= this.onmouseover;
				node.onmouseout		= this.onmouseout;
			}
			this.fixElement(node);
		}
	};
	
	this.fix			= function() {
		var uls, ul;
		uls	= document.getElementsByTagName("UL");
		
		for (var i=0; i< uls.length; i++) {
			ul = uls[i];
			if ((ul.className != '') && (ul.className.indexOf("mainlevel")>=0 || ul.className.indexOf("sublevel")>=0)) {
				this.fixElement(ul);
			}
		}
	}
}

function jsnFixList(){
	var hoverFix;
	if (document.all && document.getElementsByTagName) {
		hoverFix = new MenuListElementHoverFix();
		hoverFix.fix();
	}
}

function jsnAddEvent(target, event, func){ 
	if (target.addEventListener){ 
		target.addEventListener(event, func, false); 
		return true; 
	} else if (target.attachEvent){ 
		var result = target.attachEvent("on"+event, func); 
		return result; 
	} else { 
		return false; 
	}
}

jsnAddEvent(window, 'load', jsnFixList);