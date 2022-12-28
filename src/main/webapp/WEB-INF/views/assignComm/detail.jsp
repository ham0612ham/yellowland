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

<div class="detail-view">
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	    <div class="carousel-inner">
			<c:forEach var="img" items="imgList">
			    <div class="carousel-item active">
			      	<img src="${pageContext.request.contextPath}/uploads/image/${img.imgName}" class="d-block w-100">
			    </div>	
			</c:forEach>
	    </div>
	    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
	    </button>
	    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
	    </button>
	</div>
	<div class="detail-list">
		<div style="display: flex;">
			<div>등록번호 ${dto.num}</div>
			<div>${dto.regDate}일 전</div>
		</div>
		<div>${dto.addr1}</div>
		<div>${dto.addr2}</div>
		<div>월세 ${dto.deposit}/${dto.monthly}</div>
		<div>관리비 ${dto.expense}만원</div>
		<div>${dto.subject}</div>
		
		<div>전용 ${dto.area}㎡</div>
		<div>${dto.parking == 1 ? "주차 가능" : "주차 불가능"}</div>
		<div>${dto.elevator == 1 ? "엘리베이터 있음 " : "엘리베이터 없음"}</div>
		<div>${dto.floor}층/${dto.bFloor}층</div>
		<div>입주 가능일 : ${dto.transDate}</div>
		<div>
			<div>상세 설명</div>
			<div>${dto.content}</div>
		</div>
		<div>
			<div>위치</div>
			<div>우편번호 또는 기본 주소를 통한 위치 표시하기</div>
		</div>
	</div>
</div>


</body>
</html>