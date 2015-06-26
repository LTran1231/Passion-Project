$(document).ready(function() {
	searchButtonListener();
	showEditProfileForm();
	editProfileButtonListener();
	showNewPostForm();
	addNewPostButtonListener();
	showEditPostForm();
	// modalTrigger();
	// callingSignInForm();
	// callingSignUpForm();

});

// var modalTrigger = function(){
// 	$("#modal_trigger").leanModal({
// 	 	top : 200, 
// 	 	overlay : 0.6, 
// 	 	closeButton: ".modal_close" 
// 	});
// }

// var callingSignInForm = function(){
// 	$('.signin_form').on('click', function(){
// 		$('.user_login').show();
// 		return false;
// 	})
// };

// var callingSignUpForm = function(){
// 	$('.signup').on('click', function(){
// 		$('.signup').show();
// 		$('.header_title').text('Register');
// 		return false;
// 	})
// };


// SEARCH BTN
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
			console.log(response);
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

// SHOW AND HIDE EDIT FORM IN THE PROFILE PAGE
var showEditProfileForm = function(){
	$('.profile-columns').on('click', '#edit-profile', function(event) {
		event.preventDefault();

		var target = $(event.target);
		target.closest('.profile-columns').find('.edit-profile-form').show();
		target.closest('.profile-columns').find('.display-all-posts').hide();
		target.closest('.profile-columns').find('.add-new-post').hide();


	})
};

// EDIT PROFILE
var editProfileButtonListener = function(){
	$('form#edit-profile-form').on('submit', function(event){
		event.preventDefault();

		var target = $(event.target);

		var request = $.ajax({
			url: target.attr('action'),
			type: 'PUT',
			data: target.serialize(),
		})

		request.done(function(response) {
			target.closest('.profile-columns').replaceWith(response);
			target.closest('.profile-columns').find('.display-all-posts').show();
			target.closest('.profile-columns').find('.edit-profile-form').hide();



		})

		request.fail(function(response) {
			console.log(response);
			alert("FAIL");
		})
	})
};

// SHOW/HIDE NEW POST FORM IN THE PROFILE PAGE
var showNewPostForm = function(){
	$('.profile-columns').on('click', '#new-post', function(event) {
		event.preventDefault();

		var target = $(event.target);
		target.closest('.profile-columns').find('.add-new-post').show();
		target.closest('.profile-columns').find('.display-all-posts').hide();
		target.closest('.profile-columns').find('.edit-profile-form').hide();

	})
};

// ADD NEW POST 
var addNewPostButtonListener = function(){
	$('form.new-post-form').on('submit', function(event){
		event.preventDefault();

		var target = $(event.target);

		var request = $.ajax({
			url: target.attr('action'),
			type: target.attr('method'),
			data: target.serialize(),
		})

		request.done(function(response){
			target.closest('.profile-columns').replaceWith(response);
			target.closest('.profile-columns').find('.display-all-posts').show();
			target.closest('.profile-columns').find('.add-new-post').hide();

		})
		request.fail(function(response){
			console.log(response);
			alert("FAIL");
		})
	})
};

// SHOW/HIDE EDIT POST FORM
var showEditPostForm = function(){
	$('.profile-columns').on('click', 'a#edit-post-link', function(event) {
		event.preventDefault();

		var target = $(event.target);
		// $('.edit-post-form').hide();
		target.parent().children('.edit-post-form').slideToggle();
  })
};















