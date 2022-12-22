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


.fw-semibold { height: 50px; width: 150px; font-size: 30px; }
.row { height: 100px; width: 150px;}
.table1 {float: left; width: 300px;text-align: left;}
.table2 {width: 800px; text-align: left;}

.col { font-weight: bold; color: #C2C2C2; font-size: 18px;}
.colNoticeTitle {font-weight: bold; color: #36C88A; font-size: 18px;}
.title1 {font-weight: bold; color: #36C88A; font-size: 30px; }


.division {margin-top: 20px; margin-bottom: 10px; margin-left: 20px; border-width: 2px;}


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

#searchComm {
	width: 140px;
}

#condition {
	width: 105px;
}

#board {
	margin: 10px;
}

</style>

<div class="container">
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">업종별 커뮤니티</h3>
			<h6>업종 기준</h6>
			
				<form>
					<div>
						<select class="form-select" aria-label="Default select example">
							<option selected>업종 선택</option>
							<option value="1">서비스</option>
							<option value="2">도소매</option>
							<option value="3">그 외</option>
						</select>
					</div>
				<div>
					<select name="condition" class="form-select" id="sel-condition">
						<option selected>세부업종 선택</option>
						<option value="1">세부업종1</option>
						<option value="2">세부업종2</option>
						<option value="3">세부업종3</option>
					</select>
				</div>
			</form>
			
			<button type="button" class="btn btn-primary ">검색</button>
			<br>
			<hr class="division">
			<div class="container text-center" id="board">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>

						</tr>
						<tr>
							<th scope="row">2</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>서울시가 다양한 상권정보를 알려드립니다.</td>
							<td>2022-01-01</td>
						</tr>
					</tbody>
				</table>
			</div>
			<button type="button" class="btn btn-outline-secondary" id="mainButton">커뮤니티 메인</button>

			<form action="">
				<div>
					<select class="form-select" id="condition">
							<option selected>검색</option>
							<option value="1">제목</option>
							<option value="2">제목+내용</option>
							<option value="3">내용</option>
					</select>
				</div>
				<div>
					<input type="text" class="form-control" id="searchComm">
				</div>
				<div>
					<button type="button" class="btn btn-primary ">검색</button>
				</div>
			</form>

			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>


</div>