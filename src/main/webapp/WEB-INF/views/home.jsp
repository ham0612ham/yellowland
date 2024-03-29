<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
#footer-div { background: #EEEEEE; }
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/home_graph.js"></script>
	<div style="position: relative;">
		<div id="back-gray" style="position: absolute; z-index: -2;">
		</div>
			<div style="position: relative; left: 200px; top: -100px; z-index: -1;">
				<div class="circles circle-1">&nbsp;</div>
				<div class="circles circle-2">&nbsp;</div>
				<div class="circles circle-3">&nbsp;</div>
				<div class="circles circle-4">&nbsp;</div>
				<div class="circles circle-5">&nbsp;</div>
			</div>
			<div style="position: absolute; width: 100%; padding: auto;">
				<table class="table align-middle" style="width: 900px; margin: auto;">
					<tr style="height: 90px;"></tr>
					<tr style="margin-top: 70px;">
						<th class="main-title lh-sm" rowspan="3" style="border: none; width: 400px;">
							<div class="ab1-1"></div>
							<span class="text-bold ab1">상권 분석</span> 부터<br>
							<div class="ab2-1"></div>
							<span class="text-bold ab2">매물 확인</span> 까지<br>
							한 번에
							<div style="font-size: 18px; font-weight: 200; margin-top: 8px;">간편하고 편리한 서울시 상권분석 서비스</div>
						</th>
						
						<th rowspan="3" style="border: none; width: 40px;">
							<div>&nbsp;</div>
						</th>
						<th style="border: none" class="three-button">
							<div class="d-flex flex-row three-btn" id="gr-button"
								style="background-color: #36C88A; box-shadow: 0px 0px 10px rgb(54, 200, 138, 1.0); 
									margin-left: 30px; width: 310px;"
									onclick="location.href='${pageContext.request.contextPath}/commercial/map'">
								<div class="three-bigchar">뜨는 상권</div>
								<div class="three-smchar lh-sm">요즘 뜨는 주요 상권에 대한<br>확인과 분석을 해보세요</div>
							</div>
						</th>
					</tr>
					<tr>
						<th style="border: none" class="three-button">
							<div class="d-flex flex-row three-btn" id="pp-button"
								style="background-color: #756EF2; box-shadow: 0px 0px 10px rgb(117, 110, 242, 1.0); 
									margin-left: 150px; width: 330px;"
									onclick="location.href='${pageContext.request.contextPath}/matching/main'">
								<div class="three-bigchar">상권 매칭</div>
								<div class="three-smchar lh-sm">예비 사장님들을 위한 전략적이고<br>스마트한 창업분석</div>
							</div>
						</th>
					</tr>
					<tr>
						<th style="border: none" class="three-button">
							<div class="d-flex flex-row three-btn" id="bl-button"
								style="background-color: #49B3FF; box-shadow: 0px 0px 10px rgb(73, 179, 255, 1.0); 
									width: 370px;" onclick="${pageContext.request.contextPath}/analysis/area/main'">
								<div class="three-bigchar">상권 현황</div>
								<div class="three-smchar lh-sm">서울시 모든 곳의 상권 분석을<br>직접적인 수치로 확인해세요</div>
							</div>
						</th>
					</tr>
				</table>
			</div>
	</div>
	<div style="height: 700px;"></div>
	<div style="height: 550px; width: 100%; padding: auto;">
		<table class="table three-div1 hide" style="margin: auto; width: 900px;">
			<tr>
				<th style="border: none">&nbsp;</th>
				<th class="three-div1-img" rowspan="3" style="border: none">
					<img style="width: 300px; float: right;" src="${pageContext.request.contextPath}/resources/images/nav.png">
				</th>
			</tr>
			<tr>
				<th class="three-div1-text" style="border: none;">
					<div style="font-weight: 200; font-size: 40px">요즘 <span class="text-bold">핫한 상권</span>은 어디?</div>
					<div class="lh-sm" style="border: none; font-weight: 200; font-size: 18px;">요즘 뜨는 주요 상권에 대한 확인과<br>분석을 해보세요</div>
					<button class="btn btn-dark black-btn" onclick='location.href="${pageContext.request.contextPath}/commercial/map"'>뜨는 상권 바로가기</button>
				</th>
			</tr>
			<tr>
				<th style="border: none">&nbsp;</th>
			</tr>
		</table>
	</div>
	<div style="height: 550px; width: 100%; padding: auto;">
		<table class="table three-div2 hide" style="margin: auto; width: 900px;">
			<tr>
				<th class="three-div2-img" rowspan="3" style="border: none">
					<img style="width: 300px; float: left;" src="${pageContext.request.contextPath}/resources/images/report.png">
				</th>
				<th style="border: none">&nbsp;</th>
			</tr>
			<tr>
				<th class="three-div2-text" style="border: none;">
					<div style="font-weight: 200; font-size: 40px; text-align: right;">나에게 <span class="text-bold">딱 맞는 </span>곳, 어딜까?</div>
					<div class="lh-sm" style="border: none; font-weight: 200; font-size: 18px; text-align: right;">예비 사장님들을 위한 전략적이고<br>스마트한 창업분석</div>
					<button class="btn btn-dark black-btn" style="float: right;" onclick='location.href="${pageContext.request.contextPath}/matching/main"'>상권 매칭 바로가기</button>
				</th>
			</tr>
			<tr>
				<th style="border: none">&nbsp;</th>
			</tr>
		</table>
	</div>
	<div style="height: 550px; width: 100%; padding: auto;">
		<table class="table three-div3 hide" style="margin: auto; width: 900px;">
			<tr>
				<th style="border: none">&nbsp;</th>
				<th class="three-div3-img" rowspan="3" style="border: none">
					<img style="width: 300px; float: right;" src="${pageContext.request.contextPath}/resources/images/document.png">
				</th>
			</tr>
			<tr>
				<th class="three-div3-text" style="border: none;">
					<div style="font-weight: 200; font-size: 40px">자세한 <span class="text-bold">정보 </span>어디 없나?</div>
					<div class="lh-sm" style="border: none; font-weight: 200; font-size: 18px;">서울시 모든 곳의 상권 분석을<br>직접적인 수치로 확인해세요</div>
					<button class="btn btn-dark black-btn" onclick='location.href="${pageContext.request.contextPath}/analysis/area/main"'>상권 현황  바로가기</button>
				</th>
			</tr>
			<tr>
				<th style="border: none">&nbsp;</th>
			</tr>
		</table>
	</div>
	<div style="height: 550px; width: 100%; padding: auto;">
		<table class="table three-div4 hide" style="margin: auto; width: 900px;">
			<tr>
				<th class="three-div4-img" rowspan="3" style="border: none">
					<img style="width: 300px; float: left;" src="${pageContext.request.contextPath}/resources/images/contract.png">
				</th>
				<th style="border: none">&nbsp;</th>
			</tr>
			<tr>
				<th class="three-div4-text" style="border: none;">
					<div style="font-weight: 200; font-size: 40px; text-align: right;">괜찮은 <span class="text-bold">노른자 매물 </span>여기에!</div>
					<div class="lh-sm" style="border: none; font-weight: 200; font-size: 18px; text-align: right;">원하는 위치의 다양한 매물을<br>여기서 확인, 직접 연락해보세요</div>
					<button class="btn btn-dark black-btn" style="float: right;" onclick='location.href="${pageContext.request.contextPath}/assignComm/main"'>상가 양도 바로가기</button>
				</th>
			</tr>
			<tr>
				<th style="border: none">&nbsp;</th>
			</tr>
		</table>
	</div>
	<div class="graph-bottom">
		<div class="btn graph-title">서울시 상권 현황</div>
		<div class="d-flex flex-row select-div justify-content-center">
			<select name="siguNum" class="form-select">
				<option value="all" selected>자치구 전체</option>
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
			<select name="cateJobNum" class="form-select">
				<option value="all" selected>전체업종</option>
				<option value="CS1">외식업</option>
				<option value="CS2">서비스업</option>
				<option value="CS3">소매업</option>
			</select>
		</div>
		<div class="d-flex flex-row justify-content-center graphs-div">
			<div class="graphs" title="점포수">
				<div class="graphs-title">점포수</div>
				<div class="d-flex flex-row">
					<div class="graph1-box graph1" id="graph1-chart"></div>
					<div class="graph1-box graph1-text-div">
						<div class="graph1-text">&nbsp;</div>
						<div class="graph1-text">전체<span class="graph1-count" id="graph1-total1"></span></div>
						<div class="graph1-text"><span class="color-box1"></span>&nbsp;일반점포<span class="graph1-count" id="graph1-normal"></span></div>
						<div class="graph1-text"><span class="color-box2"></span>&nbsp;프렌차이즈<span class="graph1-count" id="graph1-fran"></span></div>
						<div class="graph1-text">&nbsp;</div>
						<div class="graph1-text">2022년 2분기<span class="graph1-count" id="graph1-total2">547,164 개</span></div>
						<div class="graph1-text">2021년 3분기<span class="graph1-count" id="graph1-total3">557,234 개</span></div>
					</div>
				</div>
			</div>
			<div class="graphs" title="매출액">
				<div class="graphs-title">매출액</div>
				<div class="d-flex flex-row justify-content-center" style="margin-top: 30px;">
					<div class="graph2-box graph2-green">
						<div class="graph2-title">전분기 대비</div>
						<div class="graph2-val" id="one-quart-before-chai"></div>
					</div>
					<div class="graph2-box graph2-purple">
						<div class="graph2-title">2022년 3분기</div>
						<div class="graph2-val" id="this-quart"></div>
					</div>
					<div class="graph2-box graph2-green">
						<div class="graph2-title">전년동분기 대비</div>
						<div class="graph2-val" id="one-year-before-chai"></div>
					</div>
				</div>
				<div class="graph2-bottom">
					<div>2022년 2분기<span class="graph2-total-val" style="float: right" id="one-quart-before"></span></div>
					<div>2021년 3분기<span class="graph2-total-val" style="float: right" id="one-year-before"></span></div>
				</div>
			</div>
			<div class="graphs" title="유동인구">
				<div class="graphs-title">유동인구</div>
				<div id="graph3-chart" style="">
				</div>
			</div>
		</div>
	</div>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
	
