<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 900px;
	min-height: 900px;
	margin: auto;
	margin-top: 100px;
}

th, td {
	text-align: center;
	font-size: 13px;
}

.btn-oc {
	width: 12px;
	position: relative;
	top: -1px;
	margin-right: 3px;
	cursor: pointer;
}

caption {
	display: none;
}

#button-table { margin-bottom: 30px; }
#button-table > td { color: #e1e1e1; }
.btn-td:hover { color: #36C88A; border: 0.5px solid #36C88A; font-weight: 600; }
.btn-td { width: 225px; color: #A3A6AD }
/* #select-table { width: 600px; } */
.select-table-title > td { 
	text-align: left; padding: 0px; font-size: 14px; 
	font-weight: 600;
}

#selectQuart, #selectYear, #qCondition, #induL, #induM { 
	color: #000; border-radius: 0px;
	border: 0.5px solid #e1e1e1; font-size: 14px; margin-right: 5px;
}
.select-table-body > td { padding: 0px; } 

form[name=selectForm] { margin-bottom: 40px; }
#btn-formSend { height: 35px; width: 100px; border-radius: 0px; }
#notice { margin: auto; text-align: center; }
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/area.js"></script>

<div class="container">
	<div class="body-container">
		<h3 class="fw-semibold">지역별 현황</h3>
		<input name="selectCategory" type="hidden">
		<table id="button-table" class="table table-bordered">
			<tr>
				<td class="btn-td" data-val="store">점포수</td>
				<td class="btn-td" data-val="survival">신생기업 생존률</td>
				<td class="btn-td" data-val="survival2">연차별 생존률</td>
				<td class="btn-td" data-val="operatingPeriod">평균영업기간</td>
			</tr>
			<tr>
				<td class="btn-td" data-val="opening">개폐업수(률)</td>
				<td class="btn-td" data-val="population">인구수</td>
				<td class="btn-td" data-val="income">소득/가구수</td>
				<td class="btn-td" data-val="rent">임대시세</td>
			</tr>
		</table>
	
		<form name="selectForm" class="d-flex justify-content-start">
			<table class="table table-borderless d-flex justify-content-start" id="select-table">
				<tr class="select-table-title" style="height: 20px;">
					<td colspan="2">기준분기</td>
					<td colspan="1">조회분기</td>
					<td colspan="3" id="induLM">생활밀접업종</td>
				</tr>
				<tr class="select-table-body">
					<td>
						<select name="yCode" class="form-select" id="selectYear" style="width: 100px;">
							<option value="2022">2022년</option>
							<option value="2021">2021년</option>
							<option value="2020">2020년</option>
							<option value="2019">2019년</option>
							<option value="2018">2018년</option>
							<option value="2017">2017년</option>
						</select>
					</td>
					<td>
						<select name="qCode" class="form-select" id="selectQuart" style="width: 100px;">
							<option value="3">3분기</option>
							<option value="2">2분기</option>
							<option value="1">1분기</option>
						</select>
					</td>
					<td>
						<select name="qCondition" class="form-select" id="qCondition" style="width: 100px;">
							<option value="sameQu">동분기</option>
							<option value="beforeQu">전분기</option>
						</select>
					</td>
					<td>
						<select name="induL" class="form-select" id="induL" style="width: 100px;">
							<option value="CS000000">전체</option>
							<option value="CS100000">외식업</option>
							<option value="CS200000">서비스업</option>
							<option value="CS300000">소매업</option>
						</select>
					</td>
					<td>
						<select name="induM" class="form-select" id="induM" style="width: 130px;">
							
						</select>
					</td>
					<td>
						<button type="button" class="btn btn-primary" id='btn-formSend'>검색</button>
					</td>
				</tr>
			</table>
			
		</form>
		<div class="d-flex justify-content-between align-items-end" style="margin-bottom: 10px;">
			<span class="fw-semibold" id="table-title" style="font-size: 24px; font-weight: 600"></span>
			<span class="fw-semibold" id="sub-info" style="font-size: 12px; color: #A3A6AD;"></span>
		</div>
		<div id="output-table">
			<div id="notice">검색할 내용을 선택해주세요.</div>


		</div>
	</div>
</div>