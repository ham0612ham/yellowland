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
	box-shadow: 0px 0px 10px rgb(0, 0, 0, 0.2); width: 350px; 
	padding-top: 12px; background: white; margin-left: 20px;
	min-height: 50px; border-radius: 15px; padding-bottom: 12px; margin-bottom: 15px; 
}
.check-area1 { 
	box-shadow: 0px 0px 10px rgb(0, 0, 0, 0.2); width: 350px; 
	padding-top: 12px; background: white; margin-left: 20px;
	min-height: 50px; border-bottom-radius:15px; padding-bottom: 12px; margin-bottom: 15px; 
}
.area { backgound: white; }
.show-area { 
	box-shadow: 0px 0px 10px rgb(0, 0, 0, 0.2); width: 300px; 
	 background: white; margin-left: 20px;
	min-height: 50px; border-radius: 15px; margin-bottom: 15px; 
	position : center;
	font-size: 11px;
}
input[type=checkbox], input[type=radio] { display: none; }
label, .div-4 {
	display: block; border-radius: 12px; margin: 0 auto; text-align: center; color: #000;
}

input[type=checkbox]:checked+label:hover, 
input[type=radio]:checked+label:hover { background: #18BD77; color: white; border: 0.5px solid #18BD77; }
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
	height: 50px;
	font-weight: 600; margin-top: 7px;
}
.selectGu, .selectWork, .selectDong { 
	width: 92%; color: #000; border-radius: 12px;
	border: 0.5px solid #A3A6AD; font-size: 14px; margin: 10px;
}
.title {
	margin: 0 0 10px 16px; font-weight: 800; 
	color: #36C88A; font-size: 18px; }
.select_maintitle {font-size:20px; margin-left:16px; font-weight:600; padding: 10px;}
.select-title { font-size: 13px; margin-left: 16px; font-weight: 600; padding-top: 5px; margin-bottom:10px; }
.main-title {font-size:18px; font-weight:500; color:#fff}
.show-area { font-size : 18px; text-align:center; font-weight:600; }

.div-1 { width: 93%; margin: 3px; padding: 6px; font-size: 13px; height:50px;
	margin-top: 2px; font-weight: 600; position: margin}

.div-3 { width: 29.7%; margin: 3px; padding: 6px; font-size: 13px; height:50px;
	margin-top: 2px; font-weight: 600; }
.hideSel { display: none; }
.range-budget { font-size:13px; }
#map { z-index: -2; width: 70vw; height: 100vh; position: absolute; top: 0px; right:0px;  }
#report { height: calc(100vh - 100px);  overflow: scroll; top:100px; }
#report-banner {
	position: absolute; min-width: 700px;
	background: white; margin-left: 100%;
	padding-top: 12px;
	right: 0px; top: 60px; z-index: 3;	
	border-top-left-radius : 40px;
}


#green-div { background: #36C88A; height: 50px; width: 100%; padding-right: 10px; padding-left: 10px;
             border-bottom-left-radius: 20px;
             border-top-left-radius: 20px;
             margin-top:-10px; }
#green-div > span { color: white; font-size: 16px; font-weight: 600; padding: 5px; }

#green-top { box-shadow: 0px 0px 10px rgb(0, 0, 0, 0.2); 
	         padding-top: 30px;  margin-left: 20px;
             background: #36C88A; height: 58px; width: 350px;
             border-top-right-radius : 40px;
	         border-top-left-radius : 40px;}

#green-top > span { height:160px; 
                    width:360px; 
                    color: white; 
                    font-size: 18px;
                    font-weight: 600; 
                    margin-bottom:50px; }
             
#btn-radio { width:20px; padding_bottom:3px;}
#btn-x { width: 16px; padding-bottom: 3px; }
#thumbs-up {width:30px;}
#btn-x:hover { cursor: pointer; }
#btn-location { width:16px; }
#btn-select {position: d-flex justify-content-center}
#rank-title { padding : 5px;}
#btn-showreport { padding-bottom:100px; width: 350px; 
                  padding-top: 12px; background: white; margin-left: 20px;
                  border-radius: 15px;}
