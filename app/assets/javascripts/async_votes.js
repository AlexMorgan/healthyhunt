$(function(){
  $('[data-upvote-button="create"]').on('click', function(e) {
    e.stopPropagation();
    e.preventDefault();
    // Capture the target of the event
    $target = $(e.currentTarget);
    // Get the parent of the target which holds the data-href attribute
    $url = $target.attr('href');

    $.ajax({
      type: "POST",
      url: $url,
      dataType: "json",
      success: function(upvote) {
        // Create the String version of the form action
        $downvoteLink = $('a').attr({
          'class': 'vote-down',
          'data-method': 'delete',
          'data-upvote-button': 'delete',
          'href': $url + '/' + upvote.id,
        });
      } // End success callback
    });
  });
});
