/*!
  * Wingman Bootstrap Theme
  * Copyright 2018-2019 Medium Rare (undefined)
  */
!function(t,e){"object"==typeof exports&&"undefined"!=typeof module?e(exports,require("jquery"),require("prismjs"),require("smooth-scroll"),require("scrollmonitor"),require("smartwizard")):"function"==typeof define&&define.amd?define(["exports","jquery","prismjs","smooth-scroll","scrollmonitor","smartwizard"],e):e((t=t||self).theme={},t.jQuery,t.Prism,t.SmoothScroll,t.scrollMonitor)}(this,function(t,i,e,o,k){"use strict";var s;i=i&&i.hasOwnProperty("default")?i.default:i,e=e&&e.hasOwnProperty("default")?e.default:e,o=o&&o.hasOwnProperty("default")?o.default:o,k=k&&k.hasOwnProperty("default")?k.default:k,s=i,"objectFit"in document.documentElement.style==0&&s(".bg-image").each(function(){var t=s(this),e=t.attr("src"),i=t.get(0).classList;t.before(s('<div class="'+i+'" style="background: url('+e+'); background-size: cover; background-position: 50% 50%;"></div>')),t.remove()}),e.highlightAll();var r=new o("a[data-smooth-scroll]",{offset:i("body").attr("data-smooth-scroll-offset")||0});function b(t,e){for(var i=0;i<e.length;i++){var o=e[i];o.enumerable=o.enumerable||!1,o.configurable=!0,"value"in o&&(o.writable=!0),Object.defineProperty(t,o.key,o)}}var a,n=function(n){if(void 0===k)throw new Error("mrSticky requires scrollMonitor.js (https://github.com/stutrek/scrollMonitor)");var t="mrSticky",r="mr.sticky",e=n.fn[t],c="position-fixed",l="sticky-bottom",a="sticky-viewport-bottom",h="scrolled",u="min-height",d="max-width",f="top",v={LOAD_DATA_API:"load.mr.sticky.data-api",WINDOW_RESIZE:"resize",ALERT_CLOSED:"closed.bs.alert"},m="below-nav",p="bottom",y="sticky",o="[data-sticky]",g='body > div.navbar-container [data-sticky="top"]',w=".alert-dismissible",s=function(){function i(t){var e=n(t),i=e.data(y),o=e.closest("section")||null;this.element=t,this.stickBelowNav=i===m,this.stickBottom=i===p,this.stickyUntil=o,this.updateNavProperties(),this.isNavElement=e.is(this.navElement),this.initWatcher(e),this.updateCss(),this.setResizeEvent(),this.onWatcherChange(e),this.ticking=!1}var t,e,o,s=i.prototype;return s.initWatcher=function(t){var e=this,i=n(t),o=!this.isNavElement,s=this.stickBelowNav&&this.navIsSticky&&o?{top:this.navHeight}:0;s=this.stickBottom&&o?{bottom:-i.outerHeight}:s;var r=k.create(t,s);r.lock();var a=null!==this.stickyUntil?k.create(this.stickyUntil,{bottom:-(r.height+s.top)}):null;this.watcher=r,this.untilWatcher=a,this.navHeight=this.navHeight,this.isNavElement&&0===r.top&&!this.navIsAbsolute&&i.addClass(c),r.stateChange(function(){e.onWatcherChange(i)}),null!==a&&(a.exitViewport(function(){i.addClass(l)}),a.enterViewport(function(){i.removeClass(l)}))},s.onWatcherChange=function(t){t.toggleClass(c,this.watcher.isAboveViewport||!this.navIsAbsolute&&!this.stickBottom&&this.isNavElement&&0===this.watcher.top),t.toggleClass(h,this.watcher.isAboveViewport&&this.isNavElement&&!this.stickBottom),t.toggleClass(a,(this.watcher.isFullyInViewport||this.watcher.isAboveViewport)&&this.stickBottom),this.stickBottom||t.css(f,this.watcher.isAboveViewport&&this.navIsSticky&&this.stickBelowNav?this.navHeight:0)},s.setResizeEvent=function(){var t=this;n(w).on(v.ALERT_CLOSED,function(){t.onResize()}),n(window).on(v.WINDOW_RESIZE,function(){t.onResize()})},s.onResize=function(){var t=this;this.ticking||(window.requestAnimationFrame(function(){t.updateCss(),t.isNavElement&&(t.watcher.unlock(),t.watcher.recalculateLocation(),t.watcher.lock()),t.ticking=!1}),this.ticking=!0)},s.updateCss=function(){var t=n(this.element);t.css(d,t.parent().width()),this.updateNavProperties();var e=t.outerHeight(),i=!this.isNavElement;(!this.navIsAbsolute&&this.isNavElement||i)&&t.parent().css(u,e),this.navIsSticky&&i&&t.css(u,e)},s.updateNavProperties=function(){var t=this.navElement||n(g).first();this.navElement=t,this.navHeight=t.outerHeight(),this.navIsAbsolute="absolute"===t.css("position"),this.navIsSticky=0<t.length},i.jQueryInterface=function(){return this.each(function(){var t=n(this),e=t.data(r);e||(e=new i(this),t.data(r,e))})},t=i,o=[{key:"VERSION",get:function(){return"1.2.0"}}],(e=null)&&b(t.prototype,e),o&&b(t,o),i}();return n(window).on(v.LOAD_DATA_API,function(){for(var t=n.makeArray(n(o)),e=t.length;e--;){var i=n(t[e]);s.jQueryInterface.call(i,i.data())}}),n.fn[t]=s.jQueryInterface,n.fn[t].Constructor=s,n.fn[t].noConflict=function(){return n.fn[t]=e,s.jQueryInterface},s}(i),c=((a=i)('[data-toggle="tooltip"]').tooltip(),a(".toast").toast(),{activateIframeSrc:function(t){var e=a(t);e.attr("data-src")&&e.attr("src",e.attr("data-src"))},idleIframeSrc:function(t){var e=a(t);e.attr("data-src",e.attr("src")).attr("src","")}});i(document).ready(function(){i(".video-cover .video-play-icon").on("click touchstart",function(){var t=i(this).closest(".video-cover").find("iframe");c.activateIframeSrc(t),i(this).parent(".video-cover").addClass("video-cover-playing")}),!0==="ontouchstart"in document.documentElement&&i(".video-cover").each(function(){i(this).addClass("video-cover-touch");var t=i(this).closest(".video-cover").find("iframe");c.activateIframeSrc(t)}),i(".modal").on("shown.bs.modal",function(){var t=i(this);if(t.find("iframe[data-src]").length){var e=t.find("iframe[data-src]");c.activateIframeSrc(e)}}),i(".modal").on("hidden.bs.modal",function(){var t=i(this);if(t.find("iframe[src]").length){var e=t.find("iframe[data-src]");c.idleIframeSrc(e)}}),i('[data-toggle="tooltip"]').tooltip()}),i(document).ready(function(){i(".wizard").smartWizard({transitionEffect:"fade",showStepURLhash:!1,toolbarSettings:{toolbarPosition:"none"}})}),function(){if("undefined"==typeof $)throw new TypeError("Medium Rare JavaScript requires jQuery. jQuery must be included before theme.js.")}(),t.mrSmoothScroll=r,t.mrSticky=n,t.mrUtil=c,Object.defineProperty(t,"__esModule",{value:!0})});
//# sourceMappingURL=theme.js.map


	let i=2;

	
	$(document).ready(function(){
		var radius = 200;
		var fields = $('.itemDot');
		var container = $('.dotCircle');
		var width = container.width();
 radius = width/2.5;
 
		 var height = container.height();
		var angle = 0, step = (2*Math.PI) / fields.length;
		fields.each(function() {
			var x = Math.round(width/2 + radius * Math.cos(angle) - $(this).width()/2);
			var y = Math.round(height/2 + radius * Math.sin(angle) - $(this).height()/2);
			if(window.console) {
				console.log($(this).text(), x, y);
			}
			
			$(this).css({
				left: x + 'px',
				top: y + 'px'
			});
			angle += step;
		});
		
		
		$('.itemDot').click(function(){
			
			var dataTab= $(this).data("tab");
			$('.itemDot').removeClass('active');
			$(this).addClass('active');
			$('.CirItem').removeClass('active');
			$( '.CirItem'+ dataTab).addClass('active');
			i=dataTab;
			
			$('.dotCircle').css({
				"transform":"rotate("+(360-(i-1)*36)+"deg)",
				"transition":"2s"
			});
			$('.itemDot').css({
				"transform":"rotate("+((i-1)*36)+"deg)",
				"transition":"1s"
			});
			
			
		});
		
		setInterval(function(){
			var dataTab= $('.itemDot.active').data("tab");
			if(dataTab>6||i>6){
			dataTab=1;
			i=1;
			}
			$('.itemDot').removeClass('active');
			$('[data-tab="'+i+'"]').addClass('active');
			$('.CirItem').removeClass('active');
			$( '.CirItem'+i).addClass('active');
			i++;
			
			
			$('.dotCircle').css({
				"transform":"rotate("+(360-(i-2)*36)+"deg)",
				"transition":"2s"
			});
			$('.itemDot').css({
				"transform":"rotate("+((i-2)*36)+"deg)",
				"transition":"1s"
			});
			
			}, 5000);
		
	});

