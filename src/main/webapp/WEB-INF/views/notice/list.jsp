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
	margin-bottom: 65px;
	min-height: 300px;
}

.fw-semibold { height: 50px; width: 150px; font-size: 30px; }
.table1 {float: left; width: 300px;text-align: left;}
.table2 {width: 800px; text-align: left;}

.col { font-weight: bold; color: #C2C2C2; font-size: 18px;}
.colNoticeTitle {font-weight: bold; color: #36C88A; font-size: 18px;}
.title1 {font-weight: bold; color: #36C88A; font-size: 30px; }

.text-decoration-none {color: #C2C2C2;} 

.division {margin-top: 20px; margin-bottom: 10px;}
.container.text-center {margin-top: 0px; margin-left: 40px; margin-right: 100px;}

.form-select {
	border: revert;
	border-radius: 0px;
	margin-left: 240px;
}

.col-auto {
	display: inline-block;
}

.col-6 {
	width: 100%;
}

.pagination {
	--bs-pagination-hover-bg: #36C88A; 
	--bs-pagination-focus-bg: #36C88A; 
	--bs-pagination-focus-color: #ffffff;
	--bs-pagination-hover-color: #ffffff;
	}

.page-navigation {
	text-align: center;
}


</style>

<script>
function searchList(){
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">고객센터</h3>
		<div class="row row-cols-auto" style="height: 100px; width: 150px;">
			<div class="colNoticeTitle">
				<div>공지사항</div>
			</div>
			<div class="col"><a href="${pageContext.request.contextPath}/faq/list" class="text-decoration-none" style="color:#C2C2C2">자주하는 질문</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/qna/list" class="text-decoration-none" style="color:#C2C2C2">1:1 문의</a></div>
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">공지사항</h3>
			<hr class="division">
			<div class="container text-center">
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col" style=" max-width: 380px;" >제목</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<th scope="row">${dataCount - (page-1) * size - status.index}</th>
								<td style=" max-width: 380px; text-overflow: ellipsis; white-space: nowrap; overflow:hidden;">
									<a href="${articleUrl}&num=${dto.num}" class="text-reset" style=" text-decoration: none; color:black;">${dto.subject}</td>
								<td>${dto.reg_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			<div class="col-6 text-center" style="display: flex; margin-top: 60px;">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/notice/list" method="post">
						<div class="col-auto p-1" style="flex:1;">
							<select name="condition" class="form-select" style="width: 80px;">
								<option value="all" ${condition=="all"?"selected='selected'":""}>전체</option>
								<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1"  style="float: left;">
							<input type="text" name="keyword" value="${keyword}" class="form-control">
						</div>
						<div class="col-auto p-1"  style="float: right;">
							<button type="button" class="btn btn-primary" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>

		</div>


	</div>


</div>