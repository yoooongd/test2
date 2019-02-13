<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
 <script src="http://code.jquery.com/jquery-1.11.0.js"></script>   
<script>
    $(function() {        
        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition (function(pos) {
                $('#latitude').html(pos.coords.latitude);     // 위도
                $('#longitude').html(pos.coords.longitude); // 경도
            });
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
    });
</script>
  </head>
  <body>
  <!-- <div id="map" style="width:500px;height:500px;"></div> -->
    <div id="map"></div>
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 16
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            /* infoWindow.setContent('Location found.'); */
            infoWindow.setContent('Your Position');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
      function current_position(position)
      {
          var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          
          var map_options = {
              center:latlng,zoom:14,
              mapTypeId:google.maps.MapTypeId.ROADMAP,
              mapTypeControl:false,
              navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
          }
          
          var map = new google.maps.Map(document.getElementById("google_map"), map_options);
          
          var marker = new google.maps.Marker({position:latlng,map:map,title:"You are here!"});
      }
      

    </script>
	      <ul>
	      <li>위도:<span id="latitude"></span></li>
	      <li>경도:<span id="longitude"></span></li>
	  </ul>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcSiP_YUmvtf5SVuhe2gY4zsZ2OLb-QWQ&callback=initMap">
    </script>
  

  </body>
</html>
