<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>

.search {
    margin-top: 40px;
    margin-left: 135px;
    margin-bottom: 30px;
    position: relative;
 	width: 300px;
}

.data {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

i {
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}



</style>
</head>
<body>
<div class="search">
	<p>상세주소 입력</p>
	<input type="text" id="data">
	<i onclick="search();" class="fa-solid fa-magnifying-glass" style="cursor: pointer;"></i>
	<i onclick="getLocation();" class="fa-solid fa-location-crosshairs" style="cursor: pointer;"></i>
    <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
        <i class="fa-regular fa-circle-question"></i>
    </a>
	
</div>




<div id="map" style="width:100%; height:700px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=483549772cdca81135a3c0c8687d699b&libraries=services"></script>
<script>

window.onload = function() {
	map();
}

function search() {
	let data = document.getElementById("data").value;
	
	map(data);
}


function map(data, latitude, longitude) {
	
	let lat = latitude ? latitude : 37.5642135;
	let lon = longitude ? longitude : 127.0016985;
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표  37.5062528, 126.73024
        level: 7 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(data, function(result, status) {

    	// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + data +'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
});

}

function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      alert(position.coords.latitude + ' ' + position.coords.longitude);
	      
	      let latitude  = position.coords.latitude;
	      let longitude = position.coords.longitude;
	      
	      map(data, latitude, longitude);
	      
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	  }
	}


    
</script>
</body>
</html>