<script type="text/javascript">
$(function(){
	$(document).scroll(function(){
		let top = $(document).scrollTop();
			if(top > 250) {
				$(".three-div1").removeClass("hide");
				$(".three-div1").addClass("show");
				$(".three-div1-text").addClass("move");
				$(".three-div1-img").addClass("move");
			}
			
			if(top > 800) {
				$(".three-div2").removeClass("hide");
				$(".three-div2").addClass("show");
				$(".three-div2-text").addClass("move");
				$(".three-div2-img").addClass("move");
			}
			
			if(top > 1350) {
				$(".three-div3").removeClass("hide");
				$(".three-div3").addClass("show");
				$(".three-div3-text").addClass("move");
				$(".three-div3-img").addClass("move");
			}
			
			if(top > 1900) {
				$(".three-div4").removeClass("hide");
				$(".three-div4").addClass("show");
				$(".three-div4-text").addClass("move");
				$(".three-div4-img").addClass("move");
			}
			
			if(top <= 1900) {
				$(".three-div4").removeClass("show");
				$(".three-div4").addClass("hide");
				$(".three-div4-text").removeClass("move");
				$(".three-div4-img").removeClass("move");
			}
			
			if(top <= 1350) {
				$(".three-div3").removeClass("show");
				$(".three-div3").addClass("hide");
				$(".three-div3-text").removeClass("move");
				$(".three-div3-img").removeClass("move");
			}
			
			if(top <= 800) {
				$(".three-div2").removeClass("show");
				$(".three-div2").addClass("hide");
				$(".three-div2-text").removeClass("move");
				$(".three-div2-img").removeClass("move");
			}
			
			if(top <= 250) {
				$(".three-div1").removeClass("show");
				$(".three-div1").addClass("hide");
				$(".three-div1-text").removeClass("move");
				$(".three-div1-img").removeClass("move");
			}
	});
});


</script>

