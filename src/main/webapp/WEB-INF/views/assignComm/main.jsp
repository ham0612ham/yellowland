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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">

function login() {
	location.href = "${pageContext.request.contextPath}/member/login";
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
	
	const fn = function(data) {
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}

</script>

<script>


function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#zip").value = data.zonecode;
           document.querySelector("#addr1").value =  data.address;
        }
    }).open();
}

function check() {
	
	const f = document.contactForm;
	
	if(! f.subject.value.trim()) {
		alert(" 제목을 입력해주세요! ");
		f.subject.focus();
		return false;
	}
	

	if(! f.pNum2.value.trim()) {
		alert(" 휴대폰 번호를 입력해주세요! ");
		f.pNum2.focus();
		return false;
	} else if(! f.pNum3.value.trim()) {
		alert(" 휴대폰 번호를 입력해주세요! ");
		f.pNum3.focus();
		return false;
	}
	
	if(! f.zip.value.trim()) {
		alert(" 우편 번호를 입력해주세요! ");
		f.zip.focus();
		return false;
	}
	
	if(! f.addr1.value.trim()) {
		alert(" 기본 주소를 입력해주세요! ");
		f.addr1.focus();
		return false;
	}
	
	if(! f.addr2.value.trim()) {
		alert(" 상세 주소를 입력해주세요! ");
		f.addr2.focus();
		return false;
	}
	
	if(! f.thumbnailFile.value.trim()) {
		alert(" 기본 이미지를 업로드해주세요! ");
		f.thumbnail.focus();
		return false;
	}
	
	if(! f.deposit.value.trim()) {
		alert(" 보증금을 입력해주세요! ");
		f.deposit.focus();
		return false;
	}
	
	if(! f.monthly.value.trim()) {
		alert(" 월세를 입력해주세요! ");
		f.monthly.focus();
		return false;
	}
	
	if(! f.expense.value.trim()) {
		alert(" 관리비를 입력해주세요! ");
		f.expense.focus();
		return false;
	}
	
	if(! f.area.value.trim()) {
		alert(" 전용면적을 입력해주세요! ");
		f.area.focus();
		return false;
	}
	
	
	if(! f.parking.value.trim()) {
		alert(" 주차 가능 여부를 입력해주세요! ");
		f.parking.focus();
		return false;
	}
	
	if(! f.elevator.value.trim()) {
		alert(" 엘리베이터 유무를 입력해주세요! ");
		f.elevator.focus();
		return false;
	}
	
	if(! f.transDate.value.trim()) {
		alert(" 양도 가능일을 입력해주세요! ");
		f.transDate.focus();
		return false;
	}
	
	
	f.action = "${pageContext.request.contextPath}/assignComm/submit";
	f.submit();
	
}

</script>

