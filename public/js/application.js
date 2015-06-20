$(document).ready(function() {
	searchButtonListener();


});
// Search From
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
			$('.city').append(response);
		})

		request.fail(function(response){
			console.log(response);
			alert("Fail");
		})
	})
}
