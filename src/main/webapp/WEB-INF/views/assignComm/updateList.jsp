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

<ul class="assign-up">
	<li class="assign-count">지역 목록 ${newCount}개</li>
	<c:if test="${!empty sessionScope.member.userId}">
		<li class="my-title"><button type="button" onclick="myList();" class="btn btn-primary">내 게시글</button></li>
	</c:if>
	<c:forEach var="dto" items="${updateList}">
		<li class="assign-list" onclick="detailPage(${dto.num});"> 
			<div><img class="assign-img" src="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}"></div>
			<div class="assign-set">
				<div class="transDate-div">양도 가능일 ${dto.transDate}</div>
				<div class="monthly"> 월세 ${dto.deposit}/${dto.monthly}
				&emsp;&emsp;&emsp;&emsp;&emsp;
				</div>
				<div class="expense-div">관리비 ${dto.expense}만원</div>
				<div class="area-div">전용면적 ${dto.area}㎡</div>
				<div class="subject-div">${dto.subject}</div>
			</div>
		</li>
	</c:forEach>
	<li><div id="zero">${newCount == 0 ? " 게시물이 존재하지 않거나 삭제되었습니다. " : ""}</div></li>
</ul>
<div id="asDetail" style="overflow: auto; height: 800px;"></div>
<div id="asDetail2" style="overflow: auto; height: 800px;"></div>

</body>
</html>