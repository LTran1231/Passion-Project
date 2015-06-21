$(document).ready(function() {
	searchButtonListener();
	postLinkListener();

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
			$('.post #post-content').hide();
		})

		request.fail(function(response){
			console.log(response);
			alert("Fail");
		})
	})
}

var postLinkListener = function(){
	$('#link-post').on('click', function(event) {
		event.preventDefault();
		var url = $(event.target)
		debugger
		var request = $.ajax({
			url: url,
			type: 'GET',
		})
		request.done(function(response) {
			console.log(response);
		})
		request.fail(function(response) {
			console.log(response);
			alert("FAIL");
		})
	})
}















