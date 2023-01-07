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
.btn {width: 80px; height:40px; font-size: 19px; }

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">
<script type="text/javascript">
<c:if test="${sessionScope.member.membership>50}">
	function deleteOk() {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
		    let query = "num=${dto.num}&${query}";
		    let url = "${pageContext.request.contextPath}/admin/noticeManage/delete?" + query;
	    	location.href = url;
	    }
	}
</c:if>
</script>

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

		<div class="articleContent">
			<span>
			${dto.content}
			</span>
		</div>
					<c:forEach var="vo" items="${listFile}">
						<div>
							<div >
								파&nbsp;&nbsp;일 :
								<a href="${pageContext.request.contextPath}/admin/noticeManage/download?fileNum=${vo.fileNum}">${vo.oriFilename}</a>
								
							</div>
						</div>
					</c:forEach>
		<div class="articleLower">
			<hr class="division">
			<h5 class="preNext" style="color: #696969; font-size: 16px;">
				이전글:
				<c:if test="${not empty preReadDto}">
					<a href="${pageContext.request.contextPath}/admin/noticeManage/article?${query}&num=${preReadDto.num}" style=" text-decoration: none; color:black;">${preReadDto.subject}</a>
				</c:if>
			</h5>
			<hr class="division">
			<h5 class="preNext" style="color: #696969; font-size: 16px;">
				다음글:
				<c:if test="${not empty nextReadDto}">
					<a href="${pageContext.request.contextPath}/admin/noticeManage/article?${query}&num=${nextReadDto.num}" style=" text-decoration: none; color:black;">${nextReadDto.subject}</a>
				</c:if>	
			</h5>
			<hr class="division">
		</div>
		<br>					
	 	<table class="table ">
				
				<tr>
					<td align="left" width="50%" style="    padding-left: 0px;">
							<button type="button" class="btn btn-primary btnReplyNote" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/update?num=${dto.num}&page=${page}';">수정</button>			
							<button type="button" class="btn btn-primary btnReplyNote" onclick="deleteOk()">삭제</button>
					</td>
					<td align="right" width="50%" style="    padding-left: 0px;">
							<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/list?${query}';">목록</button>
					</td>
				</tr>
			</table>
	 </div>
</div>