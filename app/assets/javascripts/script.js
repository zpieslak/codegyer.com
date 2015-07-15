$(function($) {
  // subscription
  $('#new_subscription').on('ajax:before', function() {
    $(this).find(".message").remove();
  });
  $('#new_subscription').on('ajax:complete', function(event, data, status) {
    $(this).find("button").prop('disabled', false).text("Subscribe");
    $(this).find("#subscription_email").val("").after("<label class=\"message\">" + data.responseJSON.message + "</label>");
  });

  // colorbox
  if ($(".gallery").length >= 1) {
    $(".gallery").colorbox();
  }

  // slideshow
  if ($('#slideshow').length == 1) {
    $('#slideshow ul')
    .before('<div id="slideshow_nav">')
    .cycle({
      timeout: 3000,
      slides: 'li',
      pager: '#slideshow_nav'
    })
    .on('cycle-pager-activated', function(event, opts) {
      $(this).cycle('pause');
    });
  }

  // testimonials
  if ($('#slider').length == 1) {
    $('#slider ul')
    .before('<div id="slider_prev" /><div id="slider_next" />')
    .cycle({
      timeout: 6000,
      slides: 'li',
      prev:   '#slider_prev',
      next:   '#slider_next'
    })
    .on('cycle-next cycle-prev', function(event, opts) {
      $(this).cycle('pause');
    });
  }
});