<script type="text/javascript">
// 메인 이미지
$(function() {
	let img = "${dto.thumbnail}";
	
	// 로컬에 이미지를 업로드 했다면
	if( img ) {
		
		// 메인이미지 로컬 저장 경로
		img = "${pageContext.request.contextPath}/uploads/image/" + img;
		
		// empty : 태그는 남기고 내용만 지움 
		$(".thumbnail-viewer").empty();
		$(".thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".thumbnail-viewer").click(function() {
		$("form[name=contactForm] input[name=thumbnailFile]").trigger("click");
	});
	
	// change : 값이 바뀔경우
	$("form[name=contactForm] input[name=thumbnailFile]").change(function() {
		
		let file = this.files[0];
		
		// 이미지 파일이 없을 경우
		if(! file) {
			$(".thumbnail-viewer").empty();
			
			if( img ) {
				
				if( img !== "${pageContext.request.contextPath}/resources/images/add_photo.png") {
					img = "${pageContext.request.contextPath}/uploads/image/" + img;
				}
				
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			
			$(".thumbnail-viewer").css("background-image", "url("+ img +")");
		
			return false;
		}
		
		// 이미지 파일이 아닌 경우 
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		let reader = new FileReader();
		
		// 파일의 내용을 다 읽었으면 
		reader.onload = function(e) {
			$(".thumbnail-viewer").empty();
			$(".thumbnail-viewer").css("background-image", "url("+ e.target.result +")");
		};
		
		reader.readAsDataURL( file );
		
	});
	
});

// 추가 이미지
$(function() {
	
	let sel_files = [];
	let count = 0;
	
	$("body").on("click", ".img-add", function() {
		$("form[name=contactForm] input[name=imgFiles]").trigger("click");
	});
	
	$("form[name=contactForm] input[name=imgFiles]").change(function(){
		
		
		
		// 현재 고른  파일이 없다면
		if(! this.files) {
			let dt = new DataTransfer();
			
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			// 기존 저장된 파일들 다시 저장
			document.contactForm.imgFiles.files = dt.files;
			
			return false;
			
		}
		
		// 유사 배열을 배열로 변환
		const fileArr = Array.from(this.files);
		
		
		
		fileArr.forEach((file, index) => {
			
			count++;
			
			if(count > 4) {
				alert(" 추가 이미지는 최대 4개까지 넣을 수 있습니다. ");
				count--;
				return false;
			}
			
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item"});
			$img.attr("data-filename", file.name);
			
			reader.onload = e => {
				$img.attr("src", e.target.result);
			};
			
			reader.readAsDataURL(file);
			$(".img-flex").append($img);
			
		});
		
		let dt = new DataTransfer();
		
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		document.contactForm.imgFiles.files = dt.files;
		
	});
	
	$("body").on("click", ".img-item", function() {
		if(! confirm("선택한 파일을 삭제하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				// splice : 원하는 위치에 요소를 추가하거나 삭제
				// splice(index, [0:추가,1:삭제], [0일 경우, 추가할 값])
				// i번째 요소 삭제
				sel_files.splice(i, 1);
				count--;
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		document.contactForm.imgFiles.files = dt.files;
		
		$(this).remove();
		
		
	});
	
});

</script>

<style>


.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:-660px;left:0;bottom:0;width:250px;height:490px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

#container {overflow:hidden;height:820px;position:relative;}
#mapWrapper {width:100%; height:700px; z-index:1; display: flex;}
#rvWrapper {width:33%;height:300px;top:0;right:0;position:absolute;z-index:0;}
#container.view_roadview #mapWrapper {width: 100%;}
#roadviewControl {position:absolute;top:2px;right: 520px;width:42px;height:42px;z-index: 1;cursor: pointer; background: url(https://t1.daumcdn.net/localimg/localimages/07/2018/pc/common/img_search.png) 0 -450px no-repeat;}
#roadviewControl.active {background-position:0 -350px;}
#close {position: absolute;padding: 4px;top: 5px;left: 5px;cursor: pointer;background: #fff;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;}
#close .img {display: block;background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;width: 14px;height: 14px;}

#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}

.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

body {
	font-family: Pretendard-Regular, sans-serif;
}

.thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #f5fffa;
	width: 50px; height: 50px; border-radius: 10px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}

.img-flex {
	display: flex;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.img-flex .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	cursor: pointer;
}

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

.float{
	position:fixed;
	width:60px;
	height:60px;
	bottom:40px;
	right:40px;
	background-color:#36C88A;
	color:#FFF;
	border-radius:50px;
	text-align:center;
	box-shadow: 2px 2px 3px #999;
}

.float:hover {
	font-weight: bold;
}

.my-float{
	margin-top:22px;
}

.modal{
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

body{
	width:100%;
	height:100vh;
}

.modal-content {
	right: 250px; 
	width: 1000px; 
	height: 880px;
}

.modal-footer {
	margin-bottom: 292px;
    position: absolute;
    left: 820px;
    bottom: -213px;
    border: none;
}

.info-wrap .dbox .icon span {
    font-size: 20px;
    color: #fff;
}

.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.heading-section {
	margin-top: -95px;
}

input {
	
	margin-bottom: 10px;
}


.ck {
	height: 300px;
}

#subject {
    margin-top: -29px;
    margin-left: -127px;
    width: 513px;
    margin-bottom: -5px;
   
}

#mainImg {
	display: flex;
}

#subImg {
	display: flex;
    margin-left: -93px;
}

