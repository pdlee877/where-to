$(document).ready(function() {
	$('#load-more-content').click(function()
  {
    
    $('#more-content').toggleClass('shown');

    $('#load-more-content').hide();

    if( $('#more-content').hasClass('shown') )
    {
      $('#load-more-content').text('Hide content');
      $('#more-content').fadeIn('slow', function()
      {
        $('#load-more-content').fadeIn('slow');
      });
    }
    else
    {
      $('#load-more-content').text('Load some content');
      $('#more-content').fadeOut('slow', function()
      {
        $('#load-more-content').fadeIn('slow');
      });
    }
  });

  nearbyButtonListener();
});

var nearbyButtonListener = function() {
  $('#restaurant-button').on('submit', function(event) {
    event.preventDefault();
    console.log('in nearbyButtonListener')
  })
}