#report-title { font-size : 13px; margin:0 font-weight: 600; padding : 5px;}
#report-title > span { color: white; font-size: 16px; font-weight: 600; padding: 5px; }
.rank-div { padding: 0 15px; margin-top: 5px; }
.ranks > div { font-size: 13px; }
.rank { width: 20px; text-align: center; }
.rank-value { width: 50px; font-weight: 600; }
.rank-percent { width: 50px; text-align: right; color: #36C88A; }
.sgname-info { width: 140px; }
.line { margin: 3px 0; }
.show-hide-btn { float: right; cursor: pointer; margin-bottom: 3px; }
.show-hide-btn > img { padding-bottom: 5px; }
#report-info { margin: 5px 0 0; }
#report-info > .info-bold { margin-left: 16px; font-size: 13px; font-weight: 600; }
#report-info > .info-light { margin-left: 8px; font-size: 13px; }
#report-class { 
	text-align: center; font-size: 13px; margin: 10px 0; color: #BBBBBB;
}
#analysis-dialog { text-align: center; font-size: 12px; margin 10px 0; color: #BBBBBB;
                    height:300px;}
#getbudget {font-size:10px;}

.main-title { font-weight:600; margin-bottom: 10px;}
.form-range { width:100%; height: 1.5rem; padding: 0; background:transparent}
.form-range:focus{outline:0;}
.form-range:focus::-webkit-slider-thumb{
 box-shadow: 0 0 0 1px #fff 0 0 0.25rem rgba(13,110,253,025);}
.info-sigu { font-weight: 600; }
.info-dong { font-weight: 600; }
.report-content { margin : 2px; backgroundcolor: #36C88A;}
.report-div { margin: 16px; }
.report_div { margin : 50px;}
.report-tit {font-size: 14px; font-weight:600;  margin-left:70px; margin-top:50px; }
.report-title { font-size: 20px;font-weight: 700; background: #f1f3f76c; max-height:3px; margin-bottom:30px; margin-top:10px; line-height:50px; margin-left:300px;   }
.report-name { font-size:14px; font-weight: 600; margin-left:70px; margin-bottom :10px;}
.report-graphtitle { font-size: 15px; margin-top: 40px; font-weight: 700; max-height:1px; margin-bottom:30px; line-height:24px;   }
.report-matching {font-size: 13px; margin-left : 70px; margin-bottom:10px;  }
.report-big-txt { font-size: 18px; font-weight: 600; margin-bottom: 10px; }
.green-txt { color: #36C88A; }
.report-graph { width: 100%; min-height: 300px; border: 0; margin-top: 30px;}
.report-discribe { border: 0.3px solid #BBBBBB; padding: 10px; margin-bottom: 10px; }
.rpt_txt { padding:16px 24px; background: #f1f3f76c; max-width: 500px; border:0; border-radius:8px; font-size: 14px; 
           align : center; margin-left: 60px;}
#report-class { 
	text-align: center; font-size: 13px; margin:0; color: #BBBBBB;}
	
.list-budget{ margin-left : 10px;}
.budget-list { width: 120px; font-weight: 600; text-align: right; padding-right: 5px; }
}

.

 }
 

}


 
 
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/matching.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>

<script type="text/javascript">

</script>
<div class="header-white"></div>
<div class="container" style="margin: 0px;">

	   <!--대화상자시작 -->
	 
	    <div id="report-banner"style="opacity: 1; display: none;">
	        <div id="green-div" class="d-flex justify-content-between">
	    	 <span> ${sessionScope.member.userName} 님의 매칭분석 리포트 </span> 
	    	 <span><img id="btn-x" src='${pageContext.request.contextPath}/resources/images/x.png'></span>
	        </div>
	        
			<div id="report-class" class="d-flex justify-content-between">
				<a class="list-group-item list-group-item-action" href="#list-item-1">매칭결과</a>
      			<a class="list-group-item list-group-item-action" href="#list-item-2">상권분석</a>
			</div>
			
			   <div id= "report" data-bs-spy="scroll" >
		         	<div class="report-content" id="list-item-1">
				 	<div class="report-title d-flex justify-content-between"> 상권매칭 결과  </div>
					 <div class="report-tit"> <img id="thumbs-up" src='${pageContext.request.contextPath}/resources/images/thumbs-up.png'> ${sessionScope.member.userName} 님! 이 상권 어떠세요?  </div>
				    	<div class="rpt_txt"> 
				     <div class="report-name"> 상권이름 &emsp; /&nbsp; 월 평균임대료 (3.3m² 기준) </div>
				  	<div class="report-matching" id="matchingResult"></div>	
				    </div>
					 <div class="report_div"></div>
			  </div>
			
			
			<div class="report-content" id="list-item-2">
			 
				 <div class="report-title d-flex justify-content-between"> 상권의 특성 </div>
			
			 <div class="report-div">
			    <div class="report-graphtitle"><i class="bi bi-1-circle"></i> 상권용도</div>
			    <div class="report-graph" id="yongdoArea"> </div>
			 	<div class="rpt_txt"> 
			 	 <span class="info-sigu"> </span> <span class="info-dong"></span> 은 <span class="green-txt"> 주거ㆍ상업ㆍ녹지지역 </span> 으로 구분 됩니다.
			 </div>
			  
			  <div class="report-div">
			    	 <div class="report-graphtitle"><i class="bi bi-2-circle"></i> 업종 밀집도 </div> 
			   		 <div class="report-graph" id="milzipdo"> </div>
			 		 <div class="rpt_txt">
					 <span> <span class="info-sigu"> </span> <span class="info-dong"></span> 의 업종현황은 <span class="green-txt upzongbunpo-job upzongbunpo-job-first"></span>이 가장 많고, <span class="green-txt upzongbunpo-job-grow"></span>이 증가 추세입니다.</span>
					</div>
			</div>
			 <div class="report-div">
					<div class="report-graphtitle"><i class="bi bi-3-circle"></i> 동종업종의 점포 수</div>
					<div class="report-graph" id="jumpo"></div>
					<div class="rpt_txt">
			    	 <span class="info-sigu"></span>에서 운영중인 동종업종의 점포 수는 <span class="green-txt" id="jumpo-result"></span> 입니다.</div>
	        </div>
	         
	        
				<!-- 
					<div class="d-flex justify-content-center" style="position: relative; top: 120px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
					 -->
			</div>		
			  </div>
		
			</div>		
		</div>
  </div>
	    <!--대화상자 -->
	    
	    <!-- 지도  -->
		<div id="map"></div>
		
	<!-- 매칭 조건 입력버튼 -->
		  <div id="green-top"> 
		   <div class="d-flex justify-content-center">
		   <span class="main-title"> 노른자 상권매칭서비스 </span> </div> </div>
		 <div class="check-area">
		        <div class="d-flex justify-content-center">
				<div class="select_maintitle"></div>
				</div>
	
			 
			<div class="justify-content-center" style="width: 100%;">
				<form name="areasubmitform" method="post">
					<div class="nav nav-pills btn-group d-flex justify-content-center" role="tablist">
					    <input class="select-region" id="region" type="radio" name="selectRegion" value="region"/>
			            <label for="region" class="div-1" id="region-lav">지역선택 <br><span id='getregion'> </span> </label> 
					    <input class="nav-link" id="cate" type="radio" role="tab" name="selectMenu" value="cate">
					    <label for="cate" class="div-3" id="category-lav">업종    <br><span id='getcate'> </span> </label> 
					    <input class="nav-link" id="budget" type="radio" role="tab" name="selectMenu2" value="budget">
					    <label for="budget" class="div-3" id="budget-lav">임대료 / 평수 <br><span id='getbudget'> </span>  </label>
					    <input class="nav-link" id="target" type="radio" role="tab" name="selectMenu3" value="size">
					    <label for="target" class="div-3" id="target-lav">타겟층 <br><span id='gettarget'> </span> </label>
					    <input type="hidden" name="siguNum">
					    <input type="hidden" name="dongNum">
					    <input type="hidden" name="setcate">
					    <input type="hidden" name="setbudget">
					    <input type="hidden" name="setsize">
					    <input type="hidden" name="setgender">
					    <input type="hidden" name="setage">    	
					</div>
				</form>
					<button class="btn btn-primary showreport" type="button" onclick= "showreport()" style="width:92%; font-size : 12px; border-radius: 12px; margin:20px 12px 0"> <i class="bi bi-clipboard2-data-fill"></i> 분석 리포트 보기  </button>
			</div>
		</div>
		
		 <div class="check-area"> 
			<div>
			    <div class="d-flex justify-content-center"> 
				<div class="select-title">원하는 지역을 선택해주세요</div>
				</div>
			</div>
			 
			<div class="justify-content-center" style="width: 100%;">
				<form name="areaform">
					<div>
						<select id="selectsigu" name="siguNum" class="form-select selectGu" > 
						  <option value=""> 자치구 </option> 
						  <c:forEach var="vo" items ="${listSigu}">
						  <option value ="${vo.siguNum}" ${vo.siguNum == dto.siguNum?"selected='selected'":""}>${vo.siguName}</option>
						  </c:forEach>
						  </select>
					</div>
					<div>
						<select id="selectdong" name="dongNum" class="form-select selectDong">
						 <option value="" ${condition=="all"?"selected='selected'":""}> 행정동 </option> 
						 </select>
					</div>
					 <div class="d-flex justify-content-center">
					 <button type="button" class="btn btn-primary btn-select" style="width: 40%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0"> 적용 </button>
				</div>
				</form>
			</div>
		</div>

	 
			<div id="form-stoCou-sales">
		    	<div class="check-area">
				<form name="form-stoCou-sales" method="post">
					<input type="hidden" name="category" value="">
					<input type="hidden" name="gu" value="">
					<div class="d-flex justify-content-center"> 
					<div class="select-title">원하는 업종을 선택해주세요.</div></div>
					<div class="d-flex justify-content-center">
						<input id="food" type="radio" role="tab" name="selectMenu1" value="CS1">
						<label for="food" class="div-4 selMenu-lavs" id="food-lav" data-val="CS1">외식업</label>
						<input id="service" type="radio" role="tab" name="selectMenu1" value="CS2">
						<label for="service" class="div-4 selMenu-lavs" id="service-lav" data-val="CS2">서비스업</label>
						<input id="retail" type="radio" role="tab" name="selectMenu1" value="CS3">
						<label for="retail" class="div-4 selMenu-lavs" id="retail-lav" data-val="CS3">소매업</label>
					</div>
					<div class="d-flex justify-content-center">
						<select id="selPlace" name="selectWork" class="form-select selectWork hideSel" style="margin-top: 5px;">			
						</select>	
					</div>
                   <div class="d-flex justify-content-center">
				 <button class="btn btn-primary btn-select-cate" type="button" style="width: 40%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0"> 적용 </button>
				</div>				
				</form>
			</div>
		</div>
		 <div id="form-budget" style="display: none">	
		   <div class="check-area">				
				<form name="form_budget" method="post">
					<input type="hidden" name="selectedMenu" value="">
					<input type="hidden" name="siguNum" value="">
					 
					<div class="select-title"> 임대료 </div>
					<div class="btn-group three-btn-group" role="group" aria-label="Basic radio toggle button group" style=" margin-left: 16px; width: 92%;">
						<div>  <input type="range" name='budget' class="form-range" id="budget-select"  min="500000" max="8000000" step="100000" name="budget"  list="budget_input">
 					            <span class="range-budget" id ="value"> 월 단위 임대료 :  <span class="rangebudget" ></span> 원 </span>
 							   <label class=budget  for="budget"></label>
 
							</div>
					</div>
					 
					   <div class="select-title">임대평수</div>
				   	   <div class="btn-group three-btn-group" role="group" aria-label="Basic radio toggle button group" style=" margin-left: 16px; width: 92%;">
						<input type="radio" class="btn-check" name="size" id="s_size" autocomplete="off" checked value="10">
						<label class="btn btn-outline-primary" for="s_size" style="border-radius: 12px 0 0 12px; font-size: 12px; font-weight: 600;">소형(10평대)</label>
						
					    <input type="radio" class="btn-check" name="size" id="m_size" autocomplete="off" value="20">
					    <label class="btn btn-outline-primary" for="m_size" style="font-size: 12px; font-weight: 600;">중형(20평대)</label>
					
					    <input type="radio" class="btn-check" name="size" id="l_size" autocomplete="off" value="30">  
					    <label class="btn btn-outline-primary" for="l_size" style="border-radius: 0 12px 12px 0; font-size: 12px; font-weight: 600;">대형(30평이상)</label>
					</div>
				</form>
				  <div class="d-flex justify-content-center">
				 <button class="btn btn-primary btn-select-budget" type="button" style="width: 40%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0"> 적용 </button>
				</div>
			</div>
		  </div>
		
		  <div id="form-target" style="display: none">	
		   <div class="check-area">				
				<form name="form_target" method="post">
					<input type="hidden" name="selectedMenu" value="">
					<input type="hidden" name="siguNum" value="">
					<div class="select-title"> 성별 </div>
					<div class="btn-group three-btn-group" role="group" aria-label="Basic radio toggle button group" style=" margin-left: 16px; width: 92%;">
						<input type="radio" class="btn-check" name="gender" id="allGender" autocomplete="off" checked value="allGender">
						<label class="btn btn-outline-primary" for="allGender" style="border-radius: 12px 0 0 12px; font-size: 12px; font-weight: 600;">전체 </label>
						
					    <input type="radio" class="btn-check" name="gender" id="male" autocomplete="off" value="male">
					    <label class="btn btn-outline-primary" for="male" style="font-size: 12px; font-weight: 600;">남자</label>
					
					    <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off" value="female">  
					    <label class="btn btn-outline-primary" for="female" style="border-radius: 0 12px 12px 0; font-size: 12px; font-weight: 600;">여자</label>
					</div>
					 
					  <div class="select-title">연령대</div>
				   	   <div class="btn-group five-btn-group" role="group" aria-label="Basic radio toggle button group" style=" margin-left: 12px; width: 92%;">
					    <input type="radio" class="btn-check" name="age" id="allAge" autocomplete="off" checked value="0">
					    <label class="btn btn-outline-primary" for="allAge" style="border-radius: 12px 0 0 12px; font-size: 10px; font-weight: 600; width: 45px; padding: 9px 6.5px;">전체</label>
					
					    <input type="radio" class="btn-check" name="age" id="age10" autocomplete="off" value="10">
					    <label class="btn btn-outline-primary" for="age10" style="font-size: 10px; font-weight: 600; width: 45px; padding: 9px 6.5px;">10대</label>
					    
					    <input type="radio" class="btn-check" name="age" id="age2030" autocomplete="off" value="2030">  
					    <label class="btn btn-outline-primary" for="age2030" style="font-size: 10px; font-weight: 600; width: 70px; padding: 9px 6.5px;">20~30대</label>
						    
					    <input type="radio" class="btn-check" name="age" id="age4050" autocomplete="off" value="4050">  
					    <label class="btn btn-outline-primary" for="age4050" style="font-size: 10px; font-weight: 600; width: 70px; padding: 9px 6.5px;">40~50대</label>
						    
					    <input type="radio" class="btn-check" name="age" id="age60" autocomplete="off" value="60">  
					    <label class="btn btn-outline-primary" for="age60" style="border-radius: 0 12px 12px 0; font-size: 10px; font-weight: 600; width: 72px; padding: 9px 6.5px;">60대 이상</label>
					</div>
				</form>
				 <div class="d-flex justify-content-center">
				 <button class="btn btn-primary btn-target" type="button" style="width: 40%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0"> 적용 </button> 
				</div>
			</div>
		   </div>
		
		

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=772eb01cb6c2f20c17fb9d3c64f74709"></script>

<script>

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
        strokeColor: '#FFFF',
        strokeOpacity: 0.8,
        fillColor: '#FFE400',
        fillOpacity: 0.7 
    });

    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});

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
        polygon.setOptions({fillColor: '#FFE400'});
        customOverlay.setMap(null);
    }); 

    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
        var content = '<div class="info">' + 
                    '   <div class="title">' + area.name + '</div>' +
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
	
 	
function showreport() {
	const f = document.areasubmitform;
	let str;

	str = f.siguNum.value;
	if (!str) {
		alert("지역을 선택하세요.");
		f.siguNum.focus();
		return;
	}
	
	str = f.dongNum.value;
	if (!str) {
		alert("행정동을 선택하세요.");
		f.dongNum.focus();
		return;
	}

	str = f.setcate.value;
	//alert(str);
	if (!str) {
		alert("업종을 선택하세요.");
		f.setcate.focus();
		return;
	}

	str = f.setbudget.value;
	if (!str) {
		alert("임대료를 선택하세요 ");
		f.setbudget.focus();
		return;

	}
	str = f.setsize.value;
	if (!str) {
		alert("임대평수 선택하세요 ");
		f.setsize.focus();
		return;	
	}
	str = f.setgender.value;
	if (!str) {
		alert("타겟층 정보를 입력하세요");
		f.setgender.focus();
		return;	
	}
	
	let query = $("form[name=areasubmitform]").serialize();
	let url = "${pageContext.request.contextPath}/matching/write";
	let dongNum = f.dongNum.value;
	let siguNum = f.siguNum.value;

	
	makeGraph(dongNum);
	makeGraph2(siguNum);

	const fn = function(data){
		let list = data.list;
	   
		let out = "";
		
		for(let item of list) {
			out += 
				"<div class='sglist flex-row'><span class='rank'>" 
				+ "</span><span class='sgname-info'>"+ item.sgGBName
				+ "</span><span class='list-budget'>"+ item.budget + " 원" + "</div> <hr class='line'>";
	
		}
		$("#report-banner").show();
		$("#matchingResult").html(out);
	
		
	};

	
	ajaxFun(url, "post", query, "json", fn);

	
}

