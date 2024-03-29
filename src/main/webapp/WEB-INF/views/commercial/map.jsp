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
	margin-top: 20px; width: 320px;
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
#map { z-index: -3; width: 100vw; height: 100vh; position: absolute; top: 0px; }
#roadviewMap { z-index: -4; width: 100vw; height: 100vh; position: absolute; top: 0px; }
#close-roadviewMap { 
	position: absolute; cursor: pointer; z-index: -5;
	margin: 0px 6px; height: 30px; line-height: 14px;
	right: 10px; top: 15px;
	color: white; border-radius: 10px;
	font-size: 30px;
}
#analysis { 
	position: absolute; min-width: 500px; height: calc(100vh - 100px); 
	overflow: scroll; background: white; margin-left: 100%;
	right: 0px; top: 100px; z-index: 2;
}
#analysis-banner { 
	position: absolute; min-width: 500px;
	background: white; margin-left: 100%;
	right: 0px; top: 60px; z-index: 3;
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
	z-index: 3;
}
.marker-sales-total { 
	font-size: 11px; background: white; border-radius: 5px; margin: auto;
	color: #36C88A; text-align:center; padding:1px; width: 60px; margin-top: 2px;
	z-index: 3;
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
.rank-region { width: 140px; }
.rank-value { width: 120px; font-weight: 600; text-align: right; padding-right: 5px; }
.rank-percent { min-width: 60px; text-align: right; color: #36C88A; }
.rank-per-red{ color:#e02171 }
.horiz { margin: 3px 0; }
.show-hide-btn { float: right; cursor: pointer; margin-bottom: 3px; }
.show-hide-btn > img { padding-bottom: 5px; }
#analysis-info { margin: 5px 0; }
#analysis-info > .info-bold { margin-left: 16px; font-size: 13px; font-weight: 600; }
#analysis-info > .info-light { margin-left: 8px; font-size: 13px; }
.analysis-div { margin: 16px; }
.analy-title { font-size: 14px; margin-top: 70px; }
.analy-big-txt { font-size: 20px; font-weight: 600; margin-bottom: 5px; }
.analy-green-txt { color: #36C88A; }
.analy-graph { width: 100%; min-height: 300px; border: 0.3px solid #BBBBBB; }
.analy-discribe { border: 0.3px solid #BBBBBB; padding: 10px; margin-bottom: 10px; }
.analy-disc-text { font-size: 14px; color: #A9A9A9 }
#analysis-class { 
	text-align: center; font-size: 13px; margin: 10px 0; color: #BBBBBB;
}
.gr-text { color: #36C88A; font-weight: 600; }
.red-text {  color: #e02171; font-weight: 600; }
.bk-text {  color: #424242; font-weight: 600; }
.fl-right { float: right; }
.analy-graph-3div { width: 33%; min-height: 150px; border: 0.3px solid #BBBBBB; }
.analy-graph-3div-noline { width: 33%; min-height: 12px; font-size: 12px; text-align: center; }
.analy-graph-2div { width: 49%; min-height: 200px; border: 0.3px solid #BBBBBB; }
.analy-graph-2div-noline { width: 49%; min-height: 12px; font-size: 12px; text-align: center; }
.analy-graph-title { 
	font-size: 12px; position: relative; top: 25px; margin-left: 10px;
	margin-top: -10px; height: 15px;
}
#sungbyul-yoenryungbyul-yudongingu > div:first-child { top: 20px; }
.circle1 {
  border: 10px solid #36C88A; border-radius: 50%; z-inex:-1;
  position: absolute; top: -20px; left: -20px;
  width: 120px; height: 120px;
  animation: 
  	scale1 1s infinite ease-out,
  	fadeOut 1s infinite ease-out;
}
@keyframes scale1 {
  0%   { transform: scale(0.7) }
  100%  { transform: scale(1) }
}
@keyframes fadeOut {
  from { opacity: 0.5; }
  to {  opacity: 0; }
}
.active { color: #36C88A; font-weight: 600; }
.list-group-item.active { color: #36C88A; font-weight: 600; }
.plusminus-div { 
	position: absolute; cursor: pointer; z-index: 1;
	margin: 0px 6px; height: 30px; line-height: 14px;
	right: 10px; bottom: 15px; width: 65px
}
.plusminus {
	font-size: 30px; color: #36C88A; box-shadow: 0px 0px 5px rgb(0 0 0 / 20%); 
	background-color: #fff; border-radius: 10px;
}
.plusminus:hover {
	font-size: 30px; background-color: #36C88A; box-shadow: 0px 0px 5px rgb(0 0 0 / 20%); 
	color: #fff; border-radius: 10px;
}
#map-btns-div {
	position: absolute; cursor: pointer; z-index: 2;
	margin: 0px 6px; height: 15px; line-height: 14px;
	right: 10px; top: 115px; width: 85px;
}
.map-btns-divs { 
	font-size: 12px; padding: 5px 0px;
}
#btn-jihyung+label {
	border-top: 0.5px solid #fff;
	border-left: 0.5px solid #fff;
	border-right: 0.5px solid #fff;
	box-shadow: 0px 0px 5px rgb(0 0 0 / 20%); 
}
#btn-kyotong+label, #btn-roadview+label {
	border-bottom: 0.5px solid #fff;
	border-left: 0.5px solid #fff;
	border-right: 0.5px solid #fff;
	box-shadow: 0px 0px 5px rgb(0 0 0 / 20%); 
}
#btn-jihyung:checked+label, #btn-jihyung:hover+label {
	border-top: 0.5px solid #36C88A;
	border-left: 0.5px solid #36C88A;
	border-right: 0.5px solid #36C88A;
}
#btn-kyotong:checked+label, #btn-roadview:checked+label, 
#btn-kyotong:hover+label, #btn-roadview:hover+label {
	border-bottom: 0.5px solid #36C88A;
	border-left: 0.5px solid #36C88A;
	border-right: 0.5px solid #36C88A;
}

</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
<script type="text/javascript">
	

</script>

<div class="header-white"></div>
<div class="container" style="margin: 0px;">
	<div class="body-container">
	
		<div id="analysis-banner" style="opacity: 0;">
			<div id="green-div" class="d-flex justify-content-between">
				<span>분석 리포트</span>
				<span style="width: 350px;">&nbsp;</span>
				<span><img id="btn-x"  src='${pageContext.request.contextPath}/resources/images/x.png'></span>
			</div>
			
			<div id="analysis-class" class="d-flex justify-content-between">
				<a class="list-group-item list-group-item-action" href="#list-item-1">업종분석</a>
      			<a class="list-group-item list-group-item-action" href="#list-item-2">매출분석</a>
     			<a class="list-group-item list-group-item-action" href="#list-item-3">인구분석</a>
			</div>
			
			<div id="analysis-info">
				<span class="info-bold">위치</span>
				<span class="info-light" id="info-region">일일동</span>
				<span class="info-bold">업종</span>
				<span class="info-light" id="info-job">업종전체</span>
			</div>
			
		</div>
			
		<div id="analysis" data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0" style="opacity: 0;">
			<div>&nbsp;</div>
			<div class="analysis-div" id="list-item-1">
				<div class="analy-title">점포수</div>
				<div class="analy-big-txt">점포수는 <span class="analy-green-txt" id="zumposu-result"></span> 입니다.</div>
				<div class="analy-graph" id="zumposu">
					<div class="d-flex justify-content-center" style="position: relative; top: 120px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div">
				<div class="analy-title">개업수</div>
				<div class="analy-big-txt">개업수는 <span class="analy-green-txt" id="geupsu-result"></span> 입니다.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span>전년 동분기 대비</span><span class="fl-right" id="geupsu-year-count"></span>
					</div>
					<div class="analy-disc-text">
						<span>전분기 대비</span><span class="fl-right" id="geupsu-quart-count"></span>
					</div>
				</div>
				<div class="analy-graph" id="geupsu">
					<div class="d-flex justify-content-center" style="position: relative; top: 120px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div">
				<div class="analy-title">폐업수</div>
				<div class="analy-big-txt">폐업수는 <span class="analy-green-txt" id="pyeupsu-result"></span> 입니다.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span>전년 동분기 대비</span><span class="fl-right" id="pyeupsu-year-count"></span>
					</div>
					<div class="analy-disc-text">
						<span>전분기 대비</span><span class="fl-right" id="pyeupsu-quart-count"></span>
					</div>
				</div>
				<div class="analy-graph" id="pyeupsu">
					<div class="d-flex justify-content-center" style="position: relative; top: 120px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div">
				<div class="analy-title">업종분포 현황</div>
				<div class="analy-big-txt"><span class="analy-green-txt upzongbunpo-job-first"></span>이 가장 많고 <span class="analy-green-txt upzongbunpo-job-grow"></span>이 증가 추세입니다.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span><span class="gr-text upzongbunpo-job upzongbunpo-job-first"></span>이 가장 많고, <span class="gr-text upzongbunpo-job-grow"></span>이 증가 추세입니다.</span>
					</div>
				</div>
				<div class="analy-graph" id="upzongbunpo" style="padding: 10px; height: 250px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 110px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div" id="list-item-2">
				<div class="analy-title">매출액</div>
				<div class="analy-big-txt">점포당 월평균 매출액은 <span class="analy-green-txt" id="mechulak-ave"></span> 입니다.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span>전년 동분기 대비</span><span class="fl-right" id="mechulak-quart"></span>
					</div>
					<div class="analy-disc-text">
						<span>전분기 대비</span><span class="fl-right" id="mechulak-year"></span>
					</div>
				</div>
				<div class="analy-graph" id="mechulak" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 110px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div">
				<div class="analy-title">매출건수</div>
				<div class="analy-big-txt">월평균 매출건수는 <span class="analy-green-txt" id="mechulgunsu-month-ave"></span> 입니다.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span>전년 동분기 대비</span><span class="gr-text fl-right" id="mechulgunsu-quart"></span>
					</div>
					<div class="analy-disc-text">
						<span>전분기 대비</span><span class="red-text fl-right" id="mechulgunsu-year"></span>
					</div>
				</div>
				<div class="analy-graph" id="mechulgunsu" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 110px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div">
				<div class="analy-title">요일별 매출</div>
				<div class="analy-big-txt">선택상권은 <span class="gr-text yoilbyul-muchul-yoil"></span>에 가장 고객이 많았습니다.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span><span class="gr-text yoilbyul-muchul-yoil"></span>에 가장 매출이 높습니다.</span>
					</div>
				</div>
				<div class="analy-graph" id="yoilbyul-muchul" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 110px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div">
				<div class="analy-title">시간대별 매출</div>
				<div class="analy-big-txt"><span class="gr-text sigandebuel-mechul-highest"></span> 매출이 가장 높아요.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span><span class="gr-text sigandebuel-mechul-highest"></span> 매출이 가장 높습니다.</span>
					</div>
				</div>
				<div class="analy-graph" id="sigandebuel-mechul" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 110px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div">
				<div class="analy-title">성별 매출</div>
				<div class="analy-big-txt"><span class="gr-text sungbuel-mechul-result"></span><span class="gr-text sungbuel-mechul-percent"></span> 매출이 높아요</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span>선택 상권은 <span class="gr-text sungbuel-mechul-result"></span><span class="gr-text sungbuel-mechul-percent"></span> 고객이 많은 상권입니다. <span class="gr-text sungbuel-mechul-result">남성</span> 고객의 방문에 도움이 되는 요소에보다 많은 투자를 고려하세요.</span>
					</div>
				</div>
				<div class="analy-graph" id="sungbuel-mechul" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 110px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
				<div class="d-flex justify-content-between" style="margin-top: -25px; position: relative; top: 25px;">
					<div class="analy-graph-3div-noline" style="padding-top: 10px;"><span>외식업</span></div>
					<div class="analy-graph-3div-noline" style="padding-top: 10px;"><span>서비스업</span></div>
					<div class="analy-graph-3div-noline" style="padding-top: 10px;"><span>소매업</span></div>
				</div>
				<div class="d-flex justify-content-between" style="margin-top: 2px;">
					<div class="analy-graph-3div" id="sungbuel-mechul-food" style="padding-top: 10px;">
						<div class="d-flex justify-content-center" style="position: relative; top: 50px;">
							<div class="spinner-border text-primary" role="status"></div>
						</div>
					</div>
					<div class="analy-graph-3div" id="sungbuel-mechul-service" style="padding-top: 10px;">
						<div class="d-flex justify-content-center" style="position: relative; top: 50px;">
							<div class="spinner-border text-primary" role="status"></div>
						</div>
					</div>
					<div class="analy-graph-3div" id="sungbuel-mechul-retail" style="padding-top: 10px;">
						<div class="d-flex justify-content-center" style="position: relative; top: 50px;">
							<div class="spinner-border text-primary" role="status"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div">
				<div class="analy-title">연령대별 매출</div>
				<div class="analy-big-txt">선택상권의 <span class="gr-text yoenryungbyul-mechul-cate"></span><span class="gr-text yoenryungbyul-mechul-age"></span><span class="gr-text yoenryungbyul-mechul-percent"></span>에 가장 고객이 많았습니다.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span>선택상권의 <span class="gr-text yoenryungbyul-mechul-cate2"></span>은 <span class="gr-text yoenryungbyul-mechul-age"></span><span class="gr-text yoenryungbyul-mechul-percent"></span>가 가장 활발한 소비를 보입니다.</span>
					</div>
				</div>
				<div class="analy-graph-title" style="margin-top: -15px;">외식업</div>
				<div class="analy-graph" id="yoenryungbyul-mechul-food" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 120px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
				<div class="analy-graph-title">서비스업</div>
				<div class="analy-graph" id="yoenryungbyul-mechul-service" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 120px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
				<div class="analy-graph-title">소매업</div>
				<div class="analy-graph" id="yoenryungbyul-mechul-retail" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 120px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
			<div class="analysis-div" id="list-item-3">
				<div class="analy-title">성별, 연령별 유동인구</div>
				<div class="analy-big-txt"><span class="gr-text sungbyul-yoenryungbyul-yudongingu-gender"></span><span class="gr-text sungbyul-yoenryungbyul-yudongingu-age"></span><span class="gr-text sungbyul-yoenryungbyul-yudongingu-percent"></span>유동인구가 가장 많아요.</div>
				<div class="analy-graph" id="sungbyul-yoenryungbyul-yudongingu" style="padding-top: 10px; height: 400px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 160px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div>
			
<!-- 			<div class="analysis-div">
				<div class="analy-title">주거인구 수</div>
				<div class="analy-big-txt">주거인구 수는 <span class="analy-green-txt" id="gugeoingu-su-result"></span>입니다.</div>
				<div class="analy-discribe">
					<div class="analy-disc-text">
						<span>전년 동분기 대비</span><span class="gr-text fl-right" id="gugeoingu-su-year"></span>
					</div>
					<div class="analy-disc-text">
						<span>전분기 대비</span><span class="red-text fl-right" id="gugeoingu-su-quart"></span>
					</div>
				</div>
				<div class="analy-graph" id="gugeoingu-su" style="padding-top: 10px;">
					<div class="d-flex justify-content-center" style="position: relative; top: 120px;">
						<div class="spinner-border text-primary" role="status"></div>
					</div>
				</div>
			</div> -->
			
			<div style="height: 70px;"></div>
			
			
			
		</div>
		
		<div id="map"></div>
		<div id="roadviewMap"></div>
		<i class="bi bi-x-square-fill" id="close-roadviewMap"></i>
		<div class="check-area">
		
			<div>
				<div class="title">뜨는 상권</div>
			</div>
			
			<div class="justify-content-center" style="width: 100%;">
				<div>
					<select name="categoryGu" class="form-select selectGu" id="select-Gu">
						<option value="all">자치구 전체</option>
						<option value="11110">종로구</option>
						<option value="11140">중구</option>
						<option value="11170">용산구</option>
						<option value="11200">성동구</option>
						<option value="11215">광진구</option>
						<option value="11230">동대문구</option>
						<option value="11260">중랑구</option>
						<option value="11290">성북구</option>
						<option value="11305">강북구</option>
						<option value="11320">도봉구</option>
						<option value="11350">노원구</option>
						<option value="11380">은평구</option>
						<option value="11410">서대문구</option>
						<option value="11440">마포구</option>
						<option value="11470">양천구</option>
						<option value="11500">강서구</option>
						<option value="11530">구로구</option>
						<option value="11545">금천구</option>
						<option value="11560">영등포구</option>
						<option value="11590">동작구</option>
						<option value="11620">관악구</option>
						<option value="11650">서초구</option>
						<option value="11680">강남구</option>
						<option value="11710">송파구</option>
						<option value="11740">강동구</option>
					</select>
				</div>
				<div class="d-flex justify-content-center">
					<input id="hotDong" type="radio" name="selectOne" checked>
					<label for="hotDong" class="div-2" ><span>뜨는 동네</span></label>
					<input id="rentDong" type="radio" name="selectOne">
					<label for="rentDong" class="div-2"><span>임대료 분석</span></label>
				</div>
				<div class="nav nav-pills btn-group d-flex justify-content-center" role="tablist" id="select-radio">
					<input class="nav-link active" id="stoCou" type="radio" role="tab" aria-controls="v-pills-home" name="selectMenu" value="stoCou" checked>
				    <label for="stoCou" class="div-4 selectMenu" id="stoCou-lav">점포수</label>
				    <input class="nav-link" id="sales" type="radio" role="tab" name="selectMenu" value="sales">
				    <label for="sales" class="div-4 selectMenu" id="sales-lav">매출</label>
				    <input class="nav-link" id="mPop" type="radio" role="tab" name="selectMenu" value="mPop">
					<label for="mPop" class="div-4 selectMenu" id="mPop-lav">유동인구</label>
				    <input class="nav-link" id="hPop" type="radio" role="tab" name="selectMenu" value="hPop">
				    <label for="hPop" class="div-4 selectMenu" id="hPop-lav">주거인구</label>
				</div>
			</div>
		</div>
		
		<div class="check-area check-area-2">
		
			<div id="form-stoCou-sales">
				<form name="form-stoCou-sales">
					<input type="hidden" name="selectedMenu" value="">
					<input type="hidden" name="siguNum" value="">
					<div class="select-title">업종</div>
					<div class="d-flex justify-content-center">
						<input id="allJob" type="radio" name="selectMenu1" checked value="all">
						<label for="allJob" class="div-4 selMenu-lavs" id="allJob-lav" data-val="all">전체</label>
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
					<button type="button" class="btn btn-primary btn-send" style="width: 92%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0">검색</button>
				</form>
			</div>
			
			<div id="form-Pop" style="display: none">
				<form name="form-Pop">
					<input type="hidden" name="selectedMenu" value="">
					<input type="hidden" name="siguNum" value="">
					<div class="select-title">성별</div>
					<div class="btn-group three-btn-group" role="group" aria-label="Basic radio toggle button group" style=" margin-left: 12px; width: 92%;">
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
						
					    <input type="radio" class="btn-check" name="week" id="weekdays" autocomplete="off" value="weekdays">
					    <label class="btn btn-outline-primary" for="weekdays" style="font-size: 12px; font-weight: 600;">주중</label>
						
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
					<button type="button" class="btn btn-primary btn-send" style="width: 92%; font-size: 12px; border-radius: 12px; margin: 20px 12px 0">검색</button>
				</form>
			</div>
		</div>
		
		<div class="check-area">
			<div class="rank-title">
				<span>순위 TOP 10</span>
				<span class="show-hide-btn"><img style='width: 12px;' src='${pageContext.request.contextPath}/resources/images/hide_btn.png'></span>
			</div>
			<div class="rank-dis" style="margin-top: 3px;"><span class="hole-rank-title">전체</span><span class="hole-rank-quarter" id="kijun">2022년 3분기 기준</span></div>
			<div class="rank-div" id="rank-lists" style="max-height: 150px; overflow: scroll;">
				<div class="d-flex justify-content-center">
					<div class="spinner-border text-primary" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
				</div>
				<!-- <div class='ranks d-flex flex-row'>
					<div class='rank'>1</div>
					<div class='rank-region'>일일동</div>
					<div class='rank-value'>100억</div>
					<div class='rank-percent'>3.6% ↑</div>
				</div>
				<hr class='horiz'>
				-->
			</div>
		</div>
		<div class="plusminus-div d-flex justify-content-between">
			<i class="plusminus bi bi-plus-square-fill" id="plus-size"></i>
			<i class="plusminus bi bi-dash-square-fill" id="minus-size"></i>
		</div>
		
		<input type="hidden" name="lat-size" value="37.5729503">
		<input type="hidden" name="long-size" value="126.9793579">
		<input type="hidden" name="map-level" value="8">
		
		<div class="btn-group-vertical" role="group" aria-label="Vertical button group" id="map-btns-div">
			<input type="checkbox" class="btn-check" id="btn-jihyung" autocomplete="off">
			<label class="btn btn-primary map-btns-divs" for="btn-jihyung">지형도</label>
			<input type="checkbox" class="btn-check" id="btn-kyotong" autocomplete="off">
			<label class="btn btn-primary map-btns-divs" for="btn-kyotong">교통정보</label>
			<input type="checkbox" class="btn-check" id="btn-roadview" autocomplete="off">
			<label class="btn btn-primary map-btns-divs" for="btn-roadview">로드뷰</label>
		</div>
		<input type="hidden" name="jihyung" value="no">
		<input type="hidden" name="kyotong" value="no">
		<input type="hidden" name="roadview" value="no">
<%-- 	 	<div class='marker' data-val=''>
			<div class=""></div>
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

$(function(){
	$("#analysis").hide();
	$("#analysis-banner").hide();
});

function makeMap(level, lat1, long1, obj){
	var mapContainer = document.getElementById('map'),
	mapOption = { 
	    center: new kakao.maps.LatLng(lat1, long1),
	    level: level
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var positions = obj;
	
	for (var i = 0; i < positions.length; i ++) {
		var customOverlay = new kakao.maps.CustomOverlay({
		    position: positions[i].latlng,
		    content: positions[i].content,
		    xAnchor: 0.3,
		    yAnchor: 0.91
		});
		customOverlay.setMap(map);
	}
	
	let jihyung = $("input[name=jihyung]").val();
	let kyotong = $("input[name=kyotong]").val();
	let roadview = $("input[name=roadview]").val();
	
	if(jihyung === "yes") {
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);    
	} else {
		map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);
	}
	
	if(kyotong === "yes") {
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
	} else {
		map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);   
	}
	
	if(roadview === "yes") {
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW); 
		
		$("#close-roadviewMap").css("z-index", "5");
		var mapCenter = new kakao.maps.LatLng(lat1 , long1)
		
		var rvContainer = document.getElementById('roadviewMap'); //로드뷰를 표시할 div
		var rv = new kakao.maps.Roadview(rvContainer); //로드뷰 객체
		var rvClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		toggleRoadview(mapCenter);

		// 마커 이미지를 생성합니다.
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

		// 드래그가 가능한 마커를 생성합니다.
		var rvMarker = new kakao.maps.Marker({
		    image : markImage,
		    position: mapCenter,
		    draggable: true,
		    map: map
		});

		//마커에 dragend 이벤트를 할당합니다
		kakao.maps.event.addListener(rvMarker, 'dragend', function(mouseEvent) {
		    var position = rvMarker.getPosition(); //현재 마커가 놓인 자리의 좌표
		    toggleRoadview(position); //로드뷰를 토글합니다
		});

		//지도에 클릭 이벤트를 할당합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent){
		    
		    // 현재 클릭한 부분의 좌표를 리턴 
		    var position = mouseEvent.latLng; 

		    rvMarker.setPosition(position);
		    toggleRoadview(position); //로드뷰를 토글합니다
		});

		//로드뷰 toggle함수
		function toggleRoadview(position){

		    //전달받은 좌표(position)에 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄웁니다
		    rvClient.getNearestPanoId(position, 50, function(panoId) {
		        if (panoId === null) {
		            rvContainer.style.display = 'none'; //로드뷰를 넣은 컨테이너를 숨깁니다
		            mapContainer.style.width = '100%';
		            map.relayout();
		        } else {
		        	mapContainer.style.width = '100%';
		            map.relayout(); //지도를 감싸고 있는 영역이 변경됨에 따라, 지도를 재배열합니다
		            rvContainer.style.display = 'block'; //로드뷰를 넣은 컨테이너를 보이게합니다
		            rv.setPanoId(panoId, position); //panoId를 통한 로드뷰 실행
		            rv.relayout(); //로드뷰를 감싸고 있는 영역이 변경됨에 따라, 로드뷰를 재배열합니다
		        }
		    });
		    $("#roadviewMap").css("position", "absolute");
		}
	} else {
		map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);    
	}
	
	kakao.maps.event.addListener(map, 'mouseup', function() {

	    var level = map.getLevel();

	    var latlng = map.getCenter(); 

	    $("input[name=lat-size]").val(latlng.getLat());
	    $("input[name=long-size]").val(latlng.getLng());
	    $("input[name=map-level]").val(level);
	    
	});
}



$(function(){
	$("#plus-size").click(function(){
		let map_lat = $("input[name=lat-size]").val();
		let map_long = $("input[name=long-size]").val();
		let map_level = Number($("input[name=map-level]").val())-1;
		
		$("input[name=map-level]").val(map_level);
			
		makeMap(map_level, map_lat, map_long, obj);
	});
	$("#minus-size").click(function(){
		let map_lat = $("input[name=lat-size]").val();
		let map_long = $("input[name=long-size]").val();
		let map_level = Number($("input[name=map-level]").val())+1;
			
		$("input[name=map-level]").val(map_level);
			
		makeMap(map_level, map_lat, map_long, obj);
	});
	
	$("#btn-jihyung").click(function(){
		let map_lat = $("input[name=lat-size]").val();
		let map_long = $("input[name=long-size]").val();
		let map_level = Number($("input[name=map-level]").val());
		let jihyung = $("input[name=jihyung]").val();
		
		if(jihyung === "no") {
			$("input[name=jihyung]").val("yes");
		} else {
			$("input[name=jihyung]").val("no");
		}
			
		makeMap(map_level, map_lat, map_long, obj);
	});
	
	$("#btn-kyotong").click(function(){
		let map_lat = $("input[name=lat-size]").val();
		let map_long = $("input[name=long-size]").val();
		let map_level = Number($("input[name=map-level]").val());
		let kyotong = $("input[name=kyotong]").val();
		
		if(kyotong === "no") {
			$("input[name=kyotong]").val("yes");
		} else {
			$("input[name=kyotong]").val("no");
		}
			
		makeMap(map_level, map_lat, map_long, obj);
	});
	
	$("#btn-roadview").click(function(){
		let map_lat = $("input[name=lat-size]").val();
		let map_long = $("input[name=long-size]").val();
		let map_level = Number($("input[name=map-level]").val());
		let roadview = $("input[name=roadview]").val();
		
		if(roadview === "no") {
			$("input[name=roadview]").val("yes");
			$("#roadviewMap").css("z-index", 3);
		} else {
			$("input[name=roadview]").val("no");
			$("#roadviewMap").css("z-index", -4);
		}
			
		makeMap(map_level, map_lat, map_long, obj);
	});
	
	$("#close-roadviewMap").click(function(){
		let map_lat = $("input[name=lat-size]").val();
		let map_long = $("input[name=long-size]").val();
		let map_level = Number($("input[name=map-level]").val());
		let roadview = $("input[name=roadview]").val();
		
		$("input[name=roadview]").val("no");
		$("#roadviewMap").css("z-index", -4);
			
		makeMap(map_level, map_lat, map_long, obj);
		$("#close-roadviewMap").css("z-index", -5);
		$("#btn-roadview").prop("checked", false);
	})
	
});

var obj = [];

$(function(){
	let level = 8;
	let lat1 = 37.5729503;
	let long1 = 126.9793579;
	makeMap(level, lat1, long1, obj);
});


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

// 마커 hover, click 이벤트
$(function(){
	$("body").on("mouseenter", ".marker", function() {
		$(this).find(".marker-region-name").css("background", "white");
		$(this).find(".marker-region-name").css("color", "#36C88A");
		$(this).find(".marker-sales-total").css("background", "#36C88A");
		$(this).find(".marker-sales-total").css("color", "white");
		$(this).find("div").first().addClass("circle1");
	});
	
	$("body").on("mouseleave", ".marker", function() {
		$(this).find(".marker-region-name").css("background", "#36C88A");
		$(this).find(".marker-region-name").css("color", "white");
		$(this).find(".marker-sales-total").css("background", "white");
		$(this).find(".marker-sales-total").css("color", "#36C88A");
		$(this).find("div").first().removeClass("circle1");
	});
	
	$("body").on("click", ".marker", function() {
		let long1 = $(this).attr("data-long");
		let lat1 = $(this).attr("data-lat");
		let dongNum = $(this).attr("data-val");
		
		$("#analysis").scrollTop(0);
		makeMap(3, lat1, long1, obj);
		
		makeReport(dongNum);
	});
	
});

// 마커 click 이벤트
$(function(){
	$("body").on("click", ".marker", function() {
		$("#analysis").show();
		$("#analysis-banner").show();
		$("#analysis").css("opacity", 1);
		$("#analysis-banner").css("opacity", 1);
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
		$("#analysis-banner").hide();
	});
});

$(function(){
	$("#selPlace").hide;
	
	$("#allJob").click(function(){
		$("select[name=selectWork]").val("all");
	});
	
	$(".selectMenu").click(function(){
		$("#analysis").hide();
		$("#analysis-banner").hide();
	});
	
	$("#stoCou-lav").click(function(){
		$("#form-stoCou-sales").show();
		$("#form-Pop").hide();
		$("input[name=selectMenu1]#allJob").prop("checked", true);
		$("#selPlace").addClass("hideSel");
		// $("select[name=selectWork]").find("option[value='all']").prop("selected", true);
		$("select[name=selectWork]").val("all");
	});
	$("#sales-lav").click(function(){
		$("#form-stoCou-sales").show();
		$("#form-Pop").hide();
		$("input[name=selectMenu1]#allJob").prop("checked", true);
		$("#selPlace").addClass("hideSel");
		$("select[name=selectWork]").val("all");
	});
	$("#mPop-lav").click(function(){
		$("#form-stoCou-sales").hide();
		$("#form-Pop").show();
		$(".weekSel").removeClass("hideSel");
		$("input[name=gender]#allGender").prop("checked", true);
		$("input[name=week]#allWeek").prop("checked", true);
		$("input[name=age]#allAge").prop("checked", true);
	});
	$("#hPop-lav").click(function(){
		$("#form-stoCou-sales").hide();
		$("#form-Pop").show();
		$(".weekSel").addClass("hideSel");
		$("input[name=gender]#allGender").prop("checked", true);
		$("input[name=age]#allAge").prop("checked", true);
	});
});

// 업종 select
$(function(){
	$("#allJob").click(function(){
		$("#selPlace").addClass("hideSel");
	});
	
	$(".selMenu-lavs").click(function(){
		let url = "${pageContext.request.contextPath}/bringcate/job";
		let query;
		let innerHtml;
		
		if ($(this).attr("data-val") === "all") {
			return;
		} else if ($(this).attr("data-val") === "CS1") {
			query = "cateJobNum=CS1";
			innerHtml += "<option value='all'>전체 외식업</option>";
		} else if ($(this).attr("data-val") === "CS2") {
			query = "cateJobNum=CS2";
			innerHtml += "<option value='all'>전체 서비스업</option>";
		} else if ($(this).attr("data-val") === "CS3") {
			query = "cateJobNum=CS3";
			innerHtml += "<option value='all'>전체 소매업</option>";
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

// 점포수 / 매출 / 유동인구 / 주거인구 바꾸면, name="selectedMenu"도 함께 바꿈	
$(function(){
	$(function(){
		$("input[name=selectMenu]").change(function(){
			$("input[name=selectedMenu]").val($(this).val());
		});	
	});
});

</script>