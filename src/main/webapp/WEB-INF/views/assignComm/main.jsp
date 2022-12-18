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

#container {overflow:hidden;height:820px;position:relative;}
#mapWrapper {width:100%; height:700px; z-index:1;}
#rvWrapper {width:33%;height:300px;top:0;right:0;position:absolute;z-index:0;}
#container.view_roadview #mapWrapper {width: 100%;}
#roadviewControl {position:absolute;top:2px;left:1120px;width:42px;height:42px;z-index: 1;cursor: pointer; background: url(https://t1.daumcdn.net/localimg/localimages/07/2018/pc/common/img_search.png) 0 -450px no-repeat;}
#roadviewControl.active {background-position:0 -350px;}
#close {position: absolute;padding: 4px;top: 5px;left: 5px;cursor: pointer;background: #fff;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;}
#close .img {display: block;background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;width: 14px;height: 14px;}

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
	margin-bottom: 10px;
	margin-top: -5px;
}

#clickLatlng {
	float: right;
}

</style>
</head>
<body>
<div id="container">
    <div id="rvWrapper">
        <div id="roadview" style="width:100%;height:100%;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
    </div>
    <div id="mapWrapper">
        <div id="map" style="width:76%; height:800px; position: relative;">
			<div class="search">
				<input type="text" id="data" placeholder="ex)마포구 월드컵북로 21">
				<i onclick="search();" class="fa-solid fa-magnifying-glass" style="cursor: pointer;"></i>
				<i onclick="getLocation();" class="fa-solid fa-location-crosshairs" style="cursor: pointer;"></i>
			    <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
			        <i class="fa-regular fa-circle-question" style="color: black;"></i>
			    </a>
			</div>
		</div>
        <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
    </div>
</div>

<div>
	<div class="mapType">
	    <input type="checkbox" id="chkUseDistrict" onclick="setOverlayMapTypeId()" /> 지적편집도 정보 보기
	    <input type="checkbox" id="chkTerrain" onclick="setOverlayMapTypeId()" /> 지형정보 보기 
	    <input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 교통정보 보기       
	    <input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
	</div>
	<div id="clickLatlng"></div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=키를입력하세요&libraries=services"></script>
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
	
	var overlayOn = false, // 지도 위에 로드뷰 오버레이가 추가된 상태를 가지고 있을 변수
    container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
    mapContainer = document.getElementById('map'), // 지도를 표시할 div 입니다 
    rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div 입니다
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapCenter = new kakao.maps.LatLng(lat, lon),
    mapOption = {
        center: mapCenter, // 지도의 중심좌표  37.5062528, 126.73024
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
	// var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	var imageSrc = "${pageContext.request.contextPath}/resources/images/marker_blue.png"; 

	
	for (var i = 0; i < positions.length; i++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    // var imageSize = new kakao.maps.Size(24, 35); 
   	    var imageSize = new kakao.maps.Size(35, 40); 

	    
	    // 마커 이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage, // 마커 이미지 
	        clickable: true
	    });
	    
	 	// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		     alert("자치구입니다");
		});
	}
	
	// 로드뷰 객체를 생성합니다 
	rv = new kakao.maps.Roadview(rvContainer); 

	// 좌표로부터 로드뷰 파노라마 ID를 가져올 로드뷰 클라이언트 객체를 생성합니다 
	rvClient = new kakao.maps.RoadviewClient(); 
	
	// 로드뷰에 좌표가 바뀌었을 때 발생하는 이벤트를 등록합니다 
	kakao.maps.event.addListener(rv, 'position_changed', function() {

	    // 현재 로드뷰의 위치 좌표를 얻어옵니다 
	    var rvPosition = rv.getPosition();

	    // 지도의 중심을 현재 로드뷰의 위치로 설정합니다
	    map.setCenter(rvPosition);

	    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태이면
	    if(overlayOn) {
	        // 마커의 위치를 현재 로드뷰의 위치로 설정합니다
	        marker.setPosition(rvPosition);
	    }
	});
	
	// 마커 이미지를 생성합니다
	var markImage = new kakao.maps.MarkerImage(
	    'https://t1.daumcdn.net/localimg/localimages/07/2018/pc/roadview_minimap_wk_2018.png',
	    new kakao.maps.Size(26, 46),
	    {
	        // 스프라이트 이미지를 사용합니다.
	        // 스프라이트 이미지 전체의 크기를 지정하고
	        spriteSize: new kakao.maps.Size(1666, 168),
	        // 사용하고 싶은 영역의 좌상단 좌표를 입력합니다.
	        // background-position으로 지정하는 값이며 부호는 반대입니다.
	        spriteOrigin: new kakao.maps.Point(705, 114),
	        offset: new kakao.maps.Point(13, 46)
	    }
	);

	// 드래그가 가능한 마커를 생성합니다
	markerView = new kakao.maps.Marker({
	    image : markImage,
	    position: mapCenter,
	    draggable: true
	});

	// 마커에 dragend 이벤트를 등록합니다
	kakao.maps.event.addListener(markerView, 'dragend', function(mouseEvent) {

	    // 현재 마커가 놓인 자리의 좌표입니다 
	    var position = markerView.getPosition();

	    // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
	    toggleRoadview(position);
	});

	//지도에 클릭 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent){
	    
	    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
	    if(!overlayOn) {
	        return;
	    }

	    // 클릭한 위치의 좌표입니다 
	    var position = mouseEvent.latLng;

	    // 마커를 클릭한 위치로 옮깁니다
	    markerView.setPosition(position);

	    // 클락한 위치를 기준으로 로드뷰를 설정합니다
	    toggleRoadview(position);
	});

	
	
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

