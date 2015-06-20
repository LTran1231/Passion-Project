$(document).ready(function() {
	searchButtonListener();


});
// Search From
var searchButtonListener = function(){
	$('.container').on('submit', 'form.search-form', function(event) {
		event.preventDefault();


		var target = $(event.target);
		
		var request = $.ajax({
			url: target.attr('action'),
			type: target.attr('method'),
			data_Type: 'Json',
  		data: target.serialize(),
		})
		request.done(function(response) {
			console.log(response);
			console.log(target)
			target.next('div').append(response);
		})

		request.fail(function(response){
			console.log(response);
			alert("Fail");
		})
	})
}
