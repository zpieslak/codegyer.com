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

  // colorbox
  $(".gallery").colorbox();

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
