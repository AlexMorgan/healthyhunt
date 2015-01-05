$(function(){
  $('[data-user-post-id]').on('click', '[data-method="delete"]', function(e){
    e.stopPropagation();
    e.preventDefault();

    $target = $(e.currentTarget);
    $url = $target.attr('href');

    $.ajax({
      type: "DELETE",
      url: $url,
      dataType: "json",
      success: function(post) {
        // Remove post from Dashboard
        $target.parent().remove();

        // Create flash notice
        $flash = $('<div>').attr('class', 'flash center');
        $flashNotice = $('<div>').attr('class', 'alert alert-notice');
        $flashNotice.append('You deleted ' + post.product_name + ' from your posts.')
        $flash.append($flashNotice);

        // Insert flash notice after navbar
        $('.navbar').after($flash);
      } // end ajax success
    });
  }); // end data-user-post-id
});
