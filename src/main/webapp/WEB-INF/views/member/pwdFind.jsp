﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
	margin: auto;
	min-height: 900px;
}
</style>

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

function sendOk() {
	const f = document.pwdForm;

	let id = f.userId.value.trim();
	if(!id) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	
	let tel = f.tel.value.trim();
	if(!tel) {
		alert("연락처를 입력하세요. ");
		f.userId.focus();
		return;
	}

	let url = "${pageContext.request.contextPath}/member/confirmIdTel";
	let query = "userId="+id+"&tel="+tel;
	
	const fn = function(data){
		if(data.state === "true") {
			if(confirm("확인을 누르면 임시 패스워드가 회원정보의 이메일로 전송됩니다.\n이대로 진행하시겠습니까?")){
				f.action = "${pageContext.request.contextPath}/member/pwdFind";
				f.submit();
			};
		} else {
			alert("정보가 일치하지 않습니다.");
			$("input[name=userId]").text('');
			$("input[name=tel]").text('');
			$("input[name=userId]").focus();
		}
	}
	
	ajaxFun(url, "post", query, "json", fn)
}
</script>

<div class="container">
	<div class="body-container">	

        <div class="row justify-content-md-center">
            <div class="col-md-7">
                <div class="border mt-5 p-4">
                    <form name="pwdForm" method="post" class="row g-3">
                        <h3 class="text-center fw-bold">패스워드 찾기</h3>
                        
		                <div class="d-grid">
							<p class="form-control-plaintext text-center">회원정보에 있는 아이디와 연락처를 입력해주세요.</p>
		                </div>
                        
                        <div class="d-grid">
                            <input type="text" name="userId" class="form-control form-control-lg" placeholder="아이디">
                        </div>
                        <div class="d-grid">
                            <input type="text" name="tel" class="form-control form-control-lg" placeholder="연락처(숫자만 입력)">
                        </div>
                        <div class="d-grid">
                            <button type="button" class="btn btn-lg btn-primary" onclick="sendOk();">확인</button>
                        </div>
                    </form>
                </div>

                <div class="d-grid">
					<p class="form-control-plaintext text-center py-3">${message}</p>
                </div>

            </div>
        </div>
	        
	</div>
</div>