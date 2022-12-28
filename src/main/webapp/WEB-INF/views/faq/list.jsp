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

.pagination {margin-left: 340px;}

.accordion-button::after { display: none; }

.accordion-button:not(.collapsed) {
	color: white;
	background-color: #36C88A;
}

.pagination {
	margin-left: 340px; 
	--bs-pagination-hover-bg: #36C88A; 
	--bs-pagination-focus-bg: #36C88A; 
	--bs-pagination-focus-color: #ffffff;
	--bs-pagination-hover-color: #ffffff;
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
				<div class="accordion" id="accordionFlushExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingOne">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false">
					       	<div class="questionSubject">
					       		<h3>Q&nbsp;</h3>
					       		<span>어쩌고 저쩌고고고고 왈라왈라라라랄 가능한가요 ?? </span>
					       	</div>
					      </button>
					    </h2>
					    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					      		<div class="questionContentSize" >
									<div >
										<h3 class="questionContentADetail">A</h3>
										<span class="questionContentMainDetail" >메인의 '카테고리' 메뉴를 누르면 해당 페이지로 이동가능합니다. 그리고 ~~~~도 가능합니다. ~~~~~ 밖에 눈이 옵니다. 모두 우산을 챙기세요 그리고 ~~~~도 가능합니다. ~~~~~ 밖에 눈이 옵니다. 모두 우산을 챙기세요</span>
									</div>	
								</div>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false">
					        <div class="questionSubject">
					       		<h3>Q&nbsp;</h3>
					       		<span>어쩌고 저쩌고고고고 왈라왈라라라랄 가능한가요 ?? </span>
					       	</div>
					      </button>
					    </h2>
					    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					      		<div class="questionContentSize" >
									<div >
										<h3 class="questionContentADetail">A</h3>
										<span class="questionContentMainDetail" >메인의 '카테고리' 메뉴를 누르면 해당 페이지로 이동가능합니다. 그리고 ~~~~도 가능합니다. ~~~~~ 밖에 눈이 옵니다. 모두 우산을 챙기세요 그리고 ~~~~도 가능합니다. ~~~~~ 밖에 눈이 옵니다. 모두 우산을 챙기세요</span>
									</div>	
								</div>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false">
					        <div class="questionSubject">
					       		<h3>Q&nbsp;</h3>
					       		<span>어쩌고 저쩌고고고고 왈라왈라라라랄 가능한가요 ?? </span>
					       	</div>
					      </button>
					    </h2>
					    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					      		<div class="questionContentSize" >
									<div >
										<h3 class="questionContentADetail">A</h3>
										<span class="questionContentMainDetail" >메인의 '카테고리' 메뉴를 누르면 해당 페이지로 이동가능합니다. 그리고 ~~~~도 가능합니다. ~~~~~ 밖에 눈이 옵니다. 모두 우산을 챙기세요 그리고 ~~~~도 가능합니다. ~~~~~ 밖에 눈이 옵니다. 모두 우산을 챙기세요</span>
									</div>	
								</div>					      
				     		</div>
					    </div>			    
	  				</div>
	  				 <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingFour">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false">
					        <div class="questionSubject">
					       		<h3>Q&nbsp;</h3>
					       		<span>어쩌고 저쩌고고고고 왈라왈라라라랄 가능한가요 ?? </span>
					       	</div>
					      </button>
					    </h2>
					    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					      		<div class="questionContentSize" >
									<div >
										<h3 class="questionContentADetail">A</h3>
										<span class="questionContentMainDetail" >메인의 '카테고리' 메뉴를 누르면 해당 페이지로 이동가능합니다. 그리고 ~~~~도 가능합니다. ~~~~~ 밖에 눈이 옵니다. 모두 우산을 챙기세요 그리고 ~~~~도 가능합니다. ~~~~~ 밖에 눈이 옵니다. 모두 우산을 챙기세요</span>
									</div>	
								</div>					      
						  </div>
					    </div>
					  </div>
				</div>
			
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

		</div>


	</div>


</div>