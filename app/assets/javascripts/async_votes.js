$(function(){
  $('[data-post-id]').on('click', '[data-method="post"]', function(e) {
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
      success: function(data) {
        upvote = data.upvote
        upvoteCount = data.count
        // Create the String version of the form action
        // This needs to be fixed, otherwise it could potentially mess with all anchor tages on the page.
        // Create more posts and make sure
        $voteLink = $('<a>').attr({
          'class': 'vote-down',
          'data-method': 'delete',
          'href': $url + '/' + upvote.id,
        });

        createUpvoteBtn(upvoteCount);
        createFlashNotice('You have upvoted!');
      }, // End success callback
      error: function(data) {
        console.log(data);
      }
    });
  }); // End of data-method="post"


  $('[data-post-id]').on('click', '[data-method="delete"]', function(e) {
    e.stopPropagation();
    e.preventDefault();
    // Capture the target of the event
    $target = $(e.currentTarget);
    // Get the parent of the target which holds the data-href attribute
    $url = $target.attr('href');
    $.ajax({
      type: "DELETE",
      url: $url,
      dataType: "json",
      success: function(data) {
        upvoteCount = data.count

        $voteLink = $('<a>').attr({
          'class': 'vote-up',
          'data-method': 'post',
          'href': '/posts/' + data.post.id + '/upvotes',
        });

        createUpvoteBtn(upvoteCount);
        createFlashNotice('Your upvote was removed');
      }
    });
  });

  function createUpvoteBtn(count) {
    $newButton = $('<div>').attr('class', 'vote col-sm-2');
    $newSpan = $('<span>').append(count);
    $upvoteChar = $('<span>').attr('class', 'block').append('&#9650;');
    $newButton.append($upvoteChar);
    $newButton.append($newSpan);
    $voteLink.append($newButton);
    $target.replaceWith($voteLink);
  }
});
