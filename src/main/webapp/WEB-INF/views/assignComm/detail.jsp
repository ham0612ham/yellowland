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

article {
	font-family: Pretendard-Regular, sans-serif;
}

.detail-img {
	height: 300px;
}

.detail-list > div {
	margin-bottom: 10px;
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

#subImg {
	display: flex;
    margin-left: -93px;
}

.img-flex {
	display: flex;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.img-flex .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	cursor: pointer;
}

.noteForm {
	width: 30vw;
}

.detail-image {color: #A1A1A1;}

</style>


<script type="text/javascript">


function backButton() {
	
	document.querySelector(".detail-view").style.display = "none";
	document.querySelector(".assign-ul").style.display = "block";
	
}

function deleteComm() {
	
	if(confirm(" 게시글을 삭제하시겠습니까 ? ")) {
		
		let url = "${pageContext.request.contextPath}/assignComm/delete?num=${dto.num}";
		location.href = url;
	}
	
}

	




</script>


</head>
<body>



<article>
	<div class="detail-view">
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		    <div class="carousel-inner">
		    	<img class="back" onclick="backButton();" src="${pageContext.request.contextPath}/resources/images/back.png">
		    	<div class="carousel-item active">
			      	<img class="detail-img" src="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}" class="d-block w-100">
			    </div>
				<c:forEach var="img" items="${imgList}">
				    <div class="carousel-item active">
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
		<br>
		
		<div style="display: flex; justify-content: flex-end;">
			<!-- 쪽지 보내기 버튼 -->
			<c:if test="${sessionScope.member.userId != dto.userId && !empty sessionScope.member.userId}">
				<a data-bs-toggle="modal" data-bs-target="#myDialogModal"><i style="margin-left: -30px;" class="fa-regular fa-comments"></i></a>
			</c:if>
			<!-- 수정, 삭제 버튼 data-bs-toggle="modal" data-bs-target="#exampleModal"-->
			<c:if test="${sessionScope.member.userId == dto.userId}">
				<li class="my-button"><button type="button" 
					 class="btn btn-primary my-update"><i class="fa-regular fa-pen-to-square"></i></button></li>
				<li class="my-button" style="margin-left: 5px; margin-right: 5px;"><button type="button" onclick="deleteComm();" class="btn btn-primary"><i class="fa-regular fa-trash-can"></i></button></li>
			</c:if>
		</div>
		
		<div class="detail-list">
			<div style="display: flex;">
				<div>등록번호 ${dto.num}</div>
				<div>${dto.regDate}</div>
			</div>
			<div><i class="fa-regular fa-building detail-image"></i> ${dto.addr1}</div>
			<div><i class="fa-solid fa-building detail-image"></i> ${dto.addr2}</div>
			<div><i class="fa-solid fa-coins detail-image"></i> 월세 ${dto.deposit}/${dto.monthly}</div>
			<div><i class="fa-solid fa-plug detail-image"></i> 관리비 ${dto.expense}만원</div>
			<div><i class="fa-regular fa-comment detail-image"></i> ${dto.subject}</div>
			
			<div><i class="fa-solid fa-vector-square detail-image"></i> 전용 ${dto.area}㎡</div>
			<div><i class="fa-solid fa-square-parking detail-image"></i> ${dto.parking == 1 ? "주차 가능" : "주차 불가능"}</div>
			<div><i class="fa-solid fa-elevator detail-image"></i> ${dto.elevator == 1 ? "엘리베이터 있음 " : "엘리베이터 없음"}</div>
			<div><i class="fa-solid fa-florin-sign detail-image"></i> ${dto.floor}층/${dto.bFloor}층</div>
			<div><i class="fa-regular fa-calendar detail-image"></i> 입주 가능일 : ${dto.transDate}</div>
			<div>
				<div><i class="fa-solid fa-comment detail-image"></i> 상세 설명</div>
				<div>${dto.content}</div>
			</div>
			<div>
				<div><i class="fa-solid fa-location-dot detail-image"></i> 위치</div>
				<div>우편번호 또는 기본 주소를 통한 위치 표시하기</div>
			</div>
		</div>
		
	</div>
</article>

<!-- 쪽지 보내기 모달 -->
<div class="modal fade" id="myDialogModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<form class="noteForm" name="noteForm" action="${pageContext.request.contextPath}/assignComm/noteSubmit" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myDialogModalLabel">받는 사람&nbsp; ${dto.userId}</h5>
					<input type="hidden" name="receiverId" value="${dto.userId}">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="col-md-12">
						<div style="margin-top: 10px;" class="form-group">
							<label class="label" for="editor2" style="margin-left: 8px;">쪽지내용 </label>
							<textarea name="content" class="form-control" id="editor2" cols="30" rows="4"  
								placeholder="개인정보 및 상대방을 비하하거나 욕하는 글은 처벌 받을 수 있습니다."></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btnClose">닫기</button>
						<button type="submit" class="btn btn-primary btnAdd">전송</button>
					</div>	
				</div>
			<script>
		    	ClassicEditor.create( document.querySelector( '#editor2' ) );
		    </script>
			</div>
		</form>		
	</div>
</div>


</body>
</html>