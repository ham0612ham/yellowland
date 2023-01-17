<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
	min-height: 900px;
	margin: auto;
	margin-top: 100px;
}


.fw-semibold { height: 50px; width: 150px; font-size: 30px; }
.row { height: 150px; width: 220px;}
.table1 {float: left; width: 300px;text-align: left;}
.table2 {width: 800px; text-align: left;}

.col { font-weight: bold; color: #C2C2C2; font-size: 18px;}
.colNoticeTitle {font-weight: bold; color: #36C88A; font-size: 18px;  }
.title1 {font-weight: bold; color: #36C88A; font-size: 30px; margin: 0px; }

.text-decoration-none {color: #C2C2C2;} 

.questionSubject { display: flex; align-items: center;}
.questionContentADetail { float: left; margin-right: 10px;}


.division {margin-top: 20px; margin-bottom: 10px;}
.container.text-center {margin-top: 0px; margin-left: 40px; margin-right: 100px;}

.accordion-button {background-color: #36C88A; color: white;} 
.collapseOne {background-color: #36C88A;}

.accordion-button::after { display: none; }

.accordion-button:not(.collapsed) {
	color: white;
	background-color: #36C88A;
}

.accordion-item {
	overflow-wrap: break-word;
}

.pagination {
	margin-top: 70px;
	--bs-pagination-hover-bg: #36C88A; 
	--bs-pagination-focus-bg: #36C88A; 
	--bs-pagination-focus-color: #ffffff;
	--bs-pagination-hover-color: #ffffff;
	}

.page-navigation {
	margin-top: 20px;
}

.bi bi-chevron-bar-right::after{
	color: white; 
}

.bi bi-chevron-bar-left::before {
	color: white; 
}
.search-btn {height: 38.2px;margin-left: 5px;border-radius: 8px;width: 70px;}
#sel-condition { width: 150px; color: #000; 
	border: 0.5px solid #A3A6AD; font-size: 14px; 
	border-radius: 8px; height: 38.2px; width: 150px;
}
.searchButton { 
	width: 100px; 
	float:left; 
	margin-left: 20px;
}
.searchCondition {
	 width: 100px; 
	 margin-left: 25px;
	 float:left; 
 }
.searchInput { 
	float:left; 
	width: 150px;
}

.backMain { width: 200px; display: inline-block;}
.search {}
#keyword-input {height: 38.2px;width: 200px;margin-left: 6px;border-radius: 8px;border: 0.5px solid #A3A6AD;}
</style>

<script>
function sendOk() {
	f.action = "${pageContext.request.contextPath}/member/pwd";
	f.submit();
}
</script>
<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId}">
function memberdeleteOk(userId) {
    if(confirm("탈퇴하시겠습니까 ? ")) {
	    let url = "${pageContext.request.contextPath}/member/delete?" + query;
    	location.href = url;
    }
}
</c:if>
</script>

<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">마이페이지</h3>
		<div class="row row-cols-auto">
			<div class="colNoticeTitle">
				<div>회원정보</div>
			</div>		
			<div class="col"><a href="${pageContext.request.contextPath}/myqna/list" class="text-decoration-none" style="color:#C2C2C2">내가작성한 1대1문의</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/mylocal/list" class="text-decoration-none" style="color:#C2C2C2">내가작성한 게시글</a></div>							
			<div class="col"><a href="${pageContext.request.contextPath}/myReply/list" class="text-decoration-none" style="color:#C2C2C2">내가작성한 답변</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/note/receive/list" class="text-decoration-none" style="color:#C2C2C2"> 쪽지함</a></div>
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">회원 정보 </h3>
			<hr class="division">
			<div class="container text-center">			
					<table class="table td-border mx-auto my-10" >			
						<tr>
							<td class="wp-15 text-center bg-light" style="width: 150px">아이디</td>
							<td >${dto.userId}</td>							
						</tr>
						<tr>
							<td class="wp-15 text-center bg-light">이름</td>
							<td >${dto.userName}</td>							
						</tr>
						<tr>
							<td class="wp-15 text-center bg-light">이메일</td>
							<td >${dto.email}</td>							
						</tr>
						<tr>
							<td class="wp-15 text-center bg-light">연락처</td>
							<td>${dto.tel}</td>							
						</tr>
						<tr>
							<td class="wp-15 text-center bg-light">주소</td>
							<td>${dto.addr1} ${dto.addr2}</td>							
						</tr>
						
					
				</table>
			</div>

			
			
			<div class="col-6 text-center" style="display: flex; margin-top: 60px;" align="left">
					<div class="text-center" align="left">
			            
			            <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/pwd'"> 회원정보변경 <i class="bi bi-check2"></i></button>
			            <button type="button" name="sendButton" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/member/pwd'"> 회원 탈퇴 <i class="bi bi-check2"></i></button>
						<input type="hidden" name="userIdValid" id="userIdValid" value="false">
			        </div>
			</div>
		 
		</div>


	</div>


</div>