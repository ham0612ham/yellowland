<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>상가 양도 메인 화면</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>

.search {
    position: absolute; 
    z-index: 10;
 	width: 300px;
 	left: 10px;
 	top: 10px;
}

#data {
  width: 200px;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 3px 10px;
  font-size: 14px;
}

i {
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}

.mapType {
	margin-left: 20px;
}

</style>
</head>
<body>


<p class="mapType">
    <input type="checkbox" id="chkUseDistrict" onclick="setOverlayMapTypeId()" /> 지적편집도 정보 보기
    <input type="checkbox" id="chkTerrain" onclick="setOverlayMapTypeId()" /> 지형정보 보기 
    <input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 교통정보 보기       
    <input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
</p>
<div id="map" style="width:80%; height:800px; position: relative;">
	<div class="search">
		<input type="text" id="data" placeholder="ex)마포구 월드컵북로 21">
		<i onclick="search();" class="fa-solid fa-magnifying-glass" style="cursor: pointer;"></i>
		<i onclick="getLocation();" class="fa-solid fa-location-crosshairs" style="cursor: pointer;"></i>
	    <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
	        <i class="fa-regular fa-circle-question" style="color: black;"></i>
	    </a>
	</div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=여기에 키를 입력하세요★ &libraries=services"></script>
<script>

window.onload = function() {
	overall();
}

function search() {
	let data = document.getElementById("data").value;
	
	overall(data);
}


function overall(data, latitude, longitude) {
	
	let lat = latitude  ? latitude : 37.5642135;
	let lon = longitude ? longitude : 127.0016985;
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표  37.5062528, 126.73024
        level: 8 // 지도의 확대 레벨
    };  

	
	// 지도를 생성합니다    
	map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 전역변수로 선언. 지도 타입 정보(지적편집도, 지형, 교통, 자전거도로)
	mapTypes = {
	   	terrain : kakao.maps.MapTypeId.TERRAIN,    
	   	traffic :  kakao.maps.MapTypeId.TRAFFIC,
	   	bicycle : kakao.maps.MapTypeId.BICYCLE,
	   	useDistrict : kakao.maps.MapTypeId.USE_DISTRICT
	};
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
		{
	        title: '종로구', 
	        latlng: new kakao.maps.LatLng(37.5735207, 126.9788345)
	    },
	    {
	        title: '중구', 
	        latlng: new kakao.maps.LatLng(37.563843, 126.997602)
	    },
	    {
	        title: '용산구', 
	        latlng: new kakao.maps.LatLng(37.532527, 126.99049)
	    },
	    {
	        title: '성동구', 
	        latlng: new kakao.maps.LatLng(37.563456, 127.036821)
	    },
	    {
	        title: '광진구', 
	        latlng: new kakao.maps.LatLng(37.538617, 127.082375)
	    },
	    {
	        title: '동대문구', 
	        latlng: new kakao.maps.LatLng(37.574524, 127.03965)
	    },
	    {
	        title: '중랑구', 
	        latlng: new kakao.maps.LatLng(37.6063242, 127.0925842)
	    },
	    {
	        title: '성북구', 
	        latlng: new kakao.maps.LatLng(37.5894, 127.016749)
	    },
	    {
	        title: '강북구', 
	        latlng: new kakao.maps.LatLng(37.6397819, 127.0256135)
	    },
	    {
	        title: '도봉구', 
	        latlng: new kakao.maps.LatLng(37.668768, 127.047163)
	    },
	    {
	        title: '노원구',
	        latlng: new kakao.maps.LatLng(37.654358, 127.056473)
	    },
	    {
	        title: '은평구', 
	        latlng: new kakao.maps.LatLng(37.602784, 126.929164)
	    },
	    {
	        title: '서대문구', 
	        latlng: new kakao.maps.LatLng(37.579225, 126.9368)
	    },
	    {
	        title: '마포구', 
	        latlng: new kakao.maps.LatLng(37.5663245, 126.901491)
	    },
	    {
	        title: '양천구', 
	        latlng: new kakao.maps.LatLng(37.517016, 126.866642)
	    },
	    {
	        title: '강서구', 
	        latlng: new kakao.maps.LatLng(37.550937, 126.849642)
	    },
	    {
	        title: '구로구', 
	        latlng: new kakao.maps.LatLng(37.495472, 126.887536)
	    },
	    {
	        title: '금천구', 
	        latlng: new kakao.maps.LatLng(37.4568644, 126.8955105)
	    },
	    {
	        title: '영등포구', 
	        latlng: new kakao.maps.LatLng(37.526436, 126.896004)
	    },
	    {
	        title: '동작구', 
	        latlng: new kakao.maps.LatLng(37.51245, 126.9395)
	    },
	    {
	        title: '관악구', 
	        latlng: new kakao.maps.LatLng(37.4781549, 126.9514847)
	    },
	    {
	        title: '서초구',
	        latlng: new kakao.maps.LatLng(37.483569, 127.032598)
	    },
	    {
	        title: '강남구',
	        latlng: new kakao.maps.LatLng(37.517305, 127.047502)
	    },
	    {
	        title: '송파구',
	        latlng: new kakao.maps.LatLng(37.5145636, 127.1059186)
	    },
	    {
	        title: '서초구',
	        latlng: new kakao.maps.LatLng(37.483569, 127.032598)
	    }
	];
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	
	
	
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

// GPS 버튼 클릭시
function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      
	      let latitude  = position.coords.latitude;
	      let longitude = position.coords.longitude;
	      
	      overall(data, latitude, longitude);
	      
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





// 체크 박스를 선택하면 호출되는 함수입니다
function setOverlayMapTypeId() {
    var chkTerrain = document.getElementById('chkTerrain'),  
        chkTraffic = document.getElementById('chkTraffic'),
        chkBicycle = document.getElementById('chkBicycle'),
        chkUseDistrict = document.getElementById('chkUseDistrict');
    
    // 지도 타입을 제거합니다
    for (var type in mapTypes) {
        map.removeOverlayMapTypeId(mapTypes[type]);    
    }

    // 지적편집도정보 체크박스가 체크되어있으면 지도에 지적편집도정보 지도타입을 추가합니다
    if (chkUseDistrict.checked) {
        map.addOverlayMapTypeId(mapTypes.useDistrict);    
    }
    
    // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
    if (chkTerrain.checked) {
        map.addOverlayMapTypeId(mapTypes.terrain);    
    }
    
    // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
    if (chkTraffic.checked) {
        map.addOverlayMapTypeId(mapTypes.traffic);    
    }
    
    // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
    if (chkBicycle.checked) {
        map.addOverlayMapTypeId(mapTypes.bicycle);    
    }
    
}  



    
</script>
</body>
</html>