//전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
// 로드뷰를 설정하는 함수입니다
function toggleRoadview(position){
    rvClient.getNearestPanoId(position, 50, function(panoId) {
        // 파노라마 ID가 null 이면 로드뷰를 숨깁니다
        if (panoId === null) {
            toggleMapWrapper(true, position);
        } else {
         toggleMapWrapper(false, position);

            // panoId로 로드뷰를 설정합니다
            rv.setPanoId(panoId, position);
        }
    });
}

// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
function toggleMapWrapper(active, position) {
    if (active) {

        // 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
        container.className = '';

        // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
        map.relayout();

        // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
        map.setCenter(position);
    } else {

        // 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
        // 로드뷰가 함께 표시되게 합니다
        if (container.className.indexOf('view_roadview') === -1) {
            container.className = 'view_roadview';

            // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
            map.relayout();

            // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
            map.setCenter(position);
        }
    }
}

// 지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수입니다
function toggleOverlay(active) {
    if (active) {
        overlayOn = true;

        // 지도 위에 로드뷰 도로 오버레이를 추가합니다
        map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

        // 지도 위에 마커를 표시합니다
        markerView.setMap(map);

        // 마커의 위치를 지도 중심으로 설정합니다 
        markerView.setPosition(map.getCenter());

        // 로드뷰의 위치를 지도 중심으로 설정합니다
        toggleRoadview(map.getCenter());
    } else {
        overlayOn = false;

        // 지도 위의 로드뷰 도로 오버레이를 제거합니다
        map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

        // 지도 위의 마커를 제거합니다
        markerView.setMap(null);
    }
}

// 지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수입니다
function setRoadviewRoad() {
    var control = document.getElementById('roadviewControl');

    // 버튼이 눌린 상태가 아니면
    if (control.className.indexOf('active') === -1) {
        control.className = 'active';

        // 로드뷰 도로 오버레이가 보이게 합니다
        toggleOverlay(true);
    } else {
        control.className = '';

        // 로드뷰 도로 오버레이를 제거합니다
        toggleOverlay(false);
    }
}

// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
function closeRoadview() {
    var position = marker.getPosition();
    toggleMapWrapper(true, position);
}



    
</script>
</body>
</html>