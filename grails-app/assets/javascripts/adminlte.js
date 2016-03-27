//= require jquery
//= require bootstrap
//= require ../adminlte/js/raphael-min
//= require ../adminlte/plugins/morris/morris.min
//= require ../adminlte/plugins/slimScroll/jquery.slimscroll.min
//= require ../adminlte/plugins/fastclick/fastclick
//= require ../adminlte/plugins/datepicker/bootstrap-datepicker.js
//= require ../adminlte/plugins/select2/select2.js
//= require ../adminlte/plugins/number/jquery.number.min.js
//= require ../adminlte/js/app.min
//= require_self


if (typeof jQuery !== 'undefined') {
	(function($) {
		$(document).ajaxStart(function(){
			$('#spinner').fadeIn();
		}).ajaxStop(function(){
			$('#spinner').fadeOut();
		});
	})(jQuery);

	$( document ).ready(function() {
    $(".datepicker").datepicker();
		$('.radiocheckbox .btn.on').click(function() {
			//console.log("on is click");
			var $checkbox = $(this).parent().siblings("input[type=checkbox]")
			$checkbox.attr('checked', true);
			$(this).addClass("btn-primary");
			$(this).siblings().removeClass("btn-primary")
		})
		$('.radiocheckbox .btn.off').click(function() {
			//console.log("off is click");
			var $checkbox = $(this).parent().siblings("input[type=checkbox]")
			$checkbox.attr('checked', false);
			$(this).addClass("btn-primary")
			$(this).siblings().removeClass("btn-primary")
		})

		/**
		 * A checkbox using Bootstrap CSS's buttons
		 */
		$('.buttoncheckbox').click(function() {
			var $text = $(this).text()
			$(this).text($(this).attr('data-complete-text'))
			$(this).attr('data-complete-text', $text)
			$(this).toggleClass("btn-primary")
			$(this).removeClass("active")
			var $checkbox = $(this).siblings("input[type=checkbox]")
			$checkbox.attr('checked', !$checkbox.attr('checked'));
		})
	});
}
