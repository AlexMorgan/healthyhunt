$(function(){
  $('[data-method="post"]').on('click', function(e) {
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
        // This needs to be fixed, otherwise it could potentially mess with all anchor tages on the page.
        // Create more posts and make sure
        $downvoteLink = $('a').attr({
          'class': 'vote-down',
          'data-method': 'delete',
          'href': $url + '/' + upvote.id,
        });
      } // End success callback
    });
  });
});
