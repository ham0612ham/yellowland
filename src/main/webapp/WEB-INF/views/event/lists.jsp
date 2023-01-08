<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
			<form name="listForm" method="post">
				<div class="d-flex flex-wrap table-div">
					<c:forEach var="dto" items="${list}" varStatus="status">
					 	<div class="one-div">
					 		<a href="${articleUrl}&num=${dto.num}" title="${dto.subject}">
					 			<img class="event-image" src="${pageContext.request.contextPath}/uploads/photo/${dto.imageFilename}">
					 		</a>
					 		<div class="event-div">
						 		<div class="event-title">${dto.subject}</div>
						 		<div class="event-date">${dto.staDate} ~ ${dto.endDate}</div>
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
			<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>
