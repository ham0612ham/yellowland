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

<style>

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

body {
	font-family: Pretendard-Regular, sans-serif;
}

.detail-img {
	height: 300px;
}

.detail-list > div {
	margin-bottom: 30px;
	margin-left: 30px;
}

.back {
	position: absolute;
    top: -2px;
    left: -3px;
    width: 40px;
    z-index: 1;
    padding: 14px;
    cursor: pointer;
}

.carousel-control-prev {
    left: 0px;
    top: 70px;
}

.carousel-control-prev-icon {
	margin-top: -70px;
}

i {
	margin-right: 3px;
}
</style>

<script type="text/javascript">


function backButton() {
	 window.location.reload();
}

</script>

</head>
<body>

<article>
	<div class="detail-view">
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		    <div class="carousel-inner">
		    	<div class="carousel-item active">
		    		<img class="back" onclick="backButton();" src="${pageContext.request.contextPath}/resources/images/back.png">
			      	<img class="detail-img" src="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}" class="d-block w-100">
			    </div>
				<c:forEach var="img" items="${imgList}">
				    <div class="carousel-item active">
				    	<img class="back" onclick="backButton();" src="${pageContext.request.contextPath}/resources/images/back.png">
				      	<img class="detail-img" src="${pageContext.request.contextPath}/uploads/image/${img.imgName}" class="d-block w-100">
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
			<div><i class="fa-regular fa-building"></i> ${dto.addr1}</div>
			<div><i class="fa-solid fa-building"></i> ${dto.addr2}</div>
			<div><i class="fa-solid fa-coins"></i> 월세 ${dto.deposit}/${dto.monthly}</div>
			<div><i class="fa-solid fa-plug"></i> 관리비 ${dto.expense}만원</div>
			<div><i class="fa-regular fa-comment"></i> ${dto.subject}</div>
			
			<div><i class="fa-solid fa-vector-square"></i> 전용 ${dto.area}㎡</div>
			<div><i class="fa-solid fa-square-parking"></i> ${dto.parking == 1 ? "주차 가능" : "주차 불가능"}</div>
			<div><i class="fa-solid fa-elevator"></i> ${dto.elevator == 1 ? "엘리베이터 있음 " : "엘리베이터 없음"}</div>
			<div><i class="fa-solid fa-florin-sign"></i> ${dto.floor}층/${dto.bFloor}층</div>
			<div><i class="fa-regular fa-calendar"></i> 입주 가능일 : ${dto.transDate}</div>
			<div>
				<div><i class="fa-solid fa-comment"></i> 상세 설명</div>
				<div>${dto.content}</div>
			</div>
			<div>
				<div><i class="fa-solid fa-location-dot"></i> 위치</div>
				<div>우편번호 또는 기본 주소를 통한 위치 표시하기</div>
			</div>
		</div>
		
	</div>
</article>

</body>
</html>