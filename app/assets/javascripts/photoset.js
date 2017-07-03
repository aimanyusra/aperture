$( document ).ready(function() {
	$('.photoset-grid-custom').photosetGrid({
	  // Set the gutter between columns and rows
	  gutter: '10px',
	  // Manually set the grid layout
	  layout: '21312312',
	  // Wrap the images in links
	  highresLinks: true,
	  // Asign a common rel attribute
	  rel: 'print-gallery',

	  onInit: function(){},
	  onComplete: function(){
	    // Show the grid after it renders
	    $('.photoset-grid-custom').attr('style', '');
	  }
	});
});