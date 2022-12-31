<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>


<div class="assign-class">
	<ul class="assign-ul">
		<li class="assign-count">지역 목록 ${count}개 </li>
		<c:if test="${!empty sessionScope.member.userId}">
			<li><button type="button" onclick="myList();" class="btn btn-primary">내 게시글</button></li>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<li class="assign-list" onclick="detailPage(${dto.num});"> 
				<div><img class="assign-img" src="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}"></div>
				<div class="assign-set">
					<div class="monthly"> 월세: ${dto.deposit}/${dto.monthly}</div>
					<div>관리비: ${dto.expense}</div>
					<div>전용면적: ${dto.area}㎡</div>
					<div>양도 가능일: ${dto.transDate}</div>
					<div>${dto.subject}</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	<div id="asDetail" style="overflow: auto; height: 800px;"></div>
</div>

</body>
</html>