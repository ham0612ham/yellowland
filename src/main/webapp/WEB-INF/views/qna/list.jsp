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

.container {margin-bottom: 10px;}

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
	float: left;
	}

.pagination justify-content-center {
	float: left;
}

.btn {
    width: 80px;
    margin-left: 735px;
    margin-bottom: 40px;

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

.page-navigation {
	margin-left: 330px;
	margin-bottom: 50px;
}

.show {
    animation: none;
}


</style>


<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">고객센터</h3>
		<div class="row row-cols-auto">
			<div class="col"><a href="${pageContext.request.contextPath}/notice/list" class="text-decoration-none" style="color:#C2C2C2">공지사항</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/faq/list" class="text-decoration-none" style="color:#C2C2C2">자주하는 질문</a></div>
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
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<th scope="row">${dataCount - (page-1) * size - status.index}</th>
									<td><a href="${articleUrl}&num=${dto.num}" style=" text-decoration: none; color:black;" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">${dto.subject} Open modal for @mdo</td>
								
								<td>${dto.userName}</td>
								<td>${dto.replyNum==1?"답변완료":"-"}</td>
								<td>${dto.reg_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<c:choose>
				<c:when test="${sessionScope.member.userId ne null}">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/qna/write';">글 작성</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/login';">글 작성</button>
				</c:otherwise>
			</c:choose>

			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
 
 
			<button type="button" class="btn btn-primary" ></button>
	
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">비밀번호:</label>
			            <input type="password" class="form-control" id="recipient-name">
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary">입력</button>
			      </div>
			    </div>
			  </div>
			</div>

		</div>
	</div>
</div>