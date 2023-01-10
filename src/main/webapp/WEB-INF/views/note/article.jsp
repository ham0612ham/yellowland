<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
	margin: auto;
}
#this-title { font-size: 30px; font-weight: 600; color: #36C88A; }
.table .ellipsis {
	position: relative;
	min-width: 200px;
}
.table .ellipsis span {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: absolute;
	left: 85px;
	right: 9px;
	cursor: pointer;
}
.table .ellipsis:before {
	content: '';
	display: inline-block;
}
.btnReplyNote, .btnSpam, .btnWrite, .btnDelete, .btnList { 
	width: 30%; border-radius: 8px; border: 0.5px solid #A3A6AD; color: #A3A6AD;
	background: white; 
}
.reply-form textarea {
	height: 130px;
}
a { text-decoration: none; color: black; }
.delete, .list { cursor:pointer; }
.delete:hover, .list:hover { color: #36C88A; }

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">


<script type="text/javascript">
$(function(){
	let menu = "${menuItem}";
	$("#tab-"+menu).addClass("active");
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		let url = "${pageContext.request.contextPath}/note/"+tab+"/list";
		location.href = url;
    });
});

$(function(){
	$(".btnReplyNote").click(function(){
		$("#myDialogModal").modal("show");
	});

	$(".btnSendOk").click(function(){
		const f = document.replyForm;
		if(!f.content.value) {
			alert("내용을 입력하세요. ");
			f.content.focus();
			return false;
		}
		
		$("#myDialogModal").modal("hide");
		
		f.action = "${pageContext.request.contextPath}/note/write";
		f.submit();
	});
});

function deleteNote() {
	let query = "nums=${dto.num}&${query}";
	let url = "${pageContext.request.contextPath}/note/${menuItem}/delete?" + query;

	if(confirm("쪽지를 삭제 하시 겠습니까 ? ")) {
		location.href = url;
	}
}
</script>

<div class="container">
	<div class="body-container">
		<div class="body-title" style="margin-bottom: 12px;">
			<div id="this-title">쪽지함</div>
		</div>

		<div class="body-main">
			<table class="table table-borderless mb-0">
				<tr>
					<td align="left" width="50%" style="    padding-left: 0px;">
						<c:if test="${menuItem=='receive'}">
							<button type="button" class="btn btn-primary btnReplyNote">답장 보내기</button>
							<!-- <button type="button" class="btn btn-primary btnSpam">스팸신고</button> -->
						</c:if>
					</td>
					<td align="right">
						<button type="button" class="btn btn-primary btnWrite"
							onclick="javascript:location.href='${pageContext.request.contextPath}/note/write';">쪽지쓰기</button>
					</td>
				</tr>
			</table>

			<table class="table mb-0">
				<tr class="border-top2">
					<td colspan="2" align="left">
						<c:choose>
							<c:when test="${menuItem=='receive'}">보낸사람 : ${dto.senderName}(${dto.senderId})</c:when>
							<c:when test="${menuItem=='send'}">받는사람 : ${dto.receiverName}(${dto.receiverId})</c:when>
						</c:choose>
					</td>
				</tr>

				<tr>
					<td width="50%">
						<c:choose>
							<c:when test="${menuItem=='receive'}">받은날짜 : ${dto.sendDay}</c:when>
							<c:when test="${menuItem=='send'}">보낸날짜 : ${dto.sendDay}</c:when>
						</c:choose></td>
					<td align="right">읽은날짜 : ${empty dto.identifyDay ? "읽지 않음": dto.identifyDay}
					</td>
				</tr>

				<tr>
					<td colspan="2" valign="top" height="170">${dto.content}</td>
				</tr>

				<tr>
					<td colspan="2" class="ellipsis">이전쪽지 : 
						<c:if test="${not empty preDto}">	
							<span>
								<a href="${pageContext.request.contextPath}/note/${menuItem}/article?${query}&num=${preDto.num}">${preDto.content}</a>
							</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="ellipsis">다음쪽지 : 
						<c:if test="${not empty nextDto}">
							<span>
								<a href="${pageContext.request.contextPath}/note/${menuItem}/article?${query}&num=${nextDto.num}">${nextDto.content}"></a>
							</span>
						</c:if>
					</td>
				</tr>
			</table>

			<table class="table table-borderless">
				<tr>
					<td width="50%">
						<div class="delete" onclick="deleteNote();">삭제</div>
					</td>
					<td class="text-end">
						<div class="list" onclick="location.href='${pageContext.request.contextPath}/note/${menuItem}/list?${query}';">리스트</div>
					</td>
				</tr>
			</table>

		</div>
	</div>

</div>

<div class="modal fade" id="myDialogModal" tabindex="-1"
	data-bs-backdrop="static" data-bs-keyboard="false"
	aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">답장 쓰기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form name="replyForm" method="post">
					<div class="row reply-form m-1">
						<textarea name="content" class="form-control"></textarea>
						<input type="hidden" name="receivers" value="${dto.senderId}">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btnSendCancel"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary btnSendOk">보내기</button>
			</div>
		</div>
	</div>
</div>