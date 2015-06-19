$(document).ready(function() {

	$('.center-search-bar').on('submit', 'form.search-form', function(event) {
	  event.preventDefault();
	  var $target = $(event.target);
	  $.ajax({
	    url: $target.attr('action'),
	    type: 'POST',
	    data_Type: 'Json',
	    //data: {task: {description: $target.children('input[name=task\[description\]]').val(), priority: $target.children('select').val() }, tags: $target.children('input[name=tags]').val()}
	    data: $target.serialize(),
	  }).done(function(response) {
	  	console.log(response)
	  	debugger
	    $target.find('.list-group').replaceWith(response);
	  }).fail(function(response){
	  	alert("Fail");
	  })
	})
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

// Search From
