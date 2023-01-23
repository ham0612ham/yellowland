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

.myList-ul {
    height: 100vh;
    overflow: auto;
    height: 117%;
}

.myList-list {
	display: flex;
	padding-top: 15px;
    padding-bottom: 12px;
    border-bottom: 1px solid rgba(204, 204, 204, 0.3);
    padding-left: 20px;
    cursor: pointer;
}

.myList-list:hover {
	background-color: rgba(204, 204, 204, 0.7);
}

.myList-ul li:nth-child(2) > button {
    display: inline-block;
    background: #36C88A;
    color: white;
    border: 0.5px solid #36C88A;
    font-size: 12px;
    margin-right: 10px;
    margin-bottom: 5px;
}

.myList-ul li:nth-child(2) {
	text-align: right;
}

.myList-count {
	text-align: center;
	font-weight: 600;
}

.myList-img {
	width: 150px;
    height: 117px;
    border-radius: 7px;
    object-fit: cover;
}

.myList-set {
    margin-left: 10px;
}

#zero {
    position: absolute;
    top: 40vh;
    right: 4.5vw;
}



</style>

<script type="text/javascript">

function allList() {
	
	const myListArticle = document.querySelector('.myList-article');
	myListArticle.innerHTML = '';
	
	// document.querySelector(".myList-ul").style.display = "none";
	
	document.querySelector(".assign-up").style.display = "block";
}


</script>
</head>
<body>

<article class="myList-article">
	<div class="myList-class">
		<ul class="myList-ul">
			<li class="myList-count">내 게시글 ${count}개</li>
			<c:if test="${!empty sessionScope.member.userId}">
				<li><button type="button" onclick="allList();" class="btn btn-primary">전체 게시글</button></li>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<li class="myList-list" onclick="detailPageUp(${dto.num});"> 
					<div><img class="myList-img" src="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}"></div>
					<div class="myList-set">
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
			<li><div id="zero">${count == 0 ? " 게시물이 존재하지 않거나 삭제되었습니다. " : ""}</div></li>
		</ul>
		
		<div id="asDetail" style="overflow: auto; height: 800px;"></div>
	</div>
</article>
</body>
</html>