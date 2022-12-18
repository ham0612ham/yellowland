<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.header-white { 
	background: white; height: 60px; width: 100%; margin: 0px; 
	position: absolute; top: 0px; z-index: -1;
}
body { height: 60px; }
main { width: 320px; }
.container { padding-left: 0px; width: 320px; margin-left: 0px; }
.body-container {
	margin-top: 50px; width: 320px;
}
footer { display: none; }
.check-area { 
	box-shadow: 0px 0px 10px rgb(0, 0, 0, 0.2); width: 300px; 
	padding-top: 12px; background: white; margin-left: 20px;
	min-height: 50px; border-radius: 15px; padding-bottom: 12px; margin-bottom: 15px; 
}
input[type=checkbox], input[type=radio] { display: none; }
label, .div-4 {
	display: block; border-radius: 12px; margin: 0 auto; text-align: center; color: #000;
}
input[type=checkbox]:checked+label, input[type=radio]:checked+label { background: #36C88A; color: white; border: 0.5px solid #36C88A; }
input[type=checkbox]:checked+label:hover, input[type=radio]:checked+label:hover { background: #18BD77; color: white; border: 0.5px solid #18BD77; }
input[type=checkbox]:hover+label, input[type=radio]:hover+label { color: #36C88A; border: 0.5px solid #36C88A; }
label:hover { color: #18BD77; cursor: pointer; }
input[type=checkbox]+label, input[type=radio]+label { background: white; color: #A3A6AD; border: 0.5px solid #A3A6AD; }
.div-2 { 
	width: 45%; margin: 3px; padding: 6px; font-size: 12px;
	margin-top: 12px; font-weight: 600;
}
.div-4 { 
	width: 21.3%; margin: 3px; padding: 17px 6px; font-size: 12px;
	font-weight: 600; margin-top: 7px;
}
.selectGu, .selectWork { 
	width: 92%; color: #000; border-radius: 12px;
	border: 0.5px solid #A3A6AD; font-size: 14px; margin: auto;
}
.title {
	margin: 0 0 10px 16px; font-weight: 800; 
	color: #36C88A; font-size: 18px; }
.select-title { font-size: 13px; margin-left: 16px; font-weight: 600; padding-top: 5px; }
.div-3 { width: 29.7%; margin: 3px; padding: 6px; font-size: 12px;
	margin-top: 2px; font-weight: 600; }
.hideSel { display: none; }
#map { z-index: -2; width: 100vw; height: 100vh; position: absolute; top: 0px; }
#analysis { 
	position: absolute; min-width: 500px; height: calc(100vh - 60px); 
	overflow: scroll; background: white; margin-left: 100%;
	right: 0px; top: 60px;
}
#green-div { background: #36C88A; height: 40px; width: 100%; padding-right: 10px; padding-left: 10px;}
#green-div > span { color: white; font-size: 16px; margin: auto; }
.marker { 
	width: 80px; height: 80px; background: rgb(54,200,138,0.3);
	border-radius: 40px; padding-top: 8px; position: relative;
}
.marker-region-name { 
	font-size: 11px; background: #36C88A; border-radius: 5px; margin: auto;
	color: white; text-align:center; padding:1px; width: 60px; margin-top: -17px;
}
.marker-sales-total { 
	font-size: 11px; background: white; border-radius: 5px; margin: auto;
	color: #36C88A; text-align:center; padding:1px; width: 60px; margin-top: 2px;
}
.marker-rank { 
	text-align: center; position: relative;  margin-bottom: 5px; top: -16px;
}
.marker-rank-img { margin: auto; text-align:center; }
.marker-rank-text { 
	color: #36C88A; font-weight: 600; font-size: 12px; text-align: center;
	position: absolute; top: 13%; left: 45%;
}
#btn-x { width: 16px; padding-bottom: 3px; }
#btn-x:hover { cursor: pointer; }
.rank-title { font-size: 13px; margin: 0 16px; font-weight: 600; padding-top: 5px; }
.hole-rank-title { font-size: 13px; margin-left: 16px; font-weight: 600; padding-top: 5px; color: #36C88A; }
.hole-rank-quarter { font-size: 11px; margin-right: 16px; font-weight: 600; padding-top: 5px; color: #767676; float: right; }
.rank-div { padding: 0 15px; margin-top: 5px; }
.ranks > div { font-size: 13px; }
.rank { width: 20px; text-align: center; }
.rank-region { width: 170px; }
.rank-value { width: 50px; font-weight: 600; }
.rank-percent { width: 50px; text-align: right; color: #36C88A; }
.horiz { margin: 3px 0; }
.show-hide-btn { float: right; cursor: pointer; margin-bottom: 3px; }
.show-hide-btn > img { padding-bottom: 5px; }
#analysis-info { margin: 5px 0 0; }
#analysis-info > .info-bold { margin-left: 16px; font-size: 13px; font-weight: 600; }
#analysis-info > .info-light { margin-left: 8px; font-size: 13px; }
</style>

<script type="text/javascript">
	

</script>
<div class="header-white"></div>
<div class="container" style="margin: 0px;">
	<div class="body-container">
		<div id="analysis" >
		<!-- <div id="analysis" style="display: none"> -->
			<div id="green-div" class="d-flex justify-content-between">
				<span>분석 리포트</span>
				<span style="width: 350px;">&nbsp;</span>
				<span><img id="btn-x"  src='${pageContext.request.contextPath}/resources/images/x.png'></span>
			</div>
			<div id="analysis-info">
				<span class="info-bold">위치</span>
				<span class="info-light" id="info-region">일일동</span>
				<span class="info-bold">업종</span>
				<span class="info-light" id="info-job">업종전체</span>
			</div>
			<div class="analysis-div">
			
			</div>
		</div>
		
		<div id="map"></div>
		<div class="check-area">
		
			<div>
				<div class="title">뜨는 상권</div>
			</div>
			
			<div class="justify-content-center" style="width: 100%;">
				<div>
					<select name="categoryGu" class="form-select selectGu" id="select-Gu">
						
					</select>
				</div>
				<div class="d-flex justify-content-center">
					<input id="hotDong" type="radio" name="selectOne" checked>
					<label for="hotDong" class="div-2" ><span>뜨는 동네</span></label>
					<input id="hotArea" type="radio" name="selectOne">
					<label for="hotArea" class="div-2"><span>뜨는 상권</span></label>
				</div>
				<div class="nav nav-pills btn-group d-flex justify-content-center" role="tablist">
					<input class="nav-link active" id="stoCou" type="radio" role="tab" aria-controls="v-pills-home" name="selectMenu" value="stoCou" checked>
				    <label for="stoCou" class="div-4" id="stoCou-lav">점포수</label>
				    <input class="nav-link" id="sales" type="radio" role="tab" name="selectMenu" value="sales">
				    <label for="sales" class="div-4" id="sales-lav">매출</label>
				    <input class="nav-link" id="mPop" type="radio" role="tab" name="selectMenu" value="mPop">
					<label for="mPop" class="div-4" id="mPop-lav">유동인구</label>
				    <input class="nav-link" id="hPop" type="radio" role="tab" name="selectMenu" value="hPop">
				    <label for="hPop" class="div-4" id="hPop-lav">주거인구</label>
				</div>
			</div>
		</div>
		
		<div class="check-area">
		
			<div id="form-stoCou-sales">
				<form name="form-stoCou-sales" method="post">
					<input type="hidden" name="category" value="">
					<input type="hidden" name="gu" value="">
					<div class="select-title">업종</div>
					<div class="d-flex justify-content-center">
						<input id="allJob" type="radio" name="selectMenu1" checked>
						<label for="allJob" class="div-4 selMenu-lavs" id="allJob-lav" data-val="all">전체</label>
						<input id="food" type="radio" role="tab" name="selectMenu1" value="CS1">
						<label for="food" class="div-4 selMenu-lavs" id="food-lav" data-val="CS1">외식업</label>
						<input id="service" type="radio" role="tab" name="selectMenu1" value="CS2">
						<label for="service" class="div-4 selMenu-lavs" id="service-lav" data-val="CS2">서비스업</label>
						<input id="retail" type="radio" role="tab" name="selectMenu1" value="CS3">
						<label for="retail" class="div-4 selMenu-lavs" id="retail-lav" data-val="CS3">소매업</label>
					</div>
					<div class="d-flex justify-content-center">
						<select id="selPlace" name="" class="form-select selectWork hideSel" style="margin-top: 5px;">
							
						</select>	
					</div>
					<button class="btn btn-primary btn-send" style="width: 92%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0">검색</button>
				</form>
			</div>
			
			<div id="form-Pop" style="display: none">
				<form name="form-Pop" method="post">
					<input type="hidden" name="category" value="">
					<input type="hidden" name="gu" value="">
					<div class="select-title">성별</div>
					<div class="btn-group three-btn-group" role="group" aria-label="Basic radio toggle button group" style=" margin-left: 16px; width: 92%;">
						<input type="radio" class="btn-check" name="gender" id="allGender" autocomplete="off" checked value="allGender">
						<label class="btn btn-outline-primary" for="allGender" style="border-radius: 12px 0 0 12px; font-size: 12px; font-weight: 600;">전체</label>
						
					    <input type="radio" class="btn-check" name="gender" id="male" autocomplete="off" value="male">
					    <label class="btn btn-outline-primary" for="male" style="font-size: 12px; font-weight: 600;">남자</label>
					
					    <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off" value="female">  
					    <label class="btn btn-outline-primary" for="female" style="border-radius: 0 12px 12px 0; font-size: 12px; font-weight: 600;">여자</label>
					</div>
						
				    <div class="select-title weekSel">요일</div>
				    <div class="btn-group three-btn-group weekSel" role="group2" aria-label="Basic radio toggle button group" style=" margin-left: 12px; width: 92%;">
					    <input type="radio" class="btn-check" name="week" id="allWeek" autocomplete="off" checked value="allWeek">
					    <label class="btn btn-outline-primary" for="allWeek" style="border-radius: 12px 0 0 12px; font-size: 12px; font-weight: 600;">전체</label>
						
					    <input type="radio" class="btn-check" name="week" id="week" autocomplete="off" value="week">
					    <label class="btn btn-outline-primary" for="week" style="font-size: 12px; font-weight: 600;">주중</label>
						
					    <input type="radio" class="btn-check" name="week" id="weekend" autocomplete="off" value="weekend">  
					    <label class="btn btn-outline-primary" for="weekend" style="border-radius: 0 12px 12px 0; font-size: 12px; font-weight: 600;">주말</label>
					</div>
				    <div class="select-title">연령대</div>
				    <div class="btn-group five-btn-group" role="group3" aria-label="Basic radio toggle button group" style=" margin-left: 12px; width: 92%;">
					    <input type="radio" class="btn-check" name="age" id="allAge" autocomplete="off" checked value="ageAll">
					    <label class="btn btn-outline-primary" for="allAge" style="border-radius: 12px 0 0 12px; font-size: 10px; font-weight: 600; width: 45px; padding: 9px 6.5px;">전체</label>
					
					    <input type="radio" class="btn-check" name="age" id="age10" autocomplete="off" value="age10">
					    <label class="btn btn-outline-primary" for="age10" style="font-size: 10px; font-weight: 600; width: 45px; padding: 9px 6.5px;">10대</label>
						
					    <input type="radio" class="btn-check" name="age" id="age2030" autocomplete="off" value="age2030">  
					    <label class="btn btn-outline-primary" for="age2030" style="font-size: 10px; font-weight: 600; width: 70px; padding: 9px 6.5px;">20~30대</label>
						    
					    <input type="radio" class="btn-check" name="age" id="age4050" autocomplete="off" value="age4050">  
					    <label class="btn btn-outline-primary" for="age4050" style="font-size: 10px; font-weight: 600; width: 70px; padding: 9px 6.5px;">40~50대</label>
						    
					    <input type="radio" class="btn-check" name="age" id="age60" autocomplete="off" value="age60">  
					    <label class="btn btn-outline-primary" for="age60" style="border-radius: 0 12px 12px 0; font-size: 10px; font-weight: 600; width: 72px; padding: 9px 6.5px;">60대 이상</label>
					</div>
					<button class="btn btn-primary btn-send" style="width: 92%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0">검색</button>
				</form>
			</div>
		</div>
		
		<div class="check-area">
			<div class="rank-title">
				<span>순위 TOP 10</span>
				<span class="show-hide-btn"><img style='width: 12px;' src='${pageContext.request.contextPath}/resources/images/hide_btn.png'></span>
			</div>
			<div class="rank-dis" style="margin-top: 3px;"><span class="hole-rank-title">전체</span><span class="hole-rank-quarter">2022년 3분기 기준</span></div>
			<div class="rank-div">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
				<div class="ranks d-flex flex-row">
					<div class="rank">1</div>
					<div class="rank-region">일일동</div>
					<div class="rank-value">100억</div>
					<div class="rank-percent">3.6% ↑</div>
				</div>
				<hr class="horiz">
			</div>
		</div>
<%-- 	<div class='marker' data-val=''>
			<div class='marker-rank'>
				<div class='marker-rank-img'>
					<img style='width: 18px;' src='${pageContext.request.contextPath}/resources/images/rank_yellow.png'>
				</div>
				<div class='marker-rank-text'>
					<p>1</p>
				</div>
			</div>
			<div class='marker-region-name'>쌍용동</div>
			<div class='marker-sales-total'>100억</div>
		</div> --%>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${daumKey}"></script>
<script type="text/javascript">

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
		{
		    content: "<div class='marker' data-val=''><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='${pageContext.request.contextPath}/resources/images/rank_yellow.png'></div><div class='marker-rank-text'><p>1</p></div></div><div class='marker-region-name'>일일동</div><div class='marker-sales-total'>100억</div></div>", 
		    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		},
		{
		    content: "<div class='marker' data-val=''><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='${pageContext.request.contextPath}/resources/images/rank_yellow.png'></div><div class='marker-rank-text'><p>2</p></div></div><div class='marker-region-name'>이이동</div><div class='marker-sales-total'>90억</div></div>",
		    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		},
		{
		    content: "<div class='marker' data-val=''><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='${pageContext.request.contextPath}/resources/images/rank_yellow.png'></div><div class='marker-rank-text'><p>3</p></div></div><div class='marker-region-name'>삼삼동</div><div class='marker-sales-total'>80억</div></div>", 
		    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		},
		{
		    content: "<div class='marker' data-val=''><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='${pageContext.request.contextPath}/resources/images/rank_white.png'></div><div class='marker-rank-text'><p>4</p></div></div><div class='marker-region-name'>사사동</div><div class='marker-sales-total'>70억</div></div>", 
		    latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		}
	];
	
	for (var i = 0; i < positions.length; i ++) {
		var customOverlay = new kakao.maps.CustomOverlay({
		    position: positions[i].latlng,
		    content: positions[i].content,
		    xAnchor: 0.3,
		    yAnchor: 0.91
		});
		// 커스텀 오버레이를 지도에 표시합니다
		customOverlay.setMap(map);
	}
		
</script>

<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			console.log(jqXHR.responseText);
		}
	});
}

// 줄이기, 늘리기
$(function(){
	$(".show-hide-btn").click(function(){
		if($(this).hasClass("hide_btn")){
			$(".rank-div, .rank-dis").hide();
			$(this).find("img").attr("src", "${pageContext.request.contextPath}/resources/images/show_btn.png");
			$(this).addClass("show_btn");
			$(this).removeClass("hide_btn");
		} else {
			$(".rank-div, .rank-dis").show();
			$(this).find("img").attr("src", "${pageContext.request.contextPath}/resources/images/hide_btn.png");
			$(this).addClass("hide_btn");
			$(this).removeClass("show_btn");
		}
	});
});

// 마커 hover 이벤트
$(function(){
	$(".marker").mouseenter(function(){
			$(this).find(".marker-region-name").css("background", "white");
			$(this).find(".marker-region-name").css("color", "#36C88A");
			$(this).find(".marker-sales-total").css("background", "#36C88A");
			$(this).find(".marker-sales-total").css("color", "white");
		}
	);
	$(".marker").mouseleave(function(){
			$(this).find(".marker-region-name").css("background", "#36C88A");
			$(this).find(".marker-region-name").css("color", "white");
			$(this).find(".marker-sales-total").css("background", "white");
			$(this).find(".marker-sales-total").css("color", "#36C88A");
		}
	);
});

// 마커 click 이벤트
$(function(){
	$(".marker").click(function(){
		$("#analysis").show();
		let dong = $(this).find(".marker-region-name").text();
		$("#info-region").text(dong);
		
		if($("#stoCou").prop("checked") || $("#sales").prop("checked")) {
			if($("#allJob").prop("checked")) {
				$("#info-job").text("업종전체");
			} else if ($("#food").prop("checked")) {
				$("#info-job").text("외식업");
			} else if ($("#service").prop("checked")) {
				$("#info-job").text("서비스업");
			} else if ($("#retail").prop("checked")) {
				$("#info-job").text("소매업");
			}
		} else {
			$("#info-job").text("업종전체");
		}
	});
});

// 창 닫기
$(function(){
	$("#btn-x").click(function(){
		$("#analysis").hide();
	});
});

// 자치구 리스트 가져옴
$(function(){
	let url = "${pageContext.request.contextPath}/bringcate/categoryGu";
	let query;
	let innerHtml;
	
	const fn = function(data) {
		innerHtml += "<option value='all'>자치구 전체</option>";
		for(let dto of data.siguList) {
			innerHtml += "<option value='"+dto.siguNum+"'>"+dto.siguName+"</option>";
		}
		$("#select-Gu").html(innerHtml);
	}
	
	ajaxFun(url, "post", query, "json", fn);
});

$(function(){
	$("#selPlace").hide;
	$("#stoCou-lav").click(function(){
		$("#form-stoCou-sales").show();
		$("#form-Pop").hide();
	});
	$("#sales-lav").click(function(){
		$("#form-stoCou-sales").show();
		$("#form-Pop").hide();
	});
	$("#mPop-lav").click(function(){
		$("#form-stoCou-sales").hide();
		$("#form-Pop").show();
		$(".weekSel").removeClass("hideSel");
	});
	$("#hPop-lav").click(function(){
		$("#form-stoCou-sales").hide();
		$("#form-Pop").show();
		$(".weekSel").addClass("hideSel");
	});
});

// 업종 select
$(function(){
	$("#allJob").click(function(){
		$("#selPlace").addClass("hideSel");
		$("#selPlace").attr("name", "all");
	});
	
	$(".selMenu-lavs").click(function(){
		let url = "${pageContext.request.contextPath}/bringcate/job";
		let query;
		let innerHtml;
		
		if ($(this).attr("data-val") === "all") {
			console.log("false");
			return;
		} else if ($(this).attr("data-val") === "CS1") {
			query = "cateJobNum=CS1";
			innerHtml += "<option value='all'>전체 외식업</option>";
			$("#selPlace").attr("name", "food");
		} else if ($(this).attr("data-val") === "CS2") {
			query = "cateJobNum=CS2";
			innerHtml += "<option value='all'>전체 서비스업</option>";
			$("#selPlace").attr("name", "service");
		} else if ($(this).attr("data-val") === "CS3") {
			query = "cateJobNum=CS3";
			innerHtml += "<option value='all'>전체 소매업</option>";
			$("#selPlace").attr("name", "retail");
		}
		
		const fn = function(data) {
			for(let dto of data.jobList) {
				innerHtml += "<option value='"+dto.jobNum+"'>"+dto.jobName+"</option>";
			}
			$("#selPlace").html(innerHtml);
			$("#selPlace").removeClass("hideSel");
		}
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});

$(function(){
	$(".btn-send").click(function(){
		let selected = $("input[name=selectMenu]:checked").val();
		let selectedGu = $("#select-Gu").val();
		$("input[name=category]").val(selected);
		$("input[name=gu]").val(selectedGu);
		
		let query = $(this).closest("form").serialize();
		
		alert(query);
	});
});

</script>