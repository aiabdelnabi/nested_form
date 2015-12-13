(function($){
	
	$(document).on("click", ".remove-fields", function(event){
		$(this).prev(".destroy-fields").val("1");
		$(this).closest(".controls").hide();
		event.preventDefault();
	})

	$(document).on("click", ".add-fields", function(event){
		var time = new Date().getTime();
		var regexp = new RegExp($(this).data("id"), "g");
		$(this).before($(this).data("fields").replace(regexp, time))
		event.preventDefault();
	});

})(jQuery);