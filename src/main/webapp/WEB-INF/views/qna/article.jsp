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

.categoryTitle {font-size: 17px; color: #696969;}


.articleWriterCircle {display: inline; color: #36C88A;}
.articleWriterManager {display: inline; font-size: 15px; font-weight: bold; color: #696969;}
.articleWriterDate {display: inline; font-size: 16px; color: #696969;}
.articleWriterIsAnswer {display: inline; font-size: 15px; color: #696969;}

.articleContent {height: 200px;}
.articleManagerCircle {display: inline; color: #756EF2;}
.articleManagerManager  {display: inline; font-size: 15px; font-weight: bold; color: #696969;}
.articleManagerDate {display: inline; font-size: 16px; color: #696969;}

.articleManagerContent {margin-left: 50px; width: 500px; margin-top: 10px;}
.articleManagerContentDetail { margin-top: 50px;}



.division {margin-bottom: 10px; margin-top: 10px;}
.preNext {font-size: 18px;}
.btn {width: 80px; float: right; font-size: 19px; }

</style>

<div class="container">
	<div class="body-container">	
		<div class="articleSubject">
			<h3 class="categoryTitle">1:1 문의</h3>
			<h3 class="fw-semibold">이거 궁금해요 ~ !!!</h3>	
		</div>
		<div class="articleWriter">
			<h4 class="articleWriterCircle">●&nbsp;</h4>
			<h3 class="articleWriterManager">김*자</h3>
			<h3 class="articleWriterDate">&nbsp;2022-01-01</h3>
			<h3	class="articleWriterIsAnswer">&nbsp;답변완료</h3>
		</div>


		<hr>

		<div class="articleContent">
			<span class="articleContentDetail">
				우리지역에 있는 상권이 궁금해요 ! ! ! 
			</span>
		</div>
		
		<hr>
		<div class="articleManager">
			<h4 class="articleManagerCircle">●&nbsp;</h4>
			<h3 class="articleManagerManager">관리자</h3>
			<h3 class="articleManagerDate">&nbsp;2022-01-01</h3>
			<br>
			<div  class="articleManagerContent">
				<span class="articleManagerContentDetail">
				안녕하세요. 답변드립니다. 
				상단 메뉴의 나도곧 ..... 
				메뉴를 선택하신후 ....... 
				........ 하시면 됩니다. 
				감사합니다.
				</span>
			</div>
			<br>
		</div>
		
		
		<div class="articleLower">
			<hr class="division">
			<h5 class="preNext">이전글:</h5>
			<hr class="division">
			<h5 class="preNext">다음글:</h5>
			<hr class="division">
		</div>
		<br>
		<button type="button" class="btn btn-primary ">목록</button>
	</div>
</div>