//동 리스트 가져오기 
$(function(){
		$("form[name=areaform] select[name=siguNum]").change(function(){
			let siguNum = $(this).val();
			 $("form[name=areaform] select[name=dongNum]").find('option').remove().end()
					.append("<option value=''>행정동</option>");
				
			  if(! siguNum) {
					return false;
				}
				
				let url = "${pageContext.request.contextPath}/matching/listDong";
				let query = "siguNum="+siguNum;
				
				const fn = function(data) {
					
					console.log(data)
					$.each(data.listDong, function(index, item){
						let dongNum = item.dongNum;
						let dongName = item.dongName;
						let s = "<option value='"+dongNum+"'>"+dongName+"</option>";
						$("form[name=areaform] select[name=dongNum]").append(s);
					});
				};
				ajaxFun(url, "get", query, "json", fn);
			});
		});
		
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


	
$(function(){
	$("#btn-x").click(function(){
		$("#report").hide();
		$("#report-banner").hide();
	});
});
//임대료예산,면적 select 

//임대료 예산범위 

$(document).ready(function() {
    $('#budget-select').on('input', function(){
         v = $('#budget-select').val();
         $('span.rangebudget').text(v);
    });
});



//메뉴선택하기 
$(function(){
	$("#selPlace").hide;
	    
	});
		
	$("#category-lav").click(function(){
		$("#form-stoCou-sales").show();
		$("#form_budget").hide ();
		$("#form-size").hide ();
		$("#form-target").hide ();
		$("#selPlace").addClass("hideSel");
		$("select[name=selectWork]").val("all");
	});
		
	$("#budget-lav").click(function(){
		$("#form-stoCou-sales").hide();
		$("#form-budget").show();
		$("#form-size").hide ();
		$("#form-target").hide ();
		$("#selPlace").addClass("hideSel");
		$("select[name=selectWork]").val("all");
	});
	
	
	$("#target-lav").click(function(){
		$("#form-stoCou-sales").hide();
		$("#form-budget").hide();
		$("#form-target").show();
		$("#selectCate").addClass("hideSel");
		$("select[name=selectWork]").val("all");
	});
	


