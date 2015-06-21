$(document).ready(function() {
	searchButtonListener();
	// postLinkListener();
});

// Search BTN
var searchButtonListener = function(){
	$('form.search-form').on('submit', function(event) {
		event.preventDefault();

		var target = $(event.target);

		var request = $.ajax({
			url: target.attr('action'),
			type: target.attr('method'),
			data_Type: 'Json',
			data: target.serialize(),
		})

		request.done(function(response) {
			$('.city').html(response);
			$('.post-content').hide();
			$('.link-post').on('click', function(){
				$(this).parent().children('.post-content').slideToggle();
			});
		})

		request.fail(function(response){
			console.log(response);
			alert("Fail");
		})
	})
};


















