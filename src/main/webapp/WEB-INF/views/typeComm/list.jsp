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

.title1 {margin-bottom: 20px;}

.fw-semibold { height: 50px; width: 150px; font-size: 30px; }
.row { 
	height: 100px; 
	width: 160px;
}
.table1 {float: left; width: 300px; text-align: left;}
.table2 {width: 800px; text-align: left;}

.col { font-weight: bold; color: #C2C2C2; font-size: 18px;}
.colNoticeTitle {
	font-weight: bold; 
	color: #36C88A; 
	font-size: 18px;
	height: 10px;
	}
.title1 {font-weight: bold; color: #36C88A; font-size: 30px; }


.division {
	margin-top: 20px; 
	margin-bottom: 10px; 
	margin-left: 20px; 
	border-width: 2px;
	background-color:black;
	background: black;
}


.pagination {
	--bs-pagination-hover-bg: #36C88A; 
	--bs-pagination-focus-bg: #36C88A; 
	--bs-pagination-focus-color: #ffffff;
	--bs-pagination-hover-color: #ffffff;
	}

.page-navigation {
	margin-bottom: 50px;
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

#searchComm { width: 160px; }

#condition { width: 90px; }

#board { margin: 10px; }

.typeSelectorLarge { width: 170px; float: left; }
.typeSelectorSmall { width: 170px; float: left}

.typeSelectorForm {margin-left: 20px;}
.semiTitle {margin-left: 25px; font-weight: bold; color: #4A4A4A; }

#mainButton { margin-left: 260px; }

.searchButton { 
	width: 100px; 
	float:left; 
	margin-left: 20px;
}
.searchCondition {
	 width: 100px; 
	 margin-left: 25px;
	 float:left; 
 }
.searchInput { 
	float:left; 
	width: 150px;
}

.backMain { width: 200px; display: inline-block;}
.search {}

</style>

<script type="text/javascript">
function sendSearch() {
	
}

function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$("form select[name=siguNum]").change(function(){
		let siguNum = $(this).val();
		$("form select[name=dongNum]").find('option').remove().end()
				.append("<option value=''>행정동</option>");
		
		if(! siguNum) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/localComm/listDong";
		let query = "siguNum="+siguNum;
		
		const fn = function(data) {
			$.each(data.listDong, function(index, item){
				let dongNum = item.dongNum;
				let dongName = item.dongName;
				let s = "<option value='"+dongNum+"'>"+dongName+"</option>";
				$("form select[name=dongNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
	});
});
</script>

<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">커뮤니티</h3>
		<div class="row row-cols-auto">
			<div class="col"><a href="#" class="text-decoration-none" style="color:#C2C2C2">커뮤니티 홈</a></div>
			<div class="colNoticeTitle" style="margin-bottom: 15px;">
				<div>업종별 커뮤니티</div>
			</div>
			<div class="col"><a href="${pageContext.request.contextPath}/localComm/list" class="text-decoration-none" style="color:#C2C2C2">지역별 커뮤니티</a></div>
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">업종별 커뮤니티</h3>
			
			<h6 class="semiTitle">&nbsp;업종 기준</h6>
			
			<form class="typeSelectorForm">
				<thead>
					<tr>
						<th scope="col" class="typeCkeck"></th>
						<th scope="col" class="typeCkeck">
							<div class="col-auto p-1" style="flex: 1; float: left;">
								<select name="siguNum" class="form-select" style="width: 125px;">
									<option value="">:: 대분류 ::</option>
									<c:forEach var="vo" items="${listSigu}">
										<option value="${vo.siguNum}"
											${vo.siguNum==dto.siguNum?"selected='selected'":""}>${vo.siguName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-auto p-1" style="flex: 1; float: left;">
								<select name="dongNum" class="form-select" style="width: 125px;">
									<option value="" ${condition=="all"?"selected='selected'":""}>소분류</option>
								</select>
							</div>
						</th>
					</tr>
				</thead>
			</form>
			
			<button type="button" class="btn btn-primary" style="margin-left: 10px; margin-top: 3px;" onclick="sendSearch();">조회</button>
			<br>
			<hr class="division">
			<div class="container text-center" id="board" style="margin-left: 28px;">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">작성자</th>
							<th scope="col">조회수</th>
							<th scope="col">좋아요 수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<th scope="row">${dataCount - (page-1) * size - status.index}</th>
								<td>
									<a href="${articleUrl}&num=${dto.num}" style="text-decoration:none; color:black;">${dto.subject}</a>
								</td>
								<td>${dto.regDate}</td>
								<td>${dto.userName}</td>
								<td>${dto.hitCount}</td>
								<td>0</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<c:choose>
				<c:when test="${sessionScope.member.userId ne null}">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/typeComm/write';" style="margin-left: 740px;">글 작성</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/login';" style="margin-left: 740px;">글 작성</button>
				</c:otherwise>
			</c:choose>



			<br>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>



			<div class="search">
				<form action="">
					<div class="searchCondition" style="margin-left: 220px; margin-bottom: 20px;">
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
			<br>

		</div>
	</div>


</div>