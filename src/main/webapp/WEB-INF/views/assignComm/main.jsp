<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/assign-main.css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">



function login() {
	location.href = "${pageContext.request.contextPath}/member/login";
}

function loginCheck() {
	let session = '<%=session.getAttribute("member")%>';
	
	if(session === "null") {
		alert(" 로그인이 필요한 서비스입니다! ");
		
		login();
	} 
	
}




function ajaxFun(url, method, query, dataType, fn) {
	
	$.ajax({
		type : method,
		url  : url,
		data : query,
		dataType : dataType,
		
		success : function(data) {
			fn(data);
		},
		
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		
		error : function(jqXHR) {
			// 403 : 원하는 URL이 유효하지만 사용자의 요청을 이행 할 수 없음을 의미
			if(jqXHR.status === 403) {
				login();
				
				return false;
				
			} else if(jqXHR.status === 400) {
				
				alert("요청 처리가 실패했습니다.");
				
				return false;
			}
		
			console.log(jqXHR.responseText);
		}
			
	});
	
}

function ajaxFileFun(url, method, query, dataType, fn) {
	$.ajax({
		type : method,
		url  : url,
		processData : false, // 서버로 전송하는 데이터를 쿼리문자열로 변환 여부
		contentType : false, // 서버에 전송할 데이터의 Content-Type.
		data : query,
		dataType : dataType,
		
		success : function(data) {
			fn(data);
		},
		
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		
		error : function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				
				return false;
			}
			
			console.log(jqXHR.responseText);
		}
		
	});
}

