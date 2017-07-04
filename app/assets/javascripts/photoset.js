$( document ).on('turbolinks:load', function() {
	$('.photoset-grid-custom').photosetGrid({
	  // Set the gutter between columns and rows
	  gutter: '10px',
	  // Manually set the grid layout
	  layout: '21312312143512423413322343',
	  // Wrap the images in links
	  highresLinks: false,
	  // Asign a common rel attribute
	  rel: 'print-gallery',

	  onInit: function(){},
	  onComplete: function(){
	    // Show the grid after it renders
	    $('.photoset-grid-custom').attr('style', '');

	    $('.photoset-grid-custom img').wrap(function() {
			  return "<a href='" + $(this).data('show') + "'>" +  + "</a>";
			});
	  }
	});

	$('.photoset-grid-user').photosetGrid({
	  // Set the gutter between columns and rows
	  gutter: '10px',
	  // Manually set the grid layout
	  layout: '545',
	  // Wrap the images in links
	  highresLinks: true,
	  // Asign a common rel attribute
	  rel: 'print-gallery',

	  onInit: function(){},
	  onComplete: function(){
	    // Show the grid after it renders
	    $('.photoset-grid-user').attr('style', '');

	    $('.photoset-grid-user img').wrap(function() {
			  return "<a href='" + $(this).data('show') + "'>" +  + "</a>";
			});
	  }
	});
});