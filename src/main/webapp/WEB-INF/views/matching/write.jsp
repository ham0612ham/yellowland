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
.show-area { 
	box-shadow: 0px 0px 10px rgb(0, 0, 0, 0.2); width: 300px; 
	padding-top: 12px; background: white; margin-left: 20px;
	min-height: 50px; border-radius: 15px; padding-bottom: 12px; margin-bottom: 15px; 
	position : center; 
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
	width: 50%; margin: 3px; padding: 6px; font-size: 11px;
	margin-top: 12px; font-weight: 600;
}

.div-3 {
    width: 30%; margin: 3px; padding: 17px; 6px; font-size: 11px;
    font-weight: 600; margin-top: 7px;}
    
.div-4 { 
	width: 21.3%; margin: 3px; padding: 17px 6px; font-size: 12px;
	font-weight: 600; margin-top: 7px;
}
.selectGu, .selectWork, .selectDong { 
	width: 92%; color: #000; border-radius: 12px;
	border: 0.5px solid #A3A6AD; font-size: 14px; margin: 10px;
}
.title {
	margin: 0 0 10px 16px; font-weight: 800; 
	color: #36C88A; font-size: 18px; }
.select-title { font-size: 13px; margin-left: 16px; font-weight: 600; padding-top: 5px; }
.show-area {font-size : 18px; text-align:center; font-weight:600; }
.div-3 { width: 29.7%; margin: 3px; padding: 6px; font-size: 12px;
	margin-top: 2px; font-weight: 600; }
.hideSel { display: none; }

#map { z-index: -2; width: 100vw; height: 100vh; position: absolute; top: 0px; }

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
	
		<div id="map"></div>

		  <div class="show-area justify-content-center" ><i class="bi bi-geo-alt">  </i>  지도에서 위치를 선택해주세요.
		
		  </div>
		  
		 <div class="check-area">
			<div>
				<div class="select-title">분석지역</div>
				<div class="select-title"> </div>
			</div>
			
			<div class="justify-content-center" style="width: 100%;">
				<div>
					<select name="categoryGu" class="form-select selectGu" id="select-Gu"> </select>
				</div>
				<div class=select> </div>
				<div>
					<select name="dong" class="form-select selectDong" id="select-Dong"> </select>
				</div>

				<div class="nav nav-pills btn-group d-flex justify-content-center" role="tablist">
				
				    <input class="nav-link" id="cate" type="radio" role="tab" name="selectMenu" value="cate">
				    <label for="size" class="div-3" id="category-lav">업종선택</label>
				    
				    <input class="nav-link" id="budget" type="radio" role="tab" name="selectMenu" value="budget">
					<label for="budget" class="div-3" id="budget-lav">임대료 예산</label>
					
				    <input class="nav-link" id="areasize" type="radio" role="tab" name="selectMenu" value="areasize">
				    <label for="areasize" class="div-3" id="areasize-lav">희망면적</label>
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
					<button class="btn btn-primary btn-select" style="width: 92%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0">선택</button>
				</form>
			</div>
					
			<div id="form-Pop1" style="display: none">
				<form name="form-budget" method="post">
					<input type="hidden" name="category" value="">
					<input type="hidden" name="gu" value="">
					<div class="select-title">임대료</div>
					<div class="btn-group three-btn-group" role="group" aria-label="Basic radio toggle button group" style=" margin-left: 16px; width: 92%;">
						<input type="radio" class="btn-check" name="gender" id="allGender" autocomplete="off" checked value="allGender">
						<label class="btn btn-outline-primary" for="allGender" style="border-radius: 12px 0 0 12px; font-size: 12px; font-weight: 600;">전체</label>
						
					    <input type="radio" class="btn-check" name="gender" id="male" autocomplete="off" value="male">
					    <label class="btn btn-outline-primary" for="male" style="font-size: 12px; font-weight: 600;">남자</label>
					
					    <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off" value="female">  
					    <label class="btn btn-outline-primary" for="female" style="border-radius: 0 12px 12px 0; font-size: 12px; font-weight: 600;">여자</label>
					</div>
						
				    <div class="select-title weekSel">희망면적</div>
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
				</form>
			</div>
		  <button class="btn btn-primary btn-send" style="width:92%; font-size : 12px; border-radius: 12px; margin:20px 12px 0" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> 분석 리포트 보기  </button>
		</div>
	</div>
</div>

<!-- 분석리포트 Report Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"> 분석리포트 </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="row">
 		 <div class="col-4">
    	<div id="simple-list-example" class="d-flex flex-column gap-2 simple-list-example-scrollspy text-center">
     	 <a class="p-1 rounded" href="#simple-list-item-1">Item 1</a>
      		<a class="p-1 rounded" href="#simple-list-item-2">Item 2</a>
     	    <a class="p-1 rounded" href="#simple-list-item-3">Item 3</a>
     	    <a class="p-1 rounded" href="#simple-list-item-4">Item 4</a>
            <a class="p-1 rounded" href="#simple-list-item-5">Item 5</a>
   		 </div>
 	    </div>
 	 <div class="col-8">
    <div data-bs-spy="scroll" data-bs-target="#simple-list-example" data-bs-offset="0" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
      <h4 id="simple-list-item-1">Item 1</h4>
      <p>내용내용내용내</p>
      <h4 id="simple-list-item-2">Item 2</h4>
      <p>...</p>
      <h4 id="simple-list-item-3">Item 3</h4>
      <p>...</p>
      <h4 id="simple-list-item-4">Item 4</h4>
      <p>...</p>
      <h4 id="simple-list-item-5">Item 5</h4>
      <p>...</p>
    </div>
  </div>
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${daumkey}"></script>
<script type="text/javascript">
var areas = [
    {
        name : '용산구',
        path : [
            new kakao.maps.LatLng(37.5548768201904, 126.96966524449994),
            new kakao.maps.LatLng(37.55308718044556, 126.97642899633566),
            new kakao.maps.LatLng(37.55522076659584, 126.97654602427454),
            new kakao.maps.LatLng(37.55320655210504, 126.97874667968763),
            new kakao.maps.LatLng(37.55368689494708, 126.98541456064552),
            new kakao.maps.LatLng(37.54722934282707, 126.995229135048),
            new kakao.maps.LatLng(37.549694559809545, 126.99832516302801),
            new kakao.maps.LatLng(37.550159406110104, 127.00436818301327),
            new kakao.maps.LatLng(37.54820235864802, 127.0061334023129),
            new kakao.maps.LatLng(37.546169758665414, 127.00499711608721),
            new kakao.maps.LatLng(37.54385947805103, 127.00727818360471),
            new kakao.maps.LatLng(37.54413326436179, 127.00898460651953),
            new kakao.maps.LatLng(37.539639030116945, 127.00959054834321),
            new kakao.maps.LatLng(37.537681185520256, 127.01726163044557),
            new kakao.maps.LatLng(37.53378887274516, 127.01719284893274),
            new kakao.maps.LatLng(37.52290225898471, 127.00614038053493),
            new kakao.maps.LatLng(37.51309192794448, 126.99070240960813),
            new kakao.maps.LatLng(37.50654651085339, 126.98553683648308),
            new kakao.maps.LatLng(37.50702053393398, 126.97524914998174),
            new kakao.maps.LatLng(37.51751820477105, 126.94988506562748),
            new kakao.maps.LatLng(37.52702918583156, 126.94987870367682),
            new kakao.maps.LatLng(37.534519656862926, 126.94481851935942),
            new kakao.maps.LatLng(37.537500243531994, 126.95335659960566),
            new kakao.maps.LatLng(37.54231338779177, 126.95817394011969),
            new kakao.maps.LatLng(37.54546318600178, 126.95790512689311),
            new kakao.maps.LatLng(37.548791603525764, 126.96371984820232),
            new kakao.maps.LatLng(37.55155543391863, 126.96233786542686),
            new kakao.maps.LatLng(37.5541513366375, 126.9657135934734),
            new kakao.maps.LatLng(37.55566236579088, 126.9691850696746),
            new kakao.maps.LatLng(37.5548768201904, 126.96966524449994)
        ]
    }, {
        name : '중구',
        path : [
            new kakao.maps.LatLng(37.544062989758594, 127.00854659142894),
            new kakao.maps.LatLng(37.54385947805103, 127.00727818360471),
            new kakao.maps.LatLng(37.546169758665414, 127.00499711608721),
            new kakao.maps.LatLng(37.54820235864802, 127.0061334023129),
            new kakao.maps.LatLng(37.550159406110104, 127.00436818301327),
            new kakao.maps.LatLng(37.549694559809545, 126.99832516302801),
            new kakao.maps.LatLng(37.54722934282707, 126.995229135048),
            new kakao.maps.LatLng(37.55368689494708, 126.98541456064552),
            new kakao.maps.LatLng(37.55320655210504, 126.97874667968763),
            new kakao.maps.LatLng(37.55522076659584, 126.97654602427454),
            new kakao.maps.LatLng(37.55308718044556, 126.97642899633566),
            new kakao.maps.LatLng(37.55487749311664, 126.97240854546743),
            new kakao.maps.LatLng(37.5548766923893, 126.9691718124876),
            new kakao.maps.LatLng(37.55566236579088, 126.9691850696746),
            new kakao.maps.LatLng(37.55155543391863, 126.96233786542686),
            new kakao.maps.LatLng(37.55498984534305, 126.96173858545431),
            new kakao.maps.LatLng(37.55695455613004, 126.96343068837372),
            new kakao.maps.LatLng(37.5590262922649, 126.9616731414449),
            new kakao.maps.LatLng(37.56197662569172, 126.96946316364357),
            new kakao.maps.LatLng(37.56582132960869, 126.96669525397355),
            new kakao.maps.LatLng(37.56824746386509, 126.96909838710842),
            new kakao.maps.LatLng(37.569485309984174, 126.97637402412326),
            new kakao.maps.LatLng(37.56810323716611, 126.98905202099309),
            new kakao.maps.LatLng(37.56961739576364, 127.00225936812329),
            new kakao.maps.LatLng(37.56966688588187, 127.0152677241078),
            new kakao.maps.LatLng(37.572022763755164, 127.0223363152772),
            new kakao.maps.LatLng(37.57190723475508, 127.02337770475695),
            new kakao.maps.LatLng(37.56973041414113, 127.0234585247501),
            new kakao.maps.LatLng(37.565200182350495, 127.02358387477513),
            new kakao.maps.LatLng(37.56505173515675, 127.02678930885806),
            new kakao.maps.LatLng(37.563390358462826, 127.02652159646888),
            new kakao.maps.LatLng(37.5607276739534, 127.02339232029838),
            new kakao.maps.LatLng(37.55779412537163, 127.0228934248264),
            new kakao.maps.LatLng(37.556850715898484, 127.01807638779917),
            new kakao.maps.LatLng(37.55264513061776, 127.01620129137214),
            new kakao.maps.LatLng(37.547466935106435, 127.00931996404753),
            new kakao.maps.LatLng(37.54502351209897, 127.00815187343248),
            new kakao.maps.LatLng(37.544062989758594, 127.00854659142894)
        ]
    }, {
        name : '종로구',
        path : [
            new kakao.maps.LatLng(37.631840777111364, 126.9749313865046),
            new kakao.maps.LatLng(37.632194205253654, 126.97609588529602),
            new kakao.maps.LatLng(37.629026103322374, 126.97496405167149),
            new kakao.maps.LatLng(37.6285585388996, 126.97992605309885),
            new kakao.maps.LatLng(37.626378096236195, 126.97960492198952),
            new kakao.maps.LatLng(37.6211493968146, 126.98365245774505),
            new kakao.maps.LatLng(37.6177725051378, 126.9837302191854),
            new kakao.maps.LatLng(37.613985109550605, 126.98658977758268),
            new kakao.maps.LatLng(37.611364924201304, 126.98565700183143),
            new kakao.maps.LatLng(37.60401657024552, 126.98665951539246),
            new kakao.maps.LatLng(37.60099164566844, 126.97852019816328),
            new kakao.maps.LatLng(37.59790270809407, 126.97672287261275),
            new kakao.maps.LatLng(37.59447673441787, 126.98544283754865),
            new kakao.maps.LatLng(37.59126960661375, 126.98919808879788),
            new kakao.maps.LatLng(37.592300831997434, 127.0009511248032),
            new kakao.maps.LatLng(37.58922302426079, 127.00228260552726),
            new kakao.maps.LatLng(37.586091007146834, 127.00667090686603),
            new kakao.maps.LatLng(37.58235007703611, 127.00677925856456),
            new kakao.maps.LatLng(37.58047228501006, 127.00863575242668),
            new kakao.maps.LatLng(37.58025588757531, 127.01058748333907),
            new kakao.maps.LatLng(37.582338528091164, 127.01483104096094),
            new kakao.maps.LatLng(37.581693162424465, 127.01673289259993),
            new kakao.maps.LatLng(37.57758802896556, 127.01812215416163),
            new kakao.maps.LatLng(37.5788668917658, 127.02140099081309),
            new kakao.maps.LatLng(37.578034045208426, 127.02313962015988),
            new kakao.maps.LatLng(37.57190723475508, 127.02337770475695),
            new kakao.maps.LatLng(37.56966688588187, 127.0152677241078),
            new kakao.maps.LatLng(37.56961739576364, 127.00225936812329),
            new kakao.maps.LatLng(37.5681357695346, 126.99014772014593),
            new kakao.maps.LatLng(37.569315246023024, 126.9732046364419),
            new kakao.maps.LatLng(37.56824746386509, 126.96909838710842),
            new kakao.maps.LatLng(37.56582132960869, 126.96669525397355),
            new kakao.maps.LatLng(37.57874076105342, 126.95354824618335),
            new kakao.maps.LatLng(37.581020184166476, 126.95812059678624),
            new kakao.maps.LatLng(37.59354736740056, 126.95750665936443),
            new kakao.maps.LatLng(37.595061575856455, 126.9590412421402),
            new kakao.maps.LatLng(37.59833350100327, 126.9576941779143),
            new kakao.maps.LatLng(37.59875701675023, 126.95306020161668),
            new kakao.maps.LatLng(37.602476031211225, 126.95237386792348),
            new kakao.maps.LatLng(37.60507154496655, 126.95404376087069),
            new kakao.maps.LatLng(37.60912809443569, 126.95032198271032),
            new kakao.maps.LatLng(37.615539700280216, 126.95072546923387),
            new kakao.maps.LatLng(37.62433621196653, 126.94900237336302),
            new kakao.maps.LatLng(37.62642708817027, 126.95037844036497),
            new kakao.maps.LatLng(37.629590994617104, 126.95881385457929),
            new kakao.maps.LatLng(37.629794440379136, 126.96376660599225),
            new kakao.maps.LatLng(37.632373740990175, 126.97302793692637),
            new kakao.maps.LatLng(37.631840777111364, 126.9749313865046)
        ]
    }, {
        name : '서대문구',
        path : [
            new kakao.maps.LatLng(37.59851932019209, 126.95347706883003),
            new kakao.maps.LatLng(37.5992407011344, 126.95499403097206),
            new kakao.maps.LatLng(37.59833350100327, 126.9576941779143),
            new kakao.maps.LatLng(37.595061575856455, 126.9590412421402),
            new kakao.maps.LatLng(37.59354736740056, 126.95750665936443),
            new kakao.maps.LatLng(37.581020184166476, 126.95812059678624),
            new kakao.maps.LatLng(37.57874076105342, 126.95354824618335),
            new kakao.maps.LatLng(37.56197662569172, 126.96946316364357),
            new kakao.maps.LatLng(37.5575156365052, 126.95991288916548),
            new kakao.maps.LatLng(37.55654562007193, 126.9413708153468),
            new kakao.maps.LatLng(37.555098093384, 126.93685861757348),
            new kakao.maps.LatLng(37.55884751347576, 126.92659242918415),
            new kakao.maps.LatLng(37.5633319104926, 126.92828128083327),
            new kakao.maps.LatLng(37.56510367293256, 126.92601582346325),
            new kakao.maps.LatLng(37.57082994377989, 126.9098094620638),
            new kakao.maps.LatLng(37.57599550420081, 126.902091747923),
            new kakao.maps.LatLng(37.587223103650295, 126.91284666446226),
            new kakao.maps.LatLng(37.58541570520177, 126.91531241017965),
            new kakao.maps.LatLng(37.585870567159255, 126.91638068573187),
            new kakao.maps.LatLng(37.583095195853055, 126.9159399866114),
            new kakao.maps.LatLng(37.583459593417196, 126.92175886498167),
            new kakao.maps.LatLng(37.587104600730505, 126.92388813813815),
            new kakao.maps.LatLng(37.588386594820484, 126.92800815682232),
            new kakao.maps.LatLng(37.59157595859555, 126.92776504133688),
            new kakao.maps.LatLng(37.59455434247408, 126.93027139545339),
            new kakao.maps.LatLng(37.59869748704149, 126.94088480070904),
            new kakao.maps.LatLng(37.60065830191363, 126.9414041615336),
            new kakao.maps.LatLng(37.60305781086164, 126.93995273804141),
            new kakao.maps.LatLng(37.610598531321436, 126.95037536795142),
            new kakao.maps.LatLng(37.6083605525023, 126.95056259057313),
            new kakao.maps.LatLng(37.60507154496655, 126.95404376087069),
            new kakao.maps.LatLng(37.602476031211225, 126.95237386792348),
            new kakao.maps.LatLng(37.59851932019209, 126.95347706883003)
        ]
    }, {
        name : '동대문구',
        path : [
            new kakao.maps.LatLng(37.607062869017085, 127.07111288773496),
            new kakao.maps.LatLng(37.60107201319839, 127.07287376670605),
            new kakao.maps.LatLng(37.59724304056685, 127.06949105186925),
            new kakao.maps.LatLng(37.58953367466315, 127.07030363208528),
            new kakao.maps.LatLng(37.58651213184981, 127.07264218709383),
            new kakao.maps.LatLng(37.5849555116177, 127.07216063016078),
            new kakao.maps.LatLng(37.58026781100598, 127.07619547037923),
            new kakao.maps.LatLng(37.571869232268774, 127.0782018408153),
            new kakao.maps.LatLng(37.559961773835425, 127.07239004251258),
            new kakao.maps.LatLng(37.56231553903832, 127.05876047165025),
            new kakao.maps.LatLng(37.57038253579033, 127.04794980454399),
            new kakao.maps.LatLng(37.572878529071055, 127.04263554582458),
            new kakao.maps.LatLng(37.57302061077518, 127.0381755492195),
            new kakao.maps.LatLng(37.56978273516453, 127.03099733100001),
            new kakao.maps.LatLng(37.57190723475508, 127.02337770475695),
            new kakao.maps.LatLng(37.57838361223621, 127.0232348231103),
            new kakao.maps.LatLng(37.58268174514337, 127.02953994610249),
            new kakao.maps.LatLng(37.58894739851823, 127.03553876830637),
            new kakao.maps.LatLng(37.5911852565689, 127.03621919708065),
            new kakao.maps.LatLng(37.59126734230753, 127.03875553445558),
            new kakao.maps.LatLng(37.5956815721534, 127.04062845365279),
            new kakao.maps.LatLng(37.5969637344377, 127.04302522879048),
            new kakao.maps.LatLng(37.59617641777492, 127.04734129391157),
            new kakao.maps.LatLng(37.60117358544485, 127.05101351973708),
            new kakao.maps.LatLng(37.600149587503246, 127.05209540476308),
            new kakao.maps.LatLng(37.60132672748398, 127.05508130598699),
            new kakao.maps.LatLng(37.6010580545608, 127.05917142337097),
            new kakao.maps.LatLng(37.605121767227374, 127.06219611364686),
            new kakao.maps.LatLng(37.607062869017085, 127.07111288773496)
        ]
    }, {
        name : '성북구',
        path : [
            new kakao.maps.LatLng(37.63654916557213, 126.98446028560235),
            new kakao.maps.LatLng(37.631446839436855, 126.99372381657889),
            new kakao.maps.LatLng(37.626192451322005, 126.99927047335905),
            new kakao.maps.LatLng(37.62382095469671, 127.00488450145781),
            new kakao.maps.LatLng(37.624026217174986, 127.00788862747375),
            new kakao.maps.LatLng(37.6205124078061, 127.00724034082933),
            new kakao.maps.LatLng(37.61679651952433, 127.01014412786792),
            new kakao.maps.LatLng(37.61472018601129, 127.01451127202589),
            new kakao.maps.LatLng(37.614629670135216, 127.01757841621624),
            new kakao.maps.LatLng(37.61137091590441, 127.02219857751122),
            new kakao.maps.LatLng(37.612692696824915, 127.02642583551054),
            new kakao.maps.LatLng(37.612367438936786, 127.03018593770908),
            new kakao.maps.LatLng(37.60896889076571, 127.0302525167858),
            new kakao.maps.LatLng(37.61279787695882, 127.03730791358603),
            new kakao.maps.LatLng(37.62426467261789, 127.04973339977498),
            new kakao.maps.LatLng(37.61449950127667, 127.06174181124696),
            new kakao.maps.LatLng(37.61561580859776, 127.06985247014711),
            new kakao.maps.LatLng(37.61351359068103, 127.07170798866412),
            new kakao.maps.LatLng(37.60762512162974, 127.07105453180604),
            new kakao.maps.LatLng(37.605121767227374, 127.06219611364686),
            new kakao.maps.LatLng(37.6010580545608, 127.05917142337097),
            new kakao.maps.LatLng(37.60132672748398, 127.05508130598699),
            new kakao.maps.LatLng(37.600149587503246, 127.05209540476308),
            new kakao.maps.LatLng(37.60117358544485, 127.05101351973708),
            new kakao.maps.LatLng(37.59617641777492, 127.04734129391157),
            new kakao.maps.LatLng(37.59644879095525, 127.04184728392097),
            new kakao.maps.LatLng(37.59126734230753, 127.03875553445558),
            new kakao.maps.LatLng(37.5911852565689, 127.03621919708065),
            new kakao.maps.LatLng(37.58894739851823, 127.03553876830637),
            new kakao.maps.LatLng(37.58268174514337, 127.02953994610249),
            new kakao.maps.LatLng(37.57782865303167, 127.02296295333255),
            new kakao.maps.LatLng(37.57889204835333, 127.02179043639809),
            new kakao.maps.LatLng(37.57758802896556, 127.01812215416163),
            new kakao.maps.LatLng(37.581693162424465, 127.01673289259993),
            new kakao.maps.LatLng(37.582338528091164, 127.01483104096094),
            new kakao.maps.LatLng(37.58025588757531, 127.01058748333907),
            new kakao.maps.LatLng(37.58047228501006, 127.00863575242668),
            new kakao.maps.LatLng(37.58235007703611, 127.00677925856456),
            new kakao.maps.LatLng(37.586091007146834, 127.00667090686603),
            new kakao.maps.LatLng(37.58922302426079, 127.00228260552726),
            new kakao.maps.LatLng(37.592300831997434, 127.0009511248032),
            new kakao.maps.LatLng(37.59126960661375, 126.98919808879788),
            new kakao.maps.LatLng(37.59447673441787, 126.98544283754865),
            new kakao.maps.LatLng(37.59790270809407, 126.97672287261275),
            new kakao.maps.LatLng(37.60099164566844, 126.97852019816328),
            new kakao.maps.LatLng(37.60451393107786, 126.98678626394351),
            new kakao.maps.LatLng(37.611364924201304, 126.98565700183143),
            new kakao.maps.LatLng(37.613985109550605, 126.98658977758268),
            new kakao.maps.LatLng(37.6177725051378, 126.9837302191854),
            new kakao.maps.LatLng(37.6211493968146, 126.98365245774505),
            new kakao.maps.LatLng(37.626378096236195, 126.97960492198952),
            new kakao.maps.LatLng(37.6285585388996, 126.97992605309885),
            new kakao.maps.LatLng(37.62980449548538, 126.97468284124939),
            new kakao.maps.LatLng(37.633657663246694, 126.97740053878216),
            new kakao.maps.LatLng(37.63476479485093, 126.98154674721893),
            new kakao.maps.LatLng(37.63780700422825, 126.9849494717052),
            new kakao.maps.LatLng(37.63654916557213, 126.98446028560235)
        ]
    }, {
        name : '성동구',
        path : [
            new kakao.maps.LatLng(37.57275246810175, 127.04241813085706),
            new kakao.maps.LatLng(37.57038253579033, 127.04794980454399),
            new kakao.maps.LatLng(37.56231553903832, 127.05876047165025),
            new kakao.maps.LatLng(37.5594131360664, 127.07373408220053),
            new kakao.maps.LatLng(37.52832388381049, 127.05621773388143),
            new kakao.maps.LatLng(37.53423885672233, 127.04604398310076),
            new kakao.maps.LatLng(37.53582328355087, 127.03979942567628),
            new kakao.maps.LatLng(37.53581367627865, 127.0211714455564),
            new kakao.maps.LatLng(37.53378887274516, 127.01719284893274),
            new kakao.maps.LatLng(37.537681185520256, 127.01726163044557),
            new kakao.maps.LatLng(37.53938672166098, 127.00993448922989),
            new kakao.maps.LatLng(37.54157804358092, 127.00879872996808),
            new kakao.maps.LatLng(37.54502351209897, 127.00815187343248),
            new kakao.maps.LatLng(37.547466935106435, 127.00931996404753),
            new kakao.maps.LatLng(37.55264513061776, 127.01620129137214),
            new kakao.maps.LatLng(37.556850715898484, 127.01807638779917),
            new kakao.maps.LatLng(37.55779412537163, 127.0228934248264),
            new kakao.maps.LatLng(37.5607276739534, 127.02339232029838),
            new kakao.maps.LatLng(37.563390358462826, 127.02652159646888),
            new kakao.maps.LatLng(37.56505173515675, 127.02678930885806),
            new kakao.maps.LatLng(37.565200182350495, 127.02358387477513),
            new kakao.maps.LatLng(37.57190723475508, 127.02337770475695),
            new kakao.maps.LatLng(37.56978273516453, 127.03099733100001),
            new kakao.maps.LatLng(37.57302061077518, 127.0381755492195),
            new kakao.maps.LatLng(37.57275246810175, 127.04241813085706)
        ]
    }, {
        name : '마포구',
        path : [
            new kakao.maps.LatLng(37.584651324803644, 126.88883849288884),
            new kakao.maps.LatLng(37.57082994377989, 126.9098094620638),
            new kakao.maps.LatLng(37.56510367293256, 126.92601582346325),
            new kakao.maps.LatLng(37.5633319104926, 126.92828128083327),
            new kakao.maps.LatLng(37.55884751347576, 126.92659242918415),
            new kakao.maps.LatLng(37.55675317809392, 126.93190919632814),
            new kakao.maps.LatLng(37.555098093384, 126.93685861757348),
            new kakao.maps.LatLng(37.55654562007193, 126.9413708153468),
            new kakao.maps.LatLng(37.557241466445234, 126.95913438471307),
            new kakao.maps.LatLng(37.55908394430372, 126.96163689468189),
            new kakao.maps.LatLng(37.55820141918588, 126.96305432966605),
            new kakao.maps.LatLng(37.554784413504734, 126.9617251098019),
            new kakao.maps.LatLng(37.548791603525764, 126.96371984820232),
            new kakao.maps.LatLng(37.54546318600178, 126.95790512689311),
            new kakao.maps.LatLng(37.54231338779177, 126.95817394011969),
            new kakao.maps.LatLng(37.539468942052544, 126.955731506394),
            new kakao.maps.LatLng(37.536292068277106, 126.95128907260018),
            new kakao.maps.LatLng(37.53569162926515, 126.94627494388307),
            new kakao.maps.LatLng(37.53377712226906, 126.94458373402794),
            new kakao.maps.LatLng(37.54135238063506, 126.93031191951576),
            new kakao.maps.LatLng(37.539036674424615, 126.9271006565075),
            new kakao.maps.LatLng(37.54143034750605, 126.9224138272872),
            new kakao.maps.LatLng(37.54141748538761, 126.90483000187002),
            new kakao.maps.LatLng(37.548015078285694, 126.89890097452322),
            new kakao.maps.LatLng(37.56300401736817, 126.86623824787709),
            new kakao.maps.LatLng(37.57178997971358, 126.85363039091744),
            new kakao.maps.LatLng(37.57379738998644, 126.85362646212587),
            new kakao.maps.LatLng(37.57747251471329, 126.864939928088),
            new kakao.maps.LatLng(37.5781913017327, 126.87625939970273),
            new kakao.maps.LatLng(37.57977132158497, 126.87767870371688),
            new kakao.maps.LatLng(37.584440882833654, 126.87653889183002),
            new kakao.maps.LatLng(37.59079311146897, 126.88205386700724),
            new kakao.maps.LatLng(37.584651324803644, 126.88883849288884)
        ]
    }
];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({removable: true});

// 지도에 영역데이터를 폴리곤으로 표시합니다 
for (var i = 0, len = areas.length; i < len; i++) {
    displayArea(areas[i]);
}

// 다각형을 생상하고 이벤트를 등록하는 함수입니다
function displayArea(area) {

    // 다각형을 생성합니다 
    var polygon = new kakao.maps.Polygon({
        map: map, // 다각형을 표시할 지도 객체
        path: area.path,
        strokeWeight: 2,
        strokeColor: '#36C88A',
        strokeOpacity: 0.8,
        fillColor: '#fff',
        fillOpacity: 0.7 
    });

    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        polygon.setOptions({fillColor: '#C0C0C0'});

        customOverlay.setContent('<div class="area">' + area.name + '</div>');
        
        customOverlay.setPosition(mouseEvent.latLng); 
        customOverlay.setMap(map);
    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
        
        customOverlay.setPosition(mouseEvent.latLng); 
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다 
    kakao.maps.event.addListener(polygon, 'mouseout', function() {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);
    }); 

    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
        var content = '<div class="info">' + 
                    '   <div class="title">' + area.name + '</div>' +
                    '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></div>' +
                    '</div>';

        infowindow.setContent(content); 
        infowindow.setPosition(mouseEvent.latLng); 
        infowindow.setMap(map);
    });
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


//동 리스트 가져오기 

$(function(){
	let url = "${pageContext.request.contextPath}/bringcate/dong";
	let query;
	let innerHtml;
	
	const fn = function(data) {
		innerHtml += "<option value='all'>행정동 전체</option>";
		for(let dto of data.dongList) {
			innerHtml += "<option value='"+dto.dongNum+"'>"+dto.dongName+"</option>";
		}
		$("#select-Dong").html(innerHtml);
	}
	
	ajaxFun(url, "post", query, "json", fn);
});


//임대료예산,면적 select 

$(function(){
	$("#selPlace").hide;
	
	$("#category-lav").click(function(){
		$("#btn-send").hide();
		$("#form-stoCou-sales").show();
		$("#form-Pop1").hide ();
	});
	
	$("#budget-lav").click(function(){
		$("#btn-send").hide();
		$("#form-stoCou-sales").hide();
		$("#form-Pop1").show();
	});
	
	$("#areasize-lav").click(function(){
		$("#btn-send").hide();
		$("#form-stoCou-sales").hide();
		$("#form-Pop1").show();

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
	$(".btn-select").click(function(){
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