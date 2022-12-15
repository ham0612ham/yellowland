﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 600px;
	margin: auto;
}
#selectEmail {
	width: 140px;
}
.text-gray { color: #eeeee; }
.col-form-label { margin-top: 10px; }
</style>

<script type="text/javascript">
function memberOk() {
	const f = document.memberForm;
	let str;

	str = f.userId.value;
	if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) { 
		alert("아이디를 다시 입력 하세요. ");
		f.userId.focus();
		return;
	}

	let mode = "${mode}";
	if(mode === "member" && f.userIdValid.value === "false") {
		str = "아이디 중복 검사가 실행되지 않았습니다.";
		$("#userId").parent().find(".help-block").html(str);
		f.userId.focus();
		return;
	}
	
	str = f.userPwd.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.userPwd.focus();
		return;
	}

	if( str !== f.userPwd2.value ) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwd.focus();
        return;
	}
	
    str = f.userName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
        alert("이름을 다시 입력하세요. ");
        f.userName.focus();
        return;
    }
    
    str = f.birth.value;
    if( !str ) {
        alert("생년월일를 입력하세요. ");
        f.birth.focus();
        return;
    }

    str = f.tel1.value;
    if( !str ) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
    if( !/^\d{3,4}$/.test(str) ) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
    if( !/^\d{4}$/.test(str) ) {
    	alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }

   	f.action = "${pageContext.request.contextPath}/member/${mode}";
    f.submit();
}

function changeEmail() {
    const f = document.memberForm;
	    
    let str = f.selectEmail.value;
    if(str !== "direct") {
        f.email2.value = str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value = "";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

function userIdCheck() {
	// 아이디 중복 검사
	let userId = $("#userId").val();

	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) { 
		var str = "아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
		$("#userId").focus();
		$("#userId").parent().find(".help-block").html(str);
		return;
	}
	
	let url = "${pageContext.request.contextPath}/member/userIdCheck";
	let query = "userId=" + userId;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let passed = data.passed;

			if(passed === "true") {
				let str = "<span style='color:blue; font-weight: bold;'>" + userId + "</span> 아이디는 사용가능 합니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#userIdValid").val("true");
			} else {
				let str = "<span style='color:red; font-weight: bold;'>" + userId + "</span> 아이디는 사용할수 없습니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#userId").val("");
				$("#userIdValid").val("false");
				$("#userId").focus();
			}
		}
	});
}
</script>