#mainImg > label, #subImg > label {
    width: 90px;
    text-align: center;
}

#mainImg > input, #subImg > input {
	width: 46px;
}

.wrapper {
	margin-top: -45px;
}

#phone {
    box-shadow: 0px 0px 10px rgb(0 0 0 / 20%);
    width: 300px;
    padding-top: 12px;
    background: white;
    margin-left: 20px;
    min-height: 50px;
    border-radius: 15px;
    padding-bottom: 12px;
    margin-bottom: 50px;
}

p {
	align-self: center;
}

ul {
	padding-left: 0;
}

.sub {
	margin-top: 12px;
}

.sub > input {
    width: 52px;
	height: 25px;
}

.sub > select {
    height: 24px;
}

.parking {
	width: 35px;
}

.unit {
	margin-left: 5px;
}


.body-container {
	margin-top: 50px; width: 320px;
}

.assign-list {
	display: flex;
	padding-top: 15px;
    padding-bottom: 12px;
    border-bottom: 1px solid lightgray;
    padding-left: 20px;
}

.assign-list:hover {
	background-color: rgba(204, 204, 204, 0.7);
}

.assign-class {
	width: 24%;
}

.assign-count {
	text-align: center;
	margin-bottom: 25px;
	font-weight: 600;
}

.assign-img {
	width: 135px;
    height: 117px;
    border-radius: 7px;
}

.assign-set {
    margin-left: 10px;
}

.monthly {
	font-weight: bold;
}

</style>
</head>
<body>
<div id="container">
    <div id="rvWrapper" style="display: none;">
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
        <div class="assign-class">
        	<div class="assign-count">지역 목록 5개</div>
			<ul>
				<c:forEach var="dto" items="${list}">
					<li class="assign-list"> <!-- href="${pageContext.request.contextPath}/assignComm/detail?num=${dto.num}" -->
						<a class="detail-list" onclick="detailPage(${dto.num});">눌러봐</a>
						<div><img class="assign-img" src="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}"></div>
						<div class="assign-set">
							<div class="monthly"> 월세: ${dto.deposit}/${dto.monthly}</div>
							<div>${dto.expense}</div>
							<div>${dto.area}</div>
							<div>${dto.transDate}</div>
							<div>${dto.subject}</div>
						</div>
					</li>
				</c:forEach>
				<li>
					<div id="asDetail"></div>
				</li>
			</ul>
		</div>
    </div>
    <div class="map_wrap">
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form onsubmit="searchPlaces(); return false;">
	                    키워드 : <input type="text" id="keyword" size="15" placeholder="ex) 홍대맛집"> 
	                    <button class="btn btn-primary" type="submit">검색하기</button> 
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
	    <ul id="category">
	        <li id="BK9" data-order="0"> 
	            <span class="category_bg bank"></span>
	            	은행
	        </li>       
	        <li id="MT1" data-order="1"> 
	            <span class="category_bg mart"></span>
	            	마트
	        </li>  
	        <li id="PM9" data-order="2"> 
	            <span class="category_bg pharmacy"></span>
	           	 	약국
	        </li>  
	        <li id="OL7" data-order="3"> 
	            <span class="category_bg oil"></span>
	           		 주유소
	        </li>  
	        <li id="CE7" data-order="4"> 
	            <span class="category_bg cafe"></span>
	            	카페
	        </li>  
	        <li id="CS2" data-order="5"> 
	            <span class="category_bg store"></span>
	            	편의점
	        </li>      
    	</ul>
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

