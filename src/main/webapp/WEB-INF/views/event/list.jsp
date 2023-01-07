<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 920px;
	min-height: 800px;
	margin: auto;
	margin-top: 100px;
}
#this-title { font-size: 30px; font-weight: 600; color: #36C88A; }
input[type=radio] { display: none; }
label{
	display: block; border-radius: 8px; margin: 0 auto; text-align: center; color: #000;
}
input[type=radio]:checked+label { background: #36C88A; color: white; border: 0.5px solid #36C88A; }
input[type=radio]:checked+label:hover { background: #18BD77; color: white; border: 0.5px solid #18BD77; }
input[type=radio]:hover+label { color: #36C88A; border: 0.5px solid #36C88A; }
label:hover { color: #18BD77; cursor: pointer; }
input[type=radio]+label { background: white; color: #A3A6AD; border: 0.5px solid #A3A6AD; }
.up-btn { padding: 8px 30px; }
thead > tr { text-align: center; }
th { font-weight: 500; }
tr { text-align: center; }
td { height: 40px; overflow: hidden; text-overflow: ellipsis; border: 0px;}
.text-reset { display: block; text-decoration: none; color: black; }
.ellipsis {
	position: relative;
	min-width: 200px;
}
.ellipsis span {
	overflow: hidden; white-space: nowrap; text-overflow: ellipsis;
	position: absolute; left: 9px;
	right: 9px; cursor: pointer;
}
.cancel { cursor: pointer; }
.cancel:hover { color: #A3A6AD; }
.content-td:hover { color: #A3A6AD; }
#sel-condition { width: 150px; color: #000; 
	border: 0.5px solid #A3A6AD; font-size: 14px; 
	border-radius: 8px; height: 38.2px; width: 150px;
}
#keyword-input { height: 38.2px; width: 200px; margin-left: 6px; border-radius: 8px; border: 0.5px solid #A3A6AD; }
.search-btn { height: 38.2px; margin-left: 5px; border-radius: 8px; width: 70px; }
.date-td { font-size: 13px; margin-top: 10px; }
.pagination { margin-top: 30px; }

#table-div { 
	-webkit-backdrop-filter: blur(3px); backdrop-filter: blur(3px); 
	background: rgba(255, 255, 255, 0.3);
}
.event-image { width: 300px; height: 180px; object-fit: cover; border-radius: 10px 10px 0 0; }
.event-div { 
	border: 0.5px solid rgba(163, 166, 173, 0.5); width: 300px; height: 60px; border-top: 0px;
	border-radius: 0 0 10px 10px;
}
.event-title { font-weight: 600; font-size: 18px; margin: 5px 0 0 10px; }
.event-date { font-size: 14px; float: right; margin-right: 10px; color: #A3A6AD; }
.one-div { padding-right: 10px; padding-bottom: 10px; }
.one-div:nth-child(3), .one-div:nth-child(6) { padding-right: 0px; }
.btn-func { background: #36C88A; color: white; border: 0.5px solid #36C88A; }
.btn-func:clicked { background: #18BD77; color: white; border: 0.5px solid #18BD77; }
.btn-func:hover { color: #36C88A; border: 0.5px solid #36C88A; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title" style="margin-bottom: 12px;">
			<div id="this-title">이벤트</div>
			</div>
			
			<div class="body-main">
				<form name="listForm" method="post">
					<div id="table-div" class="d-flex flex-wrap">
						<c:forEach var="dto" items="${list}" varStatus="status">
						 	<div class="one-div">
						 		<a href="${articleUrl}&num=${dto.num}" title="${dto.subject}">
						 			<img class="event-image" src="${pageContext.request.contextPath}/uploads/photo/${dto.imageFilename}">
						 		</a>
						 		<div class="event-div">
							 		<div class="event-title">${dto.subject}</div>
							 		<div class="event-date">${dto.reg_date}</div>
						 		</div>
							</div>
					 	
					 	</c:forEach>
					</div>
				</form>
				<c:if test="${sessionScope.member.userId=='admin'}">
					<div style="float:right">
						<button type="button" class="btn btn-func" onclick="location.href='${pageContext.request.contextPath}/event/write';">글쓰기</button>
					</div>
				</c:if>
			<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
		</div>
	</div>
</div>

