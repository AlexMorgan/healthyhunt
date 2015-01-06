function createFlashNotice(msg) {
  // Remove any exising flash notices
  $('.flash').remove();

  // Create flash notice
  $flash = $('<div>').attr('class', 'flash center');
  $flashNotice = $('<div>').attr('class', 'alert alert-notice');
  $flashNotice.append(msg);
  $flash.append($flashNotice).fadeIn(700);

  // Insert flash notice after navbar
  $('.navbar').after($flash);
}
