<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div style="position: relative;">
		<div id="back-gray" style="position: absolute; z-index: -2;">
		</div>
			<div style="position: relative; left: 100px; top: -100px; z-index: -1;">
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
							<div class="btn d-flex flex-row three-btn" 
								style="background-color: #36C88A; box-shadow: 0px 0px 10px rgb(54, 200, 138, 1.0); 
									margin-left: 30px; width: 300px;">
								<div class="three-bigchar">뜨는 상권</div>
								<div class="three-smchar lh-sm">요즘 뜨는 주요 상권에 대한<br>확인과 분석을 해보세요</div>
							</div>
						</th>
					</tr>
					<tr>
						<th style="border: none" class="three-button">
							<div class="btn d-flex flex-row three-btn" 
								style="background-color: #756EF2; box-shadow: 0px 0px 10px rgb(117, 110, 242, 1.0); 
									margin-left: 150px; width: 320px;">
								<div class="three-bigchar">상권 매칭</div>
								<div class="three-smchar lh-sm">원하는 위치 주변의 상권 분석과<br>다양한 통계를 확인하세요</div>
							</div>
						</th>
					</tr>
					<tr>
						<th style="border: none" class="three-button">
							<div class="btn d-flex flex-row three-btn" 
								style="background-color: #49B3FF; box-shadow: 0px 0px 10px rgb(73, 179, 255, 1.0); 
									width: 330px;">
								<div class="three-bigchar">상권 분석</div>
								<div class="three-smchar lh-sm">예비 사장님들을 위한 전략적이고<br>스마트한 창업분석</div>
							</div>
						</th>
					</tr>
				</table>
			</div>
	</div>
	<div style="height: 700px;"></div>
	<div style="height: 600px; width: 100%; padding: auto;">
		<table class="table three-div1 hide" style="margin: auto; width: 900px;">
			<tr>
				<th style="border: none">&nbsp;</th>
				<th class="three-div1-img" rowspan="3" style="border: none">
					<img style="width: 300px; float: right;" src="${pageContext.request.contextPath}/resources/images/message.png">
				</th>
			</tr>
			<tr>
				<th class="three-div1-text" style="border: none;">
					<div style="font-weight: 200; font-size: 40px">요즘 <span class="text-bold">핫한 상권</span>은 어디?</div>
					<div class="lh-sm" style="border: none; font-weight: 200; font-size: 18px;">요즘 뜨는 주요 상권에 대한 확인과<br>분석을 해보세요</div>
					<button class="btn btn-dark black-btn">뜨는 상권 바로가기</button>
				</th>
			</tr>
			<tr>
				<th style="border: none">&nbsp;</th>
			</tr>
		</table>
	</div>
	<div style="height: 600px; width: 100%; padding: auto;">
		<table class="table three-div2 hide" style="margin: auto; width: 900px;">
			<tr>
				<th class="three-div2-img" rowspan="3" style="border: none">
					<img style="width: 300px; float: left;" src="${pageContext.request.contextPath}/resources/images/report.png">
				</th>
				<th style="border: none">&nbsp;</th>
			</tr>
			<tr>
				<th class="three-div2-text" style="border: none;">
					<div style="font-weight: 200; font-size: 40px; text-align: right;">내가 <span class="text-bold">점찍은 </span>곳, 어떨까?</div>
					<div class="lh-sm" style="border: none; font-weight: 200; font-size: 18px; text-align: right;">원하는 위치 주변의 상권 분석과<br>다양한 통계를 확인하세요</div>
					<button class="btn btn-dark black-btn" style="float: right;">상권 매칭 바로가기</button>
				</th>
			</tr>
			<tr>
				<th style="border: none">&nbsp;</th>
			</tr>
		</table>
	</div>
	<div style="height: 600px; width: 100%; padding: auto;">
		<table class="table three-div3 hide" style="margin: auto; width: 900px;">
			<tr>
				<th style="border: none">&nbsp;</th>
				<th class="three-div3-img" rowspan="3" style="border: none">
					<img style="width: 300px; float: right;" src="${pageContext.request.contextPath}/resources/images/nav.png">
				</th>
			</tr>
			<tr>
				<th class="three-div3-text" style="border: none;">
					<div style="font-weight: 200; font-size: 40px">자세한 <span class="text-bold">정보 </span>어디 없나?</div>
					<div class="lh-sm" style="border: none; font-weight: 200; font-size: 18px;">예비 사장님들을 위한 전략적이고<br>스마트한 창업분석</div>
					<button class="btn btn-dark black-btn">상권 분석  바로가기</button>
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
			<select name="#" class="form-select">
				<option selected>자치구 전체</option>
				<option value="">종로구</option>
				<option value="">중구</option>
				<option value="">용산구</option>
				<option value="">성동구</option>
				<option value="">광진구</option>
				<option value="">동대문구</option>
				<option value="">중랑구</option>
				<option value="">성북구</option>
				<option value="">강북구</option>
				<option value="">도봉구</option>
				<option value="">노원구</option>
				<option value="">은평구</option>
				<option value="">서대문구</option>
				<option value="">마포구</option>
				<option value="">양천구</option>
				<option value="">강서구</option>
				<option value="">구로구</option>
				<option value="">금천구</option>
				<option value="">영등포구</option>
				<option value="">동작구</option>
				<option value="">관악구</option>
				<option value="">서초구</option>
				<option value="">강남구</option>
				<option value="">송파구</option>
				<option value="">강동구</option>
			</select>
			<select name="#" class="form-select">
				<option selected>전체업종</option>
				<option value="">외식업</option>
				<option value="">서비스업</option>
				<option value="">소매업</option>
			</select>
			<select name="#" class="form-select">
				<option value="" selected>2022년 2분기</option>
				<option value="">2022년 1분기</option>
				<option value="">2021년 4분기</option>
				<option value="">2021년 3분기</option>
				<option value="">2021년 2분기</option>
				<option value="">2021년 1분기</option>
			</select>
		</div>
		<div class="d-flex flex-row justify-content-center graphs-div">
			<div class="graphs" title="점포수">
				<div class="graphs-title">점포수</div>
				<div class="d-flex flex-row">
					<div class="graph1-box graph1" id="graph1-chart">그래프 들어갈 곳</div>
					<div class="graph1-box graph1-text-div">
						<div class="graph1-text">&nbsp;</div>
						<div class="graph1-text">전체<span class="graph1-count">577,194 개</span></div>
						<div class="graph1-text"><span class="color-box1"></span>&nbsp;일반점포<span class="graph1-count">531,789 개</span></div>
						<div class="graph1-text"><span class="color-box2"></span>&nbsp;프렌차이즈<span class="graph1-count">84,345 개</span></div>
						<div class="graph1-text">&nbsp;</div>
						<div class="graph1-text">2022년 1분기<span class="graph1-count">547,164 개</span></div>
						<div class="graph1-text">2021년 2분기<span class="graph1-count">557,234 개</span></div>
					</div>
				</div>
			</div>
			<div class="graphs" title="매출액">
				<div class="graphs-title">매출액</div>
				<div class="d-flex flex-row justify-content-center" style="margin-top: 20px;">
					<div class="graph2-box graph2-green">
						<div class="graph2-title">전분기 대비</div>
						<div class="graph2-val">+ 8,733억</div>
					</div>
					<div class="graph2-box graph2-purple">
						<div class="graph2-title">2022년 2분기</div>
						<div class="graph2-val">90,538억</div>
					</div>
					<div class="graph2-box graph2-green">
						<div class="graph2-title">전년동분기 대비</div>
						<div class="graph2-val">+ 4,712억</div>
					</div>
				</div>
				<div class="graph2-bottom">
					<div>2022년 1분기<span class="graph2-total-val" style="float: right">81,805 억</span></div>
					<div>2021년 2분기<span class="graph2-total-val" style="float: right">85,826 억</span></div>
				</div>
			</div>
			<div class="graphs" title="유동인구">
				<div class="graphs-title">유동인구</div>
				<div id="graph3-chart">차트 들어갈 곳</div>
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
		if(top > 850) {
			$(".three-div2").removeClass("hide");
			$(".three-div2").addClass("show");
			$(".three-div2-text").addClass("move");
			$(".three-div2-img").addClass("move");
		}
		if(top > 1450) {
			$(".three-div3").removeClass("hide");
			$(".three-div3").addClass("show");
			$(".three-div3-text").addClass("move");
			$(".three-div3-img").addClass("move");
		}
	});
});

</script>