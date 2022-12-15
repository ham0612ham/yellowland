<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	min-height: 900px;
	margin: auto;
	margin-top: 50px;
}
.check-area { 
	box-shadow: 0px 0px 10px rgb(0, 0, 0, 0.2); width: 400px; 
	min-height: 500px; border-radius: 20px;
}
input[type=checkbox], input[type=radio] { display: none; }
label, .div-4 {
	display: block; border-radius: 12px; margin: 0 auto; text-align: center; color: #000;
}
input[type=checkbox]:checked+label, input[type=radio]:checked+label { background: #36C88A; color: white; border: 0.5px solid #36C88A; }
label:hover { color: #18BD77; cursor: pointer; }
input[type=checkbox]+label,input[type=radio]+label { background: white; color: #A3A6AD; border: 0.5px solid #A3A6AD; }
form[name=hotPlaceForm] > ul { padding-left: 0px; }
.div-2 { 
	width: 45%; margin: 3px; padding: 6px; font-size: 14px;
	margin-top: 12px; font-weight: 600;
}
.div-4 { 
	width: 21.8%; margin: 3px; padding: 17px 6px; font-size: 14px;
	margin-top: 12px; font-weight: 600;
}
.selectGu { 
	width: 92%; color: #000; border-radius: 12px;
	border: 0.5px solid #A3A6AD; font-size: 14px; margin: auto;
}
.title {
	margin: 0 0 10px 16px; font-weight: 800; 
	color: #36C88A; font-size: 18px; padding-top: 16px;}
</style>

<div class="container">
	<div class="body-container">	
		<div class="check-area">
			<form name="hotPlaceForm">
			
			<div>
				<div class="title">뜨는 상권</div>
			</div>
			<div class="justify-content-center" style="width: 100%;">
				<div>
					<select name="#" class="form-select selectGu">
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
				</div>
				<div class="d-flex justify-content-center">
					<input id="hotDong" type="checkbox" name="hotDong" checked>
					<label for="hotDong" class="div-2" ><span>뜨는 동네</span></label>
					<input id="hotArea" type="checkbox" name="hotArea">
					<label for="hotArea" class="div-2"><span>뜨는 상권</span></label>
				</div>
				<div class="d-flex justify-content-center">
					<input id="1" type="radio" name="stoCou">
					<label for="1" class="div-4" >점포수</label>
					
					<input id="2" type="radio" name="output">
					<label for="2" class="div-4">매출</label>
					
					<input id="3" type="radio" name="mPop">
					<label for="3" class="div-4">유동인구</label>
					
					<input id="4" type="radio" name="hPop">
					<label for="4" class="div-4">주거인구</label>
				</div>
				
				<div class="nav nav-pills btn-group d-flex justify-content-center" id="v-pills-tab" role="tablist">
					<input type="radio" id="stoCou" name="selectMenu1" value="stoCou" class="nav-link active" checked="checked" data-bs-toggle="pill" data-bs-target="#stoCou" type="button" role="tab" aria-controls="stoCou" aria-selected="true">
					<label for="stoCou" class="div-4">점포수</label>
					<input type="radio" id="output" name="selectMenu1" value="output" class="nav-link" data-bs-toggle="pill" data-bs-target="#output" type="button" role="tab" aria-controls="output" aria-selected="true">
					<label for="output" class="div-4">매출</label>
					<input type="radio" id="mPop" name="selectMenu1" value="mPop" class="nav-link" data-bs-toggle="pill" data-bs-target="#mPop" type="button" role="tab" aria-controls="mPop" aria-selected="true">
					<label for="mPop" class="div-4">유동인구</label>
					<input type="radio" id="hPop" name="selectMenu1" value="hPop" class="nav-link" data-bs-toggle="pill" data-bs-target="#hPop" type="button" role="tab" aria-controls="hPop" aria-selected="true">
					<label for="hPop" class="div-4">주거인구</label>
				</div>

				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="stoCou" role="tabpanel" aria-labelledby="stoCou" tabindex="0">111</div>
					<div class="tab-pane fade" id="output" role="tabpanel" aria-labelledby="output" tabindex="0">222</div>
					<div class="tab-pane fade" id="mPop" role="tabpanel" aria-labelledby="mPop" tabindex="0">333</div>
					<div class="tab-pane fade" id="hPop" role="tabpanel" aria-labelledby="hPop" tabindex="0">444</div>
				</div>
				
			</div>
			
			</form>
		</div>
	</div>
</div>