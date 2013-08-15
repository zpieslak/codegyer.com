$(function($) {
  // subscription
  $('#new_subscription').on('ajax:before', function() {
    $(this).find("button").prop('disabled', true);
    $(this).find(".message").remove();
  });
  $('#new_subscription').on('ajax:complete', function(event, data, status) {
    $(this).find("button").prop('disabled', false);
    $(this).find("#subscription_email").val("").after("<label class=\"message\">" + data.responseJSON.message + "</label>");
  });

  // portfolio
  $('.portfolio').each( function() {
    var $image_wrap = $(this).find('.image_wrap');
    var width = $image_wrap.width();
    var height = $image_wrap.height();

    var $zoom_overlay = $(this).find('.zoom_overlay');
    var width_overlay = $zoom_overlay.width();
    var height_overlay = $zoom_overlay.height();

    $image_wrap.on('click', function() {
      var $this = $(this);
      $this.find('img:first').animate({
        width: width_overlay,
        height: height_overlay
      }, 250);
      $this.next().animate({
        width: width,
        height: height,
        marginTop: height / -2,
        marginLeft: width / -2,
        opacity: 1
      }, 250, function() {
        $(this).fadeIn();
      });

      $this.parent().siblings().find('.zoom_overlay:visible').trigger('click');
    });

    $zoom_overlay.on('click', function() {
      $(this).find('img').hide().end().stop(true).animate({
        width: width_overlay,
        height: height_overlay,
        marginTop: height_overlay / -2,
        marginLeft: width_overlay / -2,
        opacity: 0
      }, 125, function() {
        $(this).hide();
      });

      $(this).prev().find('img:first').stop(true).animate({
        width: width,
        height: height
      }, 250);
    });
  });

//  // load google map
//	if( $("#map").length > 0) {
//		google_map_load();
//	}
//
//	// google map
//	function google_map_load() {
//		var myLatlng = new google.maps.LatLng(52.4299495, 16.9562918);
//		var myOptions = {
//			zoom: 12,
//			center: myLatlng,
//			mapTypeId: google.maps.MapTypeId.ROADMAP
//		}
//    console.log('aaa');
//
//		var map = new google.maps.Map(document.getElementById("map"), myOptions);
//		var marker = new google.maps.Marker({
//			position: myLatlng,
//			map: map
//		});
//	}
});
