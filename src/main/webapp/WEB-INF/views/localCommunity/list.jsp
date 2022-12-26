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

.title1 {margin-bottom: 20px;}

.fw-semibold { height: 50px; width: 150px; font-size: 30px; }
.row { 
	height: 100px; 
	width: 160px;
}
.table1 {float: left; width: 300px; text-align: left;}
.table2 {width: 800px; text-align: left;}

.col { font-weight: bold; color: #C2C2C2; font-size: 18px;}
.colNoticeTitle {
	font-weight: bold; 
	color: #36C88A; 
	font-size: 18px;
	height: 10px;
	}
.title1 {font-weight: bold; color: #36C88A; font-size: 30px; }


.division {
	margin-top: 20px; 
	margin-bottom: 10px; 
	margin-left: 20px; 
	border-width: 2px;
	background-color:black;
	background: black;
}


.pagination {
	margin-left: 320px; 
	--bs-pagination-hover-bg: #36C88A; 
	--bs-pagination-focus-bg: #36C88A; 
	--bs-pagination-focus-color: #ffffff;
	--bs-pagination-hover-color: #ffffff;
	}

.form-select {
	border: solid 0.5px;
	border-color: #C2C2C2; 
	border-radius: 3px;
	width: 160px;
} 

.btn {width: 80px;}
#mainButton {width: 140px;}

.btn-outline-secondary {
	--bs-btn-hover-bg:#ffffff;
	--bs-btn-hover-color: black;
	--bs-btn-active-bg: #ffffff;
	--bs-btn-active-color: black;
}

#searchComm { width: 160px; }

#condition { width: 90px; }

#board { margin: 10px; }

.typeSelectorLarge { width: 170px; float: left; }
.typeSelectorSmall { width: 170px; float: left}

.typeSelectorForm {margin-left: 20px;}
.semiTitle {margin-left: 25px; font-weight: bold; color: #4A4A4A; }

#mainButton { margin-left: 260px; }

.searchButton { 
	width: 100px; 
	float:left; 
	margin-left: 20px;
}
.searchCondition {
	 width: 100px; 
	 margin-left: 25px;
	 float:left; 
 }
.searchInput { 
	float:left; 
	width: 150px;
}

.backMain { width: 200px; display: inline-block;}
.search {}

</style>

<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">커뮤니티</h3>
		<div class="row row-cols-auto">
			<div class="col"><a href="#" class="text-decoration-none" style="color:#C2C2C2">커뮤니티 홈</a></div>
			<div class="col"><a href="#" class="text-decoration-none" style="color:#C2C2C2">업종별 커뮤니티</a></div>
			<div class="colNoticeTitle" style="margin-bottom: 15px;">
				<div>지역별 커뮤니티</div>
			</div>
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">지역별 커뮤니티</h3>
			
			<h6 class="semiTitle">&nbsp;지역 기준</h6>
			
			<form class="typeSelectorForm">
				<div class="typeSelectorLarge">
					<select class="form-select" aria-label="Default select example">
						<option selected>지역 선택</option>
						<option value="1">지역1</option>
						<option value="2">지역2</option>
						<option value="3">지역3</option>
					</select>
				</div>
				<div class="typeSelectorSmall">
					<select name="condition" class="form-select">
						<option selected>세부지역 선택</option>
						<option value="1">세부지역1</option>
						<option value="2">세부지역2</option>
						<option value="3">세부지역3</option>
					</select>
				</div>
			</form>
			
			<button type="button" class="btn btn-primary ">조회</button>
			<br>
			<hr class="division">
			<div class="container text-center" id="board" style="margin-left: 28px;">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">작성자</th>
							<th scope="col">좋아요 수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
							<td>김*준</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="sendButton">
				<button type="button" class="btn btn-primary" style="margin-left: 740px;">글 작성</button>
			</div>

			<br>
			
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>


			<div class="search">
				<form action="">
					<div class="searchCondition" style="margin-left: 220px; margin-bottom: 20px;">
						<select class="form-select" id="condition">
								<option selected>전체</option>
								<option value="1">제목</option>
								<option value="2">제목+내용</option>
								<option value="3">내용</option>
						</select>
					</div>
					<div class="searchInput">
						<input type="text" class="form-control" id="searchComm">
					</div>
					<div class="searchButton">
						<button type="button" class="btn btn-primary ">검색</button>
					</div>
				</form>
			</div>
			<br>

		</div>
	</div>


</div>