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
.row { height: 200px; width: 220px;}
.table1 {float: left; width: 300px;text-align: left;}
.table2 {width: 800px; text-align: left;}

.col { font-weight: bold; color: #C2C2C2; font-size: 18px;}
.colNoticeTitle {font-weight: bold; color: #36C88A; font-size: 18px;  }
.title1 {font-weight: bold; color: #36C88A; font-size: 30px; margin: 0px; }

.text-decoration-none {color: #C2C2C2;} 

.questionSubject { display: flex; align-items: center;}
.questionContentADetail { float: left; margin-right: 10px;}


.division {margin-top: 20px; margin-bottom: 10px;}
.container.text-center {margin-top: 0px; margin-left: 40px; margin-right: 100px;}

.accordion-button {background-color: #36C88A; color: white;} 
.collapseOne {background-color: #36C88A;}

.accordion-button::after { display: none; }

.accordion-button:not(.collapsed) {
	color: white;
	background-color: #36C88A;
}

.accordion-item {
	overflow-wrap: break-word;
}

.pagination {
	margin-top: 70px;
	--bs-pagination-hover-bg: #36C88A; 
	--bs-pagination-focus-bg: #36C88A; 
	--bs-pagination-focus-color: #ffffff;
	--bs-pagination-hover-color: #ffffff;
	}

.page-navigation {
	margin-top: 20px;
}

.bi bi-chevron-bar-right::after{
	color: white; 
}

.bi bi-chevron-bar-left::before {
	color: white; 
}
.search-btn {height: 38.2px;margin-left: 5px;border-radius: 8px;width: 70px;}
#sel-condition { width: 150px; color: #000; 
	border: 0.5px solid #A3A6AD; font-size: 14px; 
	border-radius: 8px; height: 38.2px; width: 150px;
}
#keyword-input {height: 38.2px;width: 200px;margin-left: 6px;border-radius: 8px;border: 0.5px solid #A3A6AD;}
</style>
<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">마이페이지</h3>
		<div class="row row-cols-auto">
			<div class="col"><a href="${pageContext.request.contextPath}/member/detail" class="text-decoration-none" style="color:#C2C2C2">회원정보</a></div>					
			<div class="colNoticeTitle">
				<div>내가작성한 1대1문의</div>
			</div>
			<div class="col"><a href="${pageContext.request.contextPath}/mylocal/list" class="text-decoration-none" style="color:#C2C2C2">내가작성한 게시글</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/myReply/list" class="text-decoration-none" style="color:#C2C2C2">내가작성한 답변</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/note/receive/list" class="text-decoration-none" style="color:#C2C2C2"> 쪽지함</a></div>
			<!-- <div class="col"><a href="${pageContext.request.contextPath}/#" class="text-decoration-none" style="color:#C2C2C2">나의 매칭결과 리스트</a></div>-->
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">내가 작성한 1대1문의</h3>
			<hr class="division">
			<div class="container text-center">
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">답변여부</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<th scope="row">${dataCount - (page-1) * size - status.index}</th>
								<td style=" max-width: 300px; text-overflow: ellipsis; white-space: nowrap; overflow:hidden;">
								<a href="${articleUrl}&num=${dto.num}" class="text-reset" style=" text-decoration: none; color:black;">${dto.subject}</a></td>
								<td>${dto.isReply!=0 ? "답변완료":"답변대기"}</td>
								<td>${dto.regDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			

			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			</div>
			<div class="board-list-footer d-flex justify-content-between" style="margin-top: 30px;">
				<button class="btnDelete btn btn-light" style="float: left; width: 90px; border-radius: 8px; border: 0.5px solid #A3A6AD; color: #A3A6AD;" onclick="location.href='${pageContext.request.contextPath}/myqna/list';">
					새로고침
				</button>
				<form class="d-flex justify-content-between" name="searchForm"
					class="d-flex justify-content-between"
					action="${pageContext.request.contextPath}/myqna/list"
					method="post">
					<div>
						<select name="condition" class="form-select" id="sel-condition">
							<option value="content"
								${condition=="content"?"selected='selected'":""}>내용</option>
							<c:choose>
								<c:when test="${menuItem=='receive'}">
									<option value="subject"
										${condition=="subject"?"selected='selected'":""}>제목</option>
									<option value="regDate"
										${condition=="regDate"?"selected='selected'":""}>작성날짜</option>
									
								</c:when>
								<c:otherwise>
									<option value="subject"
										${condition=="subject"?"selected='selected'":""}>제목</option>
									<option value="regDate"
										${condition=="regDate"?"selected='selected'":""}>작성날짜</option>
									
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div>
						<input type="text" name="keyword" value="${keyword}"
							class="form-control" id="keyword-input">
					</div>
					<div>
						<div class="btn btn-primary search-btn" onclick="searchList()">
							검색
						</div>
					</div>
				</form>
				<div style="width: 70px;">&nbsp;</div>
			</div>


		</div>


	</div>
</div>