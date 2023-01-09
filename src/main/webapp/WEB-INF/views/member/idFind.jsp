<%@ page contentType="text/html; charset=UTF-8" %>
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

	let userName = f.userName.value.trim();
	if(!userName) {
		alert("성함을 입력하세요. ");
		f.userId.focus();
		return;
	}
	
	let tel = f.tel.value.trim();
	if(!tel) {
		alert("연락처를 입력하세요. ");
		f.userId.focus();
		return;
	}

	let url = "${pageContext.request.contextPath}/member/confirmNameTel";
	let query = "userName="+userName+"&tel="+tel;
	
	const fn = function(data){
		if(data.state === "true") {
			let userId = data.userId;
			$("input[name=userId]").val(userId);
			f.action = "${pageContext.request.contextPath}/member/idFind";
			f.submit();
		} else {
			alert("정보가 일치하지 않습니다.");
			$("input[name=name]").text('');
			$("input[name=tel]").text('');
			$("input[name=name]").focus();
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
                        <h3 class="text-center fw-bold">아이디 찾기</h3>
                        
		                <div class="d-grid">
							<p class="form-control-plaintext text-center">회원정보에 있는 성함과 연락처를 입력해주세요.</p>
		                </div>
                        
                        <div class="d-grid">
                            <input type="text" name="userName" class="form-control form-control-lg" placeholder="성함">
                        </div>
                        <div class="d-grid">
                            <input type="text" name="tel" class="form-control form-control-lg" placeholder="연락처(숫자만 입력)">
                        </div>
                        <div class="d-grid">
                            <button type="button" class="btn btn-lg btn-primary" onclick="sendOk();">확인</button>
                        </div>
                        <input name="userId" type="hidden" value="">
                    </form>
                </div>

                <div class="d-grid">
					<p class="form-control-plaintext text-center py-3">${message}</p>
                </div>

            </div>
        </div>
	        
	</div>
</div>