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

.container {margin-bottom: 30px;}

.fw-semibold { height: 50px; width: 150px; font-size: 30px; margin-bottom: 3px;}
.row { height: 100px; width: 150px;}
.table1 {float: left; width: 300px;text-align: left;}
.table2 {width: 800px; text-align: left;}

.col { font-weight: bold; color: #C2C2C2; font-size: 18px; margin-top: 5px;}
.colNoticeTitle {font-weight: bold; color: #36C88A; font-size: 18px; margin-top: 5px;}
.title1 {font-weight: bold; color: #36C88A; font-size: 30px; }

.text-decoration-none {color: #C2C2C2;} 

.division {margin-top: 20px; margin-bottom: 10px;}
.container.text-center {margin-top: 0px; margin-left: 40px; margin-right: 100px;}

.isAnswer { color:#36C88A; }

.pagination {
	margin-left: 340px; 
	--bs-pagination-hover-bg: #36C88A; 
	--bs-pagination-focus-bg: #36C88A; 
	--bs-pagination-focus-color: #ffffff;
	--bs-pagination-hover-color: #ffffff;
	margin-bottom: 40px;
	}


.btn {
    width: 80px;
}

.sendButton { 
	width: 100px; 
	margin-left: 645px;
}

.searchButton { 
	width: 100px; 
	float:left; 
	margin-left: 20px;
}
.searchCondition {
	 width: 60px; 
	 margin-left: 25px;
	 float:left; 
	 margin-right: 20px;
 }
.searchInput { 
	float:left; 
	width: 150px;
	margin-left: 240px;
}


#searchComm { width: 160px; }


.form-select {
	border: solid 0.5px;
	border-color: #C2C2C2; 
	border-radius: 3px;
	width: 90px;
	margin-right: 10px;
	margin-left: 220px;
} 


</style>

<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">고객센터</h3>
		<div class="row row-cols-auto">
			<div class="col"><a href="#" class="text-decoration-none" style="color:#C2C2C2">공지사항</a></div>
			<div class="col"><a href="#" class="text-decoration-none" style="color:#C2C2C2">자주하는 질문</a></div>
			<div class="colNoticeTitle">
				<div>1:1 문의</div>
			</div>
			
			
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">1:1 문의</h3>
			<hr class="division">
			<div class="container text-center">
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">답변여부</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>문의 드립니다</td>
							<td>김*바</td>
							<td>-</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>궁금해요 !!!!!!!!!!!</td>
							<td>김*바</td>
							<td>-</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>알려주세요 </td>
							<td>김*바</td>
							<td class="isAnswer">답변완료</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>문의 100번째 드려요</td>
							<td>김*바</td>
							<td class="isAnswer">답변완료</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>문의 100번째 드려요</td>
							<td>김*바</td>
							<td class="isAnswer">답변완료</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>문의 100번째 드려요</td>
							<td>김*바</td>
							<td class="isAnswer">답변완료</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>문의 100번째 드려요</td>
							<td>김*바</td>
							<td class="isAnswer">답변완료</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>문의 100번째 드려요</td>
							<td>김*바</td>
							<td class="isAnswer">답변완료</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>문의 100번째 드려요</td>
							<td>김*바</td>
							<td class="isAnswer">답변완료</td>
							<td>2022-01-01</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>문의 100번째 드려요</td>
							<td>김*바</td>
							<td class="isAnswer">답변완료</td>
							<td>2022-01-01</td>
						</tr>
					</tbody>
				</table>
				<div class="sendButton">
					<button type="button" class="btn btn-primary ">글 작성</button>
				</div>
			</div>



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
					<div class="searchCondition">
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



		</div>


	</div>


</div>