// 업종 select
$(function(){
	$("#allJob").click(function(){
		$("#selectCate").addClass("hideSel"); //모든업종클릭시 selplace삭제
		$("#selectCate").attr("name", "all"); //모든업종에All값주기 
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



// 지역적용하기 

$(function(){
	$(".btn-select").click(function(){
		let sigu = $("#selectsigu").val();
		let dong =  $("#selectdong").val();
		
		let siguName = $("#selectsigu :selected").text();
		let dongName =  $("#selectdong :selected").text();
		
		$("form[name=areasubmitform] input[name=siguName]").val("");
		$("form[name=areasubmitform] input[name=dongName]").val("");
		$("#getregion").html("");
		
		if(sigu != ""  && dong != "") {
			$("#getregion").html("서울시"+"  "+ siguName +"  " + dongName);
			$("form[name=areasubmitform] input[name=siguNum]").val(sigu);
			$("form[name=areasubmitform] input[name=dongNum]").val(dong);
	
		$('span.info-sigu').text(siguName)
		$('span.info-dong').text(dongName);
		}
		
		
	});
});

//타겟적용 

$(function(){
	$(".btn-target").click(function(){
		const f = document.form_target
		
		let s = "";
		let gender = ""
		for(let g of f.gender) {
			if(g.checked) {
				gender = g.value == "male" ? "남자" : (g.value == "female" ? "여자" : "전체");
			}
		}
		
		
		let age = "0"
		for(let g of f.age){
			if(g.checked){
				age = g.value 
			}
		}

		$("#gettarget").html("");
		$("form[name=areasubmitform] input[name=setgender]").val("");
		$("form[name=areasubmitform] input[name=setage]").val("");
		if(gender != ""  && age != "") {
			
			s = age == "0" ? "전체연령" : age + "대";
			$("#gettarget").html(s + "/" + gender);
			$("form[name=areasubmitform] input[name=setgender]").val(gender);
			$("form[name=areasubmitform] input[name=setage]").val(age);
		}
		
		
	});
});


//업종적용 

$(function(){
	$(".btn-select-cate").click(function(){
		let cate = $("#selPlace").val();
	
		let cateName = $("#selPlace :selected").text();
	
		$("form[name=areasubmitform] input[name=setcate]").val("");
		$("#getcate").html("");
	
		if(cate != "") {
			$("#getcate").html(cateName);
			$("form[name=areasubmitform] input[name=setcate]").val(cate);
		
		}

	});
});

//임대료 임대평수 적용 

$(function(){
	
	$(".btn-select-budget").click(function(){
		
		let budget = $("#budget-select").val();

		
		const f =document.form_budget
	
		let s = "";
		let size = "";
		
		for(let g of f.size) {
			if(g.checked) {
				size = g.value
			}
		}
		
		$("form[name=areasubmitform] input[name=setbudget]").val("");
		$("form[name=areasubmitform] input[name=setsize]").val("");
		$("#getbudget").html("");
		
		
		if(budget != "" && size!="" ) {
			$("#getbudget").html( budget +"원"+"/"+ size + "평대" );
			
			$("form[name=areasubmitform] input[name=setbudget]").val(budget);
			$("form[name=areasubmitform] input[name=setsize]").val(size);
		}	
	});
});



</script>