<div class="container">
	<div style="margin-left: 100px">
	<div class="body-container">	
		<div class="body-title">
			<h3 class="fw-semibold">${mode=="member"?"회원가입":"정보수정"} </h3>
		</div>
		<div class="body-main">

			<form name="memberForm" method="post" style="margin-top : 20px;">
				<label class="col-form-label" for="userId">아이디</label>
				<div class="userId-box">
					<div class="row">
						<div class="col-7 pe-1">
							<input type="text" name="userId" id="userId" class="form-control" value="${dto.userId}" 
								${mode=="update" ? "readonly='readonly' ":""}
								placeholder="아이디">
						</div>
						<div class="col-4 ps-1">
							<c:if test="${mode=='member'}">
								<button type="button" class="btn btn-primary" onclick="userIdCheck();" style="width: 140px;">중복 확인</button>
							</c:if>
						</div>
					</div>						
						<c:if test="${mode=='member'}">
							<small class="form-control-plaintext help-block" style="color: gray">
								아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다
							</small>
						</c:if>
					</div>
				<label class="col-form-label" for="userPwd">패스워드</label>
				<div class="row">
					<div class="col-sm-10">
			            <input type="password" name="userPwd" id="userPwd" class="form-control" autocomplete="off" placeholder="패스워드">
			            <small class="form-control-plaintext" style="color: gray">
			            	패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다
			            </small>
			        </div>
			    </div>
			    
			    <label class="col-form-label" for="userPwd2">패스워드 확인</label>
			    <div class="row">
			        <div class="col-sm-10">
			            <input type="password" name="userPwd2" id="userPwd2" class="form-control" autocomplete="off" placeholder="패스워드 확인">
			        </div>
			    </div>
			 
			    <label class="col-form-label" for="userName">이름</label>
			    <div class="row">
			        <div class="col-sm-10">
			            <input type="text" name="userName" id="userName" class="form-control" value="${dto.userName}" 
			            		${mode=="update" ? "readonly='readonly' ":""}
			            		placeholder="이름">
			        </div>
			    </div>
						 
			    <label class="col-form-label" for="birth">생년월일</label>
			    <div class="row">
			        <div class="col-sm-10">
			            <input type="date" name="birth" id="birth" class="form-control" value="${dto.birth}" placeholder="생년월일">
			            <small class="form-control-plaintext" style="color: gray">생년월일은 2000-01-01 형식으로 입력 합니다.</small>
			        </div>
			    </div>
			    
			    <label class="col-form-label" for="selectEmail">이메일</label>
			    <div class="row">
			        <div class="col-8 row">
						<div class="col input-group">
							<input type="text" name="email1" class="form-control" maxlength="30" value="${dto.email1}" >
						    <span class="input-group-text p-1" style="border: none; background: none;">@</span>
							<input type="text" name="email2" class="form-control" maxlength="30" value="${dto.email2}" readonly="readonly">
						</div>		
	
						<div class="col-1 pe-0">
							<select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();">
								<option value="">선 택</option>
								<option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
								<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
								<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
								<option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
								<option value="direct">직접입력</option>
							</select>
						</div>
			        </div>
			    </div>
			    
			    <label class="col-form-label" for="tel1">전화번호</label>
			    <div class="row">
			        <div class="col-sm-10 row" style="padding-right: 0px;">
						<div class="pe-1" style="width: 165px;">
							<input type="text" name="tel1" id="tel1" class="form-control" value="${dto.tel1}" maxlength="3">
						</div>
						<div class="px-1" style="width: 170px;">
							<input type="text" name="tel2" id="tel2" class="form-control" value="${dto.tel2}" maxlength="4">
						</div>
						<div class="ps-1" style="width: 170px; padding-right: 0px;">
							<input type="text" name="tel3" id="tel3" class="form-control" value="${dto.tel3}" maxlength="4">
						</div>
			        </div>
			    </div>
			
			    <label class="col-form-label" for="zip">우편번호</label>
			    <div class="row">
			       	<div class="d-flex flex-row">
			           	<input type="text" name="zip" id="zip" class="form-control p-2" placeholder="우편번호" value="${dto.zip }" readonly="readonly" style="width: 350px;">
		           		<button class="btn btn-primary p-2" type="button" style="margin-left: 7px; width: 137px;" onclick="daumPostcode();">우편번호 검색</button>
			        </div>
			    </div>
		
			    <label class="col-form-label" for="addr1">주소</label>
			    <div class="row">
			        <div class="col-sm-10">
			       		<div>
			           		<input type="text" name="addr1" id="addr1" class="form-control" placeholder="기본 주소" value="${dto.addr1}" readonly="readonly">
			           	</div>
			       		<div style="margin-top: 5px;">
			       			<input type="text" name="addr2" id="addr2" class="form-control" placeholder="상세 주소" value="${dto.addr2}">
						</div>
					</div>
			    </div>
		
			    <label class="col-form-label" for="agree">약관 동의</label>
			    <div class="row">
					<div class="col-sm-8" style="padding-top: 5px;">
						<input type="checkbox" id="agree" name="agree"
							class="form-check-input"
							checked="checked"
							style="margin-left: 0;"
							onchange="form.sendButton.disabled = !checked">
						<label class="form-check-label">
							<a href="#" class="text-decoration-none">이용약관</a>에 동의합니다.
						</label>
					</div>
			    </div>
			    <div>&nbsp;</div>
			    <div class="row">
			        <div class="text-center">
			            <button type="button" name="sendButton" class="btn btn-primary" onclick="memberOk();" style="width: 496px; float: left;"> ${mode=="member"?"회원가입":"정보수정"}</button>
						<input type="hidden" name="userIdValid" id="userIdValid" value="false">
			        </div>
			    </div>
			
			    <div class="row">
					<p class="form-control-plaintext text-center">${message}</p>
			    </div>
			</form>

		</div>
	</div>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>