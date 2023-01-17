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
.articleContent { min-height: 350px; text-align: center;}
.articleManagerCircle {display: inline; color: #756EF2;}
.articleManagerManager  {display: inline; font-size: 15px; font-weight: bold; color: #696969;}
.articleManagerDate {display: inline; font-size: 16px; color: #696969;}
.articleManagerContent {margin-left: 50px; width: 500px; margin-top: 10px;}
.articleManagerContentDetail { margin-top: 50px;}
.division {margin-bottom: 10px; margin-top: 10px;}
.preNext {font-size: 18px;}
.btn {width: 80px; height:40px; font-size: 13px; }

</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
function deleteOk(num) {
    if(confirm("문의글을 삭제 하시 겠습니까 ? ")) {
    	let query = "num="+num+"&page=${page}";
	    let url = "${pageContext.request.contextPath}/admin/qnaManage/delete?" + query;
    	location.href = url;
    }
}
</c:if>

<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50 }">
function deleteInquiry(num) {
	if(confirm("문의를 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/admin/qnaManage/delete?"+query;
		location.href = url;
	}
}
</c:if>

<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50 }">
function deleteAnswer(num) {
	if(confirm("답변을 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/admin/qnaManage/deleteAnswer?"+query;
		location.href = url;
	}
}

function sendReplyOk() {
	const f = document.replyForm;
	if(!f.content.value.trim()) {
		alert("답변을 입력 하세요");
		f.content.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/admin/qnaManage/reply";
	f.submit();
}
</c:if>
</script>

<div class="container">
	<div class="body-container">	
		<div class="articleSubject">
			<h3 class="categoryTitle">1:1 문의</h3>
			<h3 class="fw-semibold">${dto.subject}</h3>	
		</div>
		<div class="articleWriter">
			<h4 class="articleWriterCircle">●&nbsp;</h4>
			<h3 class="articleWriterManager">${dto.userName}</h3>
			<h3 class="articleWriterDate">&nbsp;${dto.regDate}</h3>
			<h3	class="articleWriterIsAnswer">&nbsp;${dto.isReply==0?"답변대기":"답변완료"}</h3>
		</div>

		<hr>

		<div class="articleContent">
			<span class="articleContentDetail">
				${dto.content} 
			</span>
		</div>
		<div class="articleLower">
			<hr class="division">
			<h5 class="preNext" style="color: #696969; font-size: 16px;">
				이전글:
				<c:if test="${not empty preReadDto}">
					<a href="${pageContext.request.contextPath}/admin/qnaManage/article?${query}&num=${preReadDto.num}" style=" text-decoration: none; color:black;">${preReadDto.subject}</a>
				</c:if>
			</h5>
			<hr class="division">
			<h5 class="preNext" style="color: #696969; font-size: 16px;">
				다음글:
				<c:if test="${not empty nextReadDto}">
					<a href="${pageContext.request.contextPath}/admin/qnaManage/article?${query}&num=${nextReadDto.num}" style=" text-decoration: none; color:black;">${nextReadDto.subject}</a>
				</c:if>	
			</h5>
			<hr class="division">
		</div>
	<hr>

 <c:if test="${empty  dto.isReply && sessionScope.member.membership>50}">
				<div class="reply">
					<form name="replyForm" method="post">
						<div class='form-header'>
							<span class="bold">답변달기</span><span> - 문의에 대한 답변을 입력 하세요</span>
						</div>
						
						<table class="table table-borderless reply-form">
							<tr>
								<td>
									<textarea class='form-control' name='answer'></textarea>
								</td>
							</tr>
							<tr>
							   <td align='right'>
							        <button type='button' class='btn btn-light' onclick="sendReplyOk()">답변 등록</button>
							        <input type="hidden" name="num" value="${dto.num}">
							        <input type="hidden" name="page" value="${page}">
							        <input type="hidden" name="condition" value="${condition}">
							        <input type="hidden" name="keyword" value="${keyword}">
							    </td>
							 </tr>
						</table>
					</form>
				</div>
			</c:if>
  
 <c:if test="${not empty dto.isReply}">
				<table class="table mb-0">
					<tbody>
						<tr>
							<td colspan="2"  class="p-0">
								<div class="articleManager">
									<h4 class="articleManagerCircle">●&nbsp;</h4>
									<h3 class="articleManagerManager">관리자</h3>
									<h3 class="articleManagerDate">&nbsp;${replydto.regDate}</h3>
									<br>
									
								   <br>
								</div>
							</td>
						</tr>
					
						<tr>
							<td width="50%">
								담당자 : ${replydto.userName}
							</td>
							<td align="right">
								답변일자 :  ${replydto.regDate}
							</td>
						</tr>
						<tr>
			
						</tr>
						<tr>							
							<td colspan="2" valign="top" height="150">
								${replydto.content}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		
			<table class="table table-borderless mb-2">
				<tr>
					<td width="50%" >
						<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
							<button type="button" class="btn btn-light"  onclick="deleteInquiry('${dto.num}');">질문삭제</button>
						</c:if>
						<c:if test="${not empty replydto.content && sessionScope.member.membership>50}">
							<button type="button" class="btn btn-light" onclick="deleteAnswer('${dto.num}');">답변삭제</button>
						</c:if>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/qnaManage/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			
			<c:if test="${empty replydto && sessionScope.member.membership>50}">
				<div class="reply">
					<form name="replyForm" method="post">
						<div class='form-header'>
							<span class="bold">답변달기</span><span> - 문의에 대한 답변을 입력 하세요</span>
						</div>
						
						<table class="table table-borderless reply-form">
							<tr>
								<td>
									<textarea class='form-control' name='content'></textarea>
								</td>
							</tr>
							<tr>
							   <td align='right'>
							        <button type='button' class='btn btn-light' onclick="sendReplyOk()">답변 등록</button>
							        <input type="hidden" name="num" value="${dto.num}">
							        <input type="hidden" name="page" value="${page}">
							        <input type="hidden" name="condition" value="${condition}">
							        <input type="hidden" name="keyword" value="${keyword}">
							    </td>
							 </tr>
							
						</table>
					</form>
				</div>
			</c:if>
		
		<br>	
		<br>	
		

		
	
		
		
	</div>
</div>
