<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	min-height: 900px;
	margin-top: 50px;
}
.check-area { 
	box-shadow: 0px 0px 10px rgb(0, 0, 0, 0.2); width: 400px; padding-top: 12px;
	min-height: 100px; border-radius: 15px; padding-bottom: 12px; margin-bottom: 15px;
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
form[name=hotPlaceForm] > ul { padding-left: 0px; }
.div-2 { 
	width: 45%; margin: 3px; padding: 6px; font-size: 14px;
	margin-top: 12px; font-weight: 600;
}
.div-4 { 
	width: 21.8%; margin: 3px; padding: 17px 6px; font-size: 14px;
	font-weight: 600;
}
.selectGu { 
	width: 92%; color: #000; border-radius: 12px;
	border: 0.5px solid #A3A6AD; font-size: 14px; margin: auto;
}
.title {
	margin: 0 0 10px 16px; font-weight: 800; 
	color: #36C88A; font-size: 18px; }
.select-title { font-size: 13px; margin-left: 16px; font-weight: 600; padding-top: 5px; }
.div-3 { width: 29.7%; margin: 3px; padding: 6px; font-size: 14px;
	margin-top: 2px; font-weight: 600; }
</style>

<div class="container" style="margin: 0px;">
	<div class="body-container">	
		<form name="hotPlaceForm">
			<div class="check-area">
			
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
				</div>
			</div>
			<div class="check-area">
				<div class="nav nav-pills btn-group d-flex justify-content-center" id="v-pills-tab" role="tablist">
					<input class="nav-link active" id="stoCou" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="radio" role="tab" aria-controls="v-pills-home" aria-selected="true" name="selectMenu1" checked>
				    <label for="stoCou" class="div-4">점포수</label>
				    <input class="nav-link" id="output" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="radio" role="tab" aria-controls="v-pills-profile" aria-selected="false" name="selectMenu1">
				    <label for="output" class="div-4">매출</label>
				    <input class="nav-link" id="mPop" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="radio" role="tab" aria-controls="v-pills-messages" aria-selected="false" name="selectMenu1">
				    <label for="mPop" class="div-4">유동인구</label>
				    <input class="nav-link" id="hPop" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="radio" role="tab" aria-controls="v-pills-settings" aria-selected="false" name="selectMenu1">
				    <label for="hPop" class="div-4">주거인구</label>
				</div>
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">
					    <div class="select-title">업종</div>
					    <div class="d-flex justify-content-center">
							<input id="allJob" type="radio" name="selectMenu2" checked>
						    <label for="allJob" class="div-4">전체</label>
						    <input id="food" type="radio" role="tab" name="selectMenu2">
						    <label for="food" class="div-4">외식업</label>
						    <input id="service" type="radio" role="tab" name="selectMenu2">
						    <label for="service" class="div-4">서비스업</label>
						    <input id="retail" type="radio" role="tab" name="selectMenu2">
						    <label for="retail" class="div-4">소매업</label>
						</div>
					</div>
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
					
					</div>
					<div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" tabindex="0">
					    <div class="select-title">성별</div>
						<div class="btn-group three-btn-group" role="group" aria-label="Basic radio toggle button group" style=" margin-left: 16px; width: 92%;">
						    <input type="radio" class="btn-check" name="btnradio-gender" id="allGender" autocomplete="off" checked>
						    <label class="btn btn-outline-primary" for="allGender" style="border-radius: 12px 0 0 12px; font-size: 14px; font-weight: 600;">전체</label>
						
						    <input type="radio" class="btn-check" name="btnradio-gender" id="male" autocomplete="off">
						    <label class="btn btn-outline-primary" for="male" style="font-size: 14px; font-weight: 600;">남자</label>
						
						    <input type="radio" class="btn-check" name="btnradio-gender" id="female" autocomplete="off">  
						    <label class="btn btn-outline-primary" for="female" style="border-radius: 0 12px 12px 0; font-size: 14px; font-weight: 600;">여자</label>
						</div>
						
					    <div class="select-title">요일</div>
					    <div class="btn-group three-btn-group" role="group2" aria-label="Basic radio toggle button group" style=" margin-left: 16px; width: 92%;">
						    <input type="radio" class="btn-check" name="btnradio-week" id="allWeek" autocomplete="off" checked>
						    <label class="btn btn-outline-primary" for="allWeek" style="border-radius: 12px 0 0 12px; font-size: 14px; font-weight: 600;">전체</label>
						
						    <input type="radio" class="btn-check" name="btnradio-week" id="week" autocomplete="off">
						    <label class="btn btn-outline-primary" for="week" style="font-size: 14px; font-weight: 600;">주중</label>
						
						    <input type="radio" class="btn-check" name="btnradio-week" id="weekend" autocomplete="off">  
						    <label class="btn btn-outline-primary" for="weekend" style="border-radius: 0 12px 12px 0; font-size: 14px; font-weight: 600;">주말</label>
						</div>
					    <div class="select-title">연령대</div>
					    <div class="btn-group five-btn-group" role="group3" aria-label="Basic radio toggle button group" style=" margin-left: 16px; width: 92%;">
						    <input type="radio" class="btn-check" name="btnradio-age" id="allAge" autocomplete="off" checked>
						    <label class="btn btn-outline-primary" for="allAge" style="border-radius: 12px 0 0 12px; font-size: 14px; font-weight: 600; width: 45px;">전체</label>
						
						    <input type="radio" class="btn-check" name="btnradio-age" id="age10" autocomplete="off">
						    <label class="btn btn-outline-primary" for="age10" style="font-size: 14px; font-weight: 600; width: 45px;">10대</label>
						
						    <input type="radio" class="btn-check" name="btnradio-age" id="age2030" autocomplete="off">  
						    <label class="btn btn-outline-primary" for="age2030" style="font-size: 14px; font-weight: 600; width: 70px;">20~30대</label>
						    
						    <input type="radio" class="btn-check" name="btnradio-age" id="age4050" autocomplete="off">  
						    <label class="btn btn-outline-primary" for="age4050" style="font-size: 14px; font-weight: 600; width: 70px;">40~50대</label>
						    
						    <input type="radio" class="btn-check" name="btnradio-age" id="age60" autocomplete="off">  
						    <label class="btn btn-outline-primary" for="age60" style="border-radius: 0 12px 12px 0; font-size: 14px; font-weight: 600; width: 70px;">60대 이상</label>
						</div>
					</div>
					<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab" tabindex="0">
					    <div class="select-title">성별</div>
					    <div class="select-title">연령대</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>