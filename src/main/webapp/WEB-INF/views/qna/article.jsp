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

.categoryTitle {font-size: 17px; color: #696969;}


.articleWriterCircle {display: inline; color: #36C88A;}
.articleWriterManager {display: inline; font-size: 15px; font-weight: bold; color: #696969;}
.articleWriterDate {display: inline; font-size: 16px; color: #696969;}
.articleWriterIsAnswer {display: inline; font-size: 15px; color: #696969;}

.articleContent { min-height: 350px; text-align: center;}
.articleManagerCircle {display: inline; color: #756EF2;}
.articleManagerManager  {display: inline; font-size: 15px; font-weight: bold; color: #696969;}
.articleManagerDate {display: inline; font-size: 16px; color: #696969;}

.articleManagerContent {margin-left: 50px; width: 500px; margin-top: 10px;}
.articleManagerContentDetail { margin-top: 50px;}



.division {margin-bottom: 10px; margin-top: 10px;}
.preNext {font-size: 18px;}
.btn {width: 80px; float: right; font-size: 19px; }

</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId}">
function deleteOk(num) {
    if(confirm("문의글을 삭제 하시 겠습니까 ? ")) {
    	let query = "num="+num+"&page=${page}";
	    let url = "${pageContext.request.contextPath}/qna/delete?" + query;
    	location.href = url;
    }
}
</c:if>
</script>

<div class="container">
	<div class="body-container">	
		<div class="articleSubject">
			<h3 class="categoryTitle">1:1 문의</h3>
			<h3 class="fw-semibold">${dto.subject}</h3>	
		</div>
		<div class="articleWriter">
			<h4 class="articleWriterCircle">●&nbsp;</h4>
			<h3 class="articleWriterManager">${dto.userName}</h3>
			<h3 class="articleWriterDate">&nbsp;${dto.regDate}</h3>
			<h3	class="articleWriterIsAnswer">&nbsp;${not empty dto2 ? "답변완료":"답변대기"}</h3>
		</div>

		<hr>

		<div class="articleContent">
			<span class="articleContentDetail">
				${dto.content} 
			</span>
		</div>

		<c:if test="${not empty dto2}">
			<hr style="margin-top: 40px;">
		</c:if>

		<c:if test="${not empty dto2}">
			<div class="articleManager">
				<h4 class="articleManagerCircle">●&nbsp;</h4>
				<h3 class="articleManagerManager">관리자</h3>
				<h3 class="articleManagerDate">&nbsp;${dto2.regDate}</h3>
				<h3></h3>
				<br>
				<div  class="articleManagerContent">
					<span class="articleManagerContentDetail">
					${dto2.content} 컨텐츠
					</span>
				</div>
				<br>
			</div>
		</c:if>
		<br>	
		<br>	
		<hr>
		
		<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qna/list';">목록</button>
		
		<c:choose>
			<c:when test="${sessionScope.member.userId==dto.userId}">
				<button type="button" class="btn btn-light" style=" margin-bottom: 20px; margin-right: 10px;" onclick="deleteOk(${dto.num});">삭제</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-light" disabled="disabled" style=" margin-bottom: 20px;">삭제</button>
			</c:otherwise>
		</c:choose>
		
	</div>
</div>