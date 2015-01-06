$(function(){
  $('[data-user-post-id]').on('click', '[data-method="delete"]', function(e){
    // Prevent natural behavior of link - For some reason .preventDefault by itself doesn't work
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

        createFlashNotice('You deleted ' + post.product_name + ' from your posts.');
      } // end ajax success
    });
  }); // end data-user-post-id
});
