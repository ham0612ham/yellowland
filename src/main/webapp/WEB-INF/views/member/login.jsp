<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	min-height: 900px;
	margin: auto;
	margin-top: 100px;
}
</style>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.userId.value.trim();
    if(!str) {
        f.userId.focus();
        return;
    }

    str = f.userPwd.value.trim();
    if(!str) {
        f.userPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}
</script>

<div class="container">
	<div class="body-container">	

        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="p-3">
                    <form name="loginForm" action="" method="post" class="row g-3" style="width: 400px; margin: auto;">
                        <h3 class="fw-semibold">로그인</h3>
                        <div class="col-12">
                            <label class="mb-1 fs-6">아이디</label>
                            <input type="text" name="userId" class="form-control" placeholder="아이디">
                        </div>
                        <div class="col-12">
                            <label class="mb-1 fs-6">패스워드</label>
                            <input type="password" name="userPwd" class="form-control" autocomplete="off" 
                            	placeholder="패스워드">
                        </div>
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                <label class="form-check-label" for="rememberMe" style="font-size: 14px;"> 아이디 저장</label>
                                <div style="float: right">
	                        	<a href="${pageContext.request.contextPath}/member/idFind" class="text-decoration-none me-2 text-right" style="font-size: 14px;">아이디 찾기</a>
	                        	<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none me-2 text-right" style="font-size: 14px;">패스워드 찾기</a>
	                        	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none text-right" style="font-size: 14px;">회원가입</a>
	                        	</div>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btn-primary" onclick="sendLogin();" style="width: 100%;">
                            	&nbsp;로그인&nbsp;
                            </button>
                        </div>
                    </form>
                </div>

                <div class="d-grid">
						<p class="form-control-plaintext text-center text-primary">${message}</p>
                </div>

            </div>
        </div>

	</div>
</div>