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
	text-align: center;
}

.bi bi-chevron-bar-right::after{
	color: white; 
}

.bi bi-chevron-bar-left::before {
	color: white; 
}


</style>

<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">고객센터</h3>
		<div class="row row-cols-auto">
			<div class="col"><a href="${pageContext.request.contextPath}/notice/list" class="text-decoration-none" style="color:#C2C2C2">공지사항</a></div>
			<div class="colNoticeTitle">
				<div>자주하는 질문</div>
			</div>
			<div class="col"><a href="${pageContext.request.contextPath}/qna/list" class="text-decoration-none" style="color:#C2C2C2">1:1 문의</a></div>
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">자주하는 질문</h3>
			<br>
			<div class="container text-center">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="accordion" id="accordionFlushExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="flush-heading-${status.index}">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false">
							       	<div class="questionSubject">
							       		<h3>Q&nbsp;</h3>
							       		<span>${dto.subject}</span>
							       	</div>
							      </button>
							    </h2>
							    <div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      		<div class="questionContentSize" >
											<div >
												<h3 class="questionContentADetail">A</h3>
												<span class="questionContentMainDetail" style="font-size: 20px;">${dto.content}</span>
											</div>	
										</div>
							      </div>
							    </div>
							  </div>
					</c:forEach>
				</div>
			</div>
		</div>

	
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>


<ul id="pagination-demo" class="pagination-sm"></ul>
		</div>


	</div>
</div>