function detailPage(num) {
	let url = "${pageContext.request.contextPath}/assignComm/detail";
	let query = "num=" + num;
	let selector = "#asDetail";
	
	document.querySelector(".assign-ul").style.display = "none";
	
	const fn = function(data) {
		$(selector).html(data);
		dtoJsonDetail(num);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


function dtoJsonDetail(num) {
	
	let url = "${pageContext.request.contextPath}/assignComm/dtoJsonDetail";
	let query = "num=" + num;
	
	const fn = function(data) {
		
		$("#asDetail2").html(data);
		
		let ub = document.querySelector(".my-update");
		ub.setAttribute('data-bs-toggle', 'modal');
		ub.setAttribute('data-bs-target', '#updateModal');
	};
	
	ajaxFun(url, "get", query, "html", fn);
		
}



function myList() {

	let url = "${pageContext.request.contextPath}/assignComm/myList";
	let userId = "${sessionScope.member.userId}";
	let query = "userId=" + userId;
	let selector = "#asDetail";
	
	document.querySelector(".assign-ul").style.display = "none";
	
	
	const fn = function(data) {
		
		$(selector).html(data);	
	
	}

	 ajaxFun(url, "get", query, "html", fn);
}

</script>





<div id="container">
    <div id="rvWrapper" style="display: none;">
        <div id="roadview" style="width:100%;height:100%;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
    </div>
    <div id="mapWrapper">
        <div id="map">
			<div class="search">
				<div>주소 검색</div>
				<input type="text" id="data" placeholder="ex) 마포구 월드컵북로 21">
				<button id="aSearch" class="btn btn-primary" onclick="search();" type="button"><i class="fa-solid fa-magnifying-glass searchBtn-cls"></i></button> 
			</div>
		</div>
		<div class="tri-menu">
	        <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
	        <div>
	        	<img class="gps" style="right: 568px;" onclick="getLocation();" src="${pageContext.request.contextPath}/resources/images/gps.png" alt="gps" style="cursor: pointer;">
		    </div>
		    <div>
		    	<!-- javascript:void(0) : a태그의 페이지 전환 무효화 -->
		    	<a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
		    		<img class="gps" src="${pageContext.request.contextPath}/resources/images/question.png" alt="question">
			    </a>
		    </div>
	    </div>
        <div class="assign-class">
			<ul class="assign-ul">
				<li class="assign-count">지역 목록 ${count}개</li>
				<c:if test="${!empty sessionScope.member.userId}">
					<li class="my-title"><button type="button" onclick="myList();" class="btn btn-primary">내 게시글</button></li>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<li class="assign-list" onclick="detailPage(${dto.num});"> 
						<div><img class="assign-img" src="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}"></div>
						<div class="assign-set">
							<div class="transDate-div">양도 가능일 ${dto.transDate}</div>
							<div class="monthly"> 월세 ${dto.deposit}/${dto.monthly}
							&emsp;&emsp;&emsp;&emsp;&emsp;
							</div>
							<div class="expense-div">관리비 ${dto.expense}만원</div>
							<div class="area-div">전용면적 ${dto.area}㎡</div>
							<div class="subject-div">${dto.subject}</div>
						</div>
					</li>
				</c:forEach>
				<li><div id="zero">${count == 0 ? " 게시물이 존재하지 않거나 삭제되었습니다. " : ""}</div></li>
			</ul>
			<div id="asDetail" style="overflow: auto; height: 800px;"></div>
			<div id="asDetail2" style="overflow: auto; height: 800px;"></div>
		</div>
    </div>
    
   
    
    <div class="map_wrap">
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form class="search-form" onsubmit="searchPlaces(); return false;">
	                	<div>키워드 검색</div>
	                    <input type="text" id="keyword" size="15" placeholder="ex) 홍대맛집"> 
	                    <button id="kSearch" class="btn btn-primary" type="submit"><i class="fa-solid fa-magnifying-glass searchBtn-cls"></i></button> 
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
	    
	    <div id="maps-div">
	    <div class="mapInfo">
	    	<div class="mapType d-flex justify-content-around">
	    		<div><i class="fa-solid fa-mound mapInfo-images"></i>&nbsp; <span class="mapInfo-title"> 지형정보</span> <input type="checkbox" id="chkTerrain" onclick="setOverlayMapTypeId()" /></div>
			    <div><i class="fa-solid fa-mountain-city mapInfo-images"></i>&nbsp; <span class="mapInfo-title"> 지적편집도</span> <input type="checkbox" id="chkUseDistrict" onclick="setOverlayMapTypeId()" /></div>
			</div>
			<div class="mapType d-flex justify-content-around">
			   <div><i class="fa-solid fa-car-side mapInfo-images"></i>&nbsp; <span class="mapInfo-title"> 교통정보</span>  <input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /></div>  
			   <div><i class="fa-solid fa-person-biking mapInfo-images"></i>&nbsp; <span class="mapInfo-title"> 자전거도로</span> <input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /></div>  
			</div>
			<div id="clickLatlng"></div>
	    </div>
	    
	    <ul id="category">
	        <li id="BK9 category-images" data-order="0"> 
	            <span class="bank category-images"><i class="fa-solid fa-piggy-bank" style="margin-right: 5px;"></i></span>
	            	은행
	        </li>       
	        <li id="MT1" data-order="1"> 
	            <span class="mart category-images"><i class="fa-solid fa-store" style="margin-right: 5px;"></i></span>
	            	마트
	        </li>  
	        <li id="PM9" data-order="2"> 
	            <span class="pharmacy category-images"><i class="fa-solid fa-hospital" style="margin-right: 5px;"></i></span>
	           	 	약국
	        </li>  
	        <li id="OL7" data-order="3"> 
	            <span class="oil category-images"><i class="fa-solid fa-oil-can"></i></span>
	           		 주유소
	        </li>  
	        <li id="CE7" data-order="4"> 
	            <span class="cafe category-images"><i class="fa-solid fa-mug-hot"></i></span>
	            	카페
	        </li>  
	        <li id="CS2" data-order="5"> 
	            <span class="store category-images"><i class="fa-solid fa-bottle-water"></i></span>
	            	편의점
	        </li>      
    	</ul>
    	</div>
    </div>
</div>


<div
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_mqxeixj"
  data-title="question"
  data-size="small"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>
<div id="result"></div>

<div>
	<a class="float" onclick="loginCheck();" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-plus my-float"></i></a>
</div>

<jsp:include page="/WEB-INF/views/assignComm/insertForm.jsp"/>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${daumKey}&libraries=services,clusterer"></script>

<script>

window.onload = function() {
	overall();
}

function search() {
	let data = document.getElementById("data").value;
	
	overall(data);
}

function updateList(swLatlng, neLatlng) {
	
	let swLat = swLatlng.substring(1, swLatlng.indexOf(','))
	let swLng = swLatlng.substring(swLatlng.indexOf(',') + 2, swLatlng.indexOf(')'))
	let neLat = neLatlng.substring(1, neLatlng.indexOf(','))
	let neLng = neLatlng.substring(neLatlng.indexOf(',') + 2, neLatlng.indexOf(')'))
	
	// alert('swLat : ' + swLat + ' swLng : ' + swLng);
	// alert('neLat : ' + neLat + ' neLng : ' + neLng);
	
	let url = '${pageContext.request.contextPath}/assignComm/updateList';
	let query = 'swLat=' + swLat + "&swLng=" + swLng + "&neLat=" + neLat + "&neLng=" + neLng;
	
	
	const fn = function(data) {
		console.log("적용완료");
		
	    let assignClass = document.querySelector('.assign-class');
	   
	    assignClass.innerHTML = '';
	    assignClass.innerHTML = data;
	};
	
	ajaxFun(url, 'get', query, 'html', fn);
}

var markers = [];

function overall(data, latitude, longitude) {
	
	let lat = latitude  ? latitude : 37.5642135;
	let lon = longitude ? longitude : 127.0016985;
	
	var overlayOn = false, // 지도 위에 로드뷰 오버레이가 추가된 상태를 가지고 있을 변수
    container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
    mapContainer = document.getElementById('map'), // 지도를 표시할 div 입니다 
    rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div 입니다
	
    placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	// markers = [], // 마커를 담을 배열입니다
	currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
    
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapCenter = new kakao.maps.LatLng(lat, lon),
    mapOption = {
        center: mapCenter, // 지도의 중심좌표  37.5062528, 126.73024
        level: 9 // 지도의 확대 레벨
    };  
    
	// 지도를 생성합니다    
	map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'dragend', function() {             
	    
	    // 지도 영역정보를 얻어옵니다 
	    var bounds = map.getBounds();
	    
	    // 영역정보의 남서쪽 정보를 얻어옵니다 
	    var swLatlng = bounds.getSouthWest().toString();
	    
	    // 영역정보의 북동쪽 정보를 얻어옵니다 
	    var neLatlng = bounds.getNorthEast().toString();
	    
	    
	    updateList(swLatlng, neLatlng);
	   
	});
	
	// 장소 검색 객체를 생성합니다
	ps = new kakao.maps.services.Places(map);

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchCategory);


	//커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	//커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	//지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	//커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	//각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();
	
	
	
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
	
	
	


    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
    // disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 4, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    });

    
	
	// 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get('${pageContext.request.contextPath}/resources/jsonData/positions.json', function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	    var markersGu = $(data.positions).map(function(i, position) {
	           return new kakao.maps.Marker({
	               position : new kakao.maps.LatLng(position.lat, position.lng)
	           });
	        });

    // 클러스터러에 마커들을 추가합니다
     	clusterer.addMarkers(markersGu);
    });

    // 마커 클러스터러에 클릭이벤트를 등록합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    });
	
	
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
			// alert("위도: "+ result[0].y +"경도: "+ result[0].x);
	        
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infoSearch = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + data +'</div>'
	        });
	        infoSearch.open(map, marker);
	
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
	document.getElementById("rvWrapper").style.display = "block";
	
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
        
        document.getElementById("rvWrapper").style.display = "none";
    }
}

// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
function closeRoadview() {
	
    var position = marker.getPosition();
    toggleMapWrapper(true, position);
}




//엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
 if (target.addEventListener) {
     target.addEventListener(type, callback);
 } else {
     target.attachEvent('on' + type, callback);
 }
}

//카테고리 검색을 요청하는 함수입니다
function searchCategory() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCG, {useMapBounds:true}); 
}

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;
    
    infoKeyword = new kakao.maps.InfoWindow({zIndex:1});

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCG(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayCategory(data);

        // 페이지 번호를 표출합니다
        // displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

//지도에 마커를 표출하는 함수입니다
function displayCategory(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarkerCG(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

function addMarkerCG(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

//클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}



//각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() { 
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

//카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

//클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 

//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infoKeyword.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
            	infoKeyword.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <div style="font-size: 16px; font-weight:600;">' + places.place_name + '</div>';

    if (places.road_address_name) {
        itemStr += '    <span class="text-truncate">' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray text-truncate">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과(키워드 검색) 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infoKeyword.setContent(content);
    infoKeyword.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

    
</script>

<script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
    js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
    js.crossOrigin = 'anonymous';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>

