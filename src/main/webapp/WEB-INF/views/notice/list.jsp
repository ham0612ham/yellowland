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

.container {

}

.fw-semibold { height: 50px; width: 150px; }
.row { height: 100px; width: 150px;}
.table1 {float: left; width: 300px;text-align: left;}
.table2 {width: 800px; text-align: left;}

.col {margin-left: 5px; font-weight: bold; color: #C2C2C2; font-size: 18px;}
.title1 {font-weight: bold; color: #36C88A; font-size: 36px; }


.division {margin-top: 20px; margin-bottom: 20px;}
.container.text-center {margin-top: 0px; margin-left: 40px; margin-right: 100px;}

.pagination {margin-left: 340px;}

</style>

<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">고객센터</h3>
		<div class="row row-cols-auto">
			<div class="col">공지사항</div>
			<div class="col">자주하는 질문</div>
			<div class="col">1:1 문의</div>
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">공지사항</h3>
			<hr class="division">
			<div class="container text-center">
				<table class="table table-borderless table-hover" style="margin-left: 0px;">
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

		</div>


	</div>


</div>