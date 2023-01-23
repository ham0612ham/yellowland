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

.categoryTitle {
	font-size: 17px; 
	color: #696969;
}


.articleWriterCircle {display: inline; color: #36C88A;}
.articleWriterManager {display: inline; font-size: 15px; font-weight: bold; color: #696969;}
.articleWriterDate {display: inline; font-size: 16px; color: #696969;}

.articleContent {
	min-height: 400px;
	text-align: center;
}


.division {margin-bottom: 10px; margin-top: 10px;}
.preNext {font-size: 18px;}
.btn {width: 80px; float: right; font-size: 19px; }

</style>

<div class="container">
	<div class="body-container">	
		<div class="articleSubject">
			<h3 class="categoryTitle">공지사항</h3>
			<h3 class="fw-semibold">${dto.subject}</h3>	
		</div>
		<div class="articleWriter">
			<h4 class="articleWriterCircle">●&nbsp;</h4>
			<h3 class="articleWriterManager">관리자</h3>
			<h3 class="articleWriterDate">&nbsp;${dto.reg_date}</h3>
		</div>


		<hr>

		<div class="articleContent" style="max-width: 500px; overflow-wrap: anywhere; margin-left: 150px; " id="ckEditor">
			<span>
			${dto.content}
			</span>
		</div>
		
			<c:forEach var="vo" items="${listFile}">
						<tr>
							<td colspan="2">
								파&nbsp;&nbsp;일 :
								<a href="${pageContext.request.contextPath}/admin/noticeManage/download?fileNum=${vo.fileNum}" style="color: black;">${vo.oriFilename}</a>
							</td>
						</tr>
					</c:forEach>
		
		<div class="articleLower">
			<hr class="division">
			<h5 class="preNext" style="color: #696969; font-size: 16px;">
				이전글:
				<c:if test="${not empty preReadDto}">
					<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${preReadDto.num}" style=" text-decoration: none; color:black;">${preReadDto.subject}</a>
				</c:if>
			</h5>
			<hr class="division">
			<h5 class="preNext" style="color: #696969; font-size: 16px;">
				다음글:
				<c:if test="${not empty nextReadDto}">
					<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${nextReadDto.num}" style=" text-decoration: none; color:black;">${nextReadDto.subject}</a>
				</c:if>	
			</h5>
			<hr class="division">
		</div>
		<br>
		<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/notice/list?${query}';">목록</button>
	</div>
</div>