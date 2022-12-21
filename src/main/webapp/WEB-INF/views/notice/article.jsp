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


.division {margin-bottom: 10px; margin-top: 10px;}
.preNext {font-size: 18px;}
.btn {width: 80px; float: right; font-size: 19px; }

</style>

<div class="container">
	<div class="body-container">	
		<div class="articleSubject">
			<h3 class="categoryTitle">공지사항</h3>
			<h3 class="fw-semibold">서울시가 다양한 상권 분석을 도와드립니다.</h3>	
		</div>
		<div class="articleWriter">
			<h4 class="articleWriterCircle">●&nbsp;</h4>
			<h3 class="articleWriterManager">관리자</h3>
			<h3 class="articleWriterDate">&nbsp;2022-01-01</h3>
		</div>


		<hr>

		<div class="articleContent">
			<h3>내용입니다</h3>
			<br><br>
			<h3>내용입니다</h3>
			<h3>내용입니다</h3>
			<h3>내용입니다</h3>
			<br><br>
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