<div>
	<a class="float" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-plus my-float"></i></a>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상가 양도 작성 폼</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<div class="container">
	        	<form method="post" id="contactForm" name="contactForm" class="contactForm" enctype="multipart/form-data">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row no-gutters">
								<div style="margin-top: -20px;" class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
									<div class="contact-wrap w-100 p-md-5 p-4">
											<div class="row">
												<div class="row justify-content-center">
													<div class="col-md-6 text-center mb-5">
														<input type="text" class="form-control" name="subject" id="subject" placeholder="제목" value="${dto.subject}">
													</div>
												</div>
									          	<div style="margin-top: -25px; display: flex; margin-bottom: 13px;">
										          	<div class="col-md-6">
														<div class="form-group" id="mainImg">
															<label class="label" for="thumbnailFile">대표 이미지</label>
															<div class="thumbnail-viewer"></div>
															<input type="file" class="form-control" name="thumbnailFile" id="thumbnail" accept="image/*" 
																value="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}" style="display: none;">
														</div>
													</div>
													
													<div class="col-md-10">
														<div class="form-group" id="subImg">
															<label class="label" for="imgName">추가 이미지</label>
															<div class="img-flex">
																<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
															</div>
															<input type="file" class="form-control" name="imgFiles" id="imgName" accept="image/*" multiple="multiple" 
																value="${pageContext.request.contextPath}/uploads/image/${dto.imgName}" style="display: none;">
														</div>
													</div>
												</div>
									          	<p style="margin-bottom: 0; margin-left: 8px;">위치정보</p>
												<div class="col-md-6">
													<div class="form-group" style="display: flex;">
														<input type="text" class="form-control" name="zip" id="zip" placeholder="우편번호" value="${dto.zip}">
														<input class="btn btn-primary" style="margin-left: 3px;" type="button" value="우편번호찾기" onclick="kakaopost()">
													</div>
												</div>
												
												<div class="col-md-12">
													<div class="form-group">
														<input type="text" class="form-control" name="addr1" id="addr1" placeholder="기본 주소" value="${dto.addr1}">
													</div>
												</div>
												
												<div class="col-md-12">
													<div class="form-group">
														<input type="text" class="form-control" name="addr2" id="addr2" placeholder="상세 주소" value="${dto.addr2}">
													</div> 
												</div>
												
												<div class="col-md-12">
													<div style="margin-top: 10px;" class="form-group">
														<label class="label" for="editor" style="margin-left: 8px;">상세설명</label>
														<textarea name="content" class="form-control" id="editor" cols="30" rows="4"  
															placeholder="소개하고 싶은 상가에 대한 설명과 특징을 입력해주세요. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#13;&#10;
																		상가의 위치와 교통 및 주변 시설 등 전체적인 상가의 느낌 등을 작성해주세요.">${dto.content}</textarea>
													</div>
												</div>
												
											</div>
										  <script>
										    
										    // 에디터를 화면에 붙일때 작성공간인 textarea값이나 div의 id로 가져온다.
										         ClassicEditor
										            .create( document.querySelector( '#editor' ), {
										                language: 'ko' //언어설정
										            })
												.then( editor => {
													theEditor = editor; // #contents에 있는 값을 theEditor에 넣어놓는다.
												} )
										            .catch( error => {
										                console.error( error );
										            } );
											
										    // 나중에 확인 할 때 소스
										        var sHTML = theEditor.getData();
										        console.log(sHTML); 
										        
										</script>
										
									</div>
								</div>
								<div class="col-lg-4 col-md-5 d-flex align-items-stretch">
									<div id="phone" class="info-wrap w-100 p-md-5 p-4">
							        	
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 216px;">보증금</p>
															<input type="text" class="form-control" name="deposit" id="deposit" value="${dto.deposit}">
															<p class="unit" style="width: 85px;">만원</p>
														</div>
													</div>
									          	</div>
								          	</div>
								        	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 216px;">월세</p>
															<input type="text" class="form-control" name="monthly" id="monthly" value="${dto.monthly}">
															<p class="unit" style="width: 85px;">만원</p>
														</div>
													</div>
									          	</div>
								          	</div>
								        	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 216px;">관리비</p>
															<input type="text" class="form-control" name="expense" id="expense" value="${dto.expense}">
															<p class="unit" style="width: 85px;">만원</p>
														</div>
													</div>
									          	</div>
								          	</div>
								        	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex; ">
								        					<p style="width: 216px;">전용면적</p>
															<input type="text" class="form-control" name="area" id="area" value="${dto.area}">
															<p class="unit" style="width: 85px;">㎡</p>
														</div>
													</div>
									          	</div>
								          	</div>
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 211px;">건물 층</p>
																<select name="bFloor">
																	<option value="1">1층</option>
																	<option value="2">2층</option>
																	<option value="3">3층</option>
																	<option value="4">4층</option>
																	<option value="5">5층</option>
																	<option value="6">6층</option>
																	<option value="7">7층</option>
																	<option value="8">8층</option>
																	<option value="9">9층</option>
																	<option value="10">10층</option>
																	<option value="11">11층</option>
																	<option value="12">12층</option>
																	<option value="13">13층</option>
																	<option value="14">14층</option>
																	<option value="15">15층</option>
																	<option value="16">16층</option>
																	<option value="17">17층</option>
																	<option value="18">18층</option>
																	<option value="19">19층</option>
																	<option value="20">20층</option>
																</select>
															<p class="unit" style="width: 85px;">㎡</p>
														</div>
														<div class="sub" style="display: flex;">
								        					<p style="width:211px;">해당 층</p>
																<select name="floor">
																	<option value="1">1층</option>
																	<option value="2">2층</option>
																	<option value="3">3층</option>
																	<option value="4">4층</option>
																	<option value="5">5층</option>
																	<option value="6">6층</option>
																	<option value="7">7층</option>
																	<option value="8">8층</option>
																	<option value="9">9층</option>
																	<option value="10">10층</option>
																	<option value="11">11층</option>
																	<option value="12">12층</option>
																	<option value="13">13층</option>
																	<option value="14">14층</option>
																	<option value="15">15층</option>
																	<option value="16">16층</option>
																	<option value="17">17층</option>
																	<option value="18">18층</option>
																	<option value="19">19층</option>
																	<option value="20">20층</option>
																</select>
															<p class="unit" style="width: 85px;">㎡</p>
														</div>
													</div>
									          	</div>
								          	</div>
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex; width: 195px;">
								        					<p style="width:45px; margin-right: 34px;">주차</p>
															<input style="width: 14px;" type="radio" name="parking" value="1"><p style="width: 45px;">가능</p>
															<input style="width: 14px;" type="radio" name="parking" value="0"><p style="width: 45px;">없음</p>
														</div>
														<div class="sub" style="display: flex; width: 195px; margin-bottom: 1px;">
								        					<p style="width: 80px;">엘리베이터</p>
															<input style="width: 14px;" type="radio" name="elevator" value="1"><p style="width: 45px;">있음</p>
															<input style="width: 14px;" type="radio" name="elevator" value="0"><p style="width: 45px;">없음</p>
														</div>
													</div>
									          	</div>
								          	</div>
								          	<div class="dbox w-100 d-flex align-items-start" style="margin-bottom: 10px;">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<p style="width: 75px; margin-bottom: 1px;">양도가능일</p>
								        				<div class="sub" style="display: flex; width: 172px; margin-top: 2px;">
															<input style="width: 227px;" type="date" class="form-control" name="transDate" value="${dto.transDate}">
														</div>
													</div>
									          	</div>
								          	</div>
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<p style="width:125px; margin-bottom: 1px;">연락처</p>
								        				<div class="sub" style="display: flex; margin-top: 2px;">
								        					<select name="pNum1">
								        						<option value="010">010</option>
								        						<option value="02">02</option>
								        						<option value="011">011</option>
								        						<option value="016">016</option>
								        						<option value="017">017</option>
								        						<option value="018">018</option>
								        						<option value="019">019</option>
								        					</select> -
															<input style="width:63px;" type="text" class="form-control" name="pNum2" value="${dto.pNum2}"> -
															<input style="width:63px;" type="text" class="form-control" name="pNum3" value="${dto.pNum3}">
														</div>
													</div>
									          	</div>
								          	</div>
						          </div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" onclick="check();" class="btn btn-primary">작성완료</button>
		      	</div>
			</form>
		</div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${daumKey}&libraries=services,clusterer"></script>

<script>

window.onload = function() {
	overall();
}

function search() {
	let data = document.getElementById("data").value;
	
	overall(data);
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
    $.get('${pageContext.request.contextPath}/resources/jsonData/borough.json', function(data) {
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
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
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



</body>
</html>