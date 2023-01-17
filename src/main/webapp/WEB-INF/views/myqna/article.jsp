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
.btn {width: 80px; height:40px; font-size: 13px; }

</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId}">
function deleteOk(num) {
    if(confirm("문의글을 삭제 하시 겠습니까 ? ")) {
    	let query = "num="+num+"&page=${page}";
	    let url = "${pageContext.request.contextPath}/myqna/delete?" + query;
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
		<div class="articleLower">
			<hr class="division">
			<h5 class="preNext" style="color: #696969; font-size: 16px;">
				이전글:
				<c:if test="${not empty preReadDto}">
					<a href="${pageContext.request.contextPath}/myqna/article?${query}&num=${preReadDto.num}" style=" text-decoration: none; color:black;">${preReadDto.subject}</a>
				</c:if>
			</h5>
			<hr class="division">
			<h5 class="preNext" style="color: #696969; font-size: 16px;">
				다음글:
				<c:if test="${not empty nextReadDto}">
					<a href="${pageContext.request.contextPath}/myqna/article?${query}&num=${nextReadDto.num}" style=" text-decoration: none; color:black;">${nextReadDto.subject}</a>
				</c:if>	
			</h5>
			<hr class="division">
		</div>
		
		<c:choose>
			<c:when test="${sessionScope.member.userId==dto.userId}">
				<button type="button" class="btn btn-light"
					onclick="location.href='${pageContext.request.contextPath}/myqna/update?num=${dto.num}&page=${page}';">수정</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-light" disabled="disabled">수정</button>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${sessionScope.member.userId==dto.userId}">
				<button type="button" class="btn btn-light" style="margin-right: 10px;" onclick="deleteOk(${dto.num});">삭제</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-light" disabled="disabled" style="margin-right: 10px;">삭제</button>
			</c:otherwise>
		</c:choose>

		<c:if test="${not empty dto2}">
		
			<div class="articleManager">
				<h4 class="articleManagerCircle">●&nbsp;</h4>
				<h3 class="articleManagerManager">관리자</h3>
				<h3 class="articleManagerDate">&nbsp;${dto2.regDate}날짜</h3>
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
		<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/myqna/list';">목록</button>

	</div>
</div>