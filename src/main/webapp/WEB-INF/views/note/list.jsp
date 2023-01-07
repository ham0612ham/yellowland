<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 900px;
	min-height: 800px;
	margin: auto;
	margin-top: 100px;
}
#this-title { font-size: 30px; font-weight: 600; color: #36C88A; }
input[type=radio] { display: none; }
label{
	display: block; border-radius: 8px; margin: 0 auto; text-align: center; color: #000;
}
input[type=radio]:checked+label { background: #36C88A; color: white; border: 0.5px solid #36C88A; }
input[type=radio]:checked+label:hover { background: #18BD77; color: white; border: 0.5px solid #18BD77; }
input[type=radio]:hover+label { color: #36C88A; border: 0.5px solid #36C88A; }
label:hover { color: #18BD77; cursor: pointer; }
input[type=radio]+label { background: white; color: #A3A6AD; border: 0.5px solid #A3A6AD; }
.up-btn { padding: 8px 30px; }
thead > tr { text-align: center; }
th { font-weight: 500; }
tr { text-align: center; }
td { height: 40px; overflow: hidden; text-overflow: ellipsis; border: 0px;}
.text-reset { display: block; text-decoration: none; color: black; }
.ellipsis {
	position: relative;
	min-width: 200px;
}
.ellipsis span {
	overflow: hidden; white-space: nowrap; text-overflow: ellipsis;
	position: absolute; left: 9px;
	right: 9px; cursor: pointer;
}
.cancel { cursor: pointer; }
.cancel:hover { color: #A3A6AD; }
.content-td:hover { color: #A3A6AD; }
#sel-condition { width: 150px; color: #000; 
	border: 0.5px solid #A3A6AD; font-size: 14px; 
	border-radius: 8px; height: 38.2px; width: 150px;
}
#keyword-input { height: 38.2px; width: 200px; margin-left: 6px; border-radius: 8px; border: 0.5px solid #A3A6AD; }
.search-btn { height: 38.2px; margin-left: 5px; border-radius: 8px; width: 70px; }
.date-td { font-size: 13px; margin-top: 10px; }
.pagination { margin-top: 30px; }
.toast { width: 400px; height: 200px; }
#message-img { 
	position: absolute; top: 160px; right: 15%; z-index: -2; width: 180px; 
}
#table-div { 
	-webkit-backdrop-filter: blur(3px); backdrop-filter: blur(3px); 
	background: rgba(255, 255, 255, 0.3);
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">

$(function(){
	let menu = "${menuItem}";
	if(menu === "receive") {
		$("#receiveNotes").prop("checked", true);
	} else {
		$("#sendNotes").prop("checked", true);
	}
});

$(function(){
	let menu = "${menuItem}";
	$("#tab-"+menu).addClass("active");
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		let url = "${pageContext.request.contextPath}/note/"+tab+"/list";
		location.href=url;
    });
});

function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(function() {
    $("#chkAll").click(function() {
	   if($(this).is(":checked")) {
		   $("input[name=nums]").prop("checked", true);
        } else {
		   $("input[name=nums]").prop("checked", false);
        }
    });
 
    $(".btnDelete").click(function(){
		let cnt = $("input[name=nums]:checked").length;

		if (cnt === 0) {
			alert("삭제할 쪽지를 선택해주세요.");
			return;
		}
         
		if(confirm("선택한 쪽지를 삭제하시겠습니까?")) {
			const f = document.listForm;
			f.action = "${pageContext.request.contextPath}/note/${menuItem}/delete";
			f.submit();
		}
	});
});

$(function(){
	$(".deleteNote").click(function(){
		if(confirm("해당 쪽지를 삭제하시겠습니까?")) {
			let num = $(this).find("input").val();
			let url = "${pageContext.request.contextPath}/note/deleteOne?num="
					+num+"&menuItem=${menuItem}&keyword=${keyword}&page=${page}&condition=${condition}";
			location.href = url;
		}
	});
});
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title" style="margin-bottom: 12px;">
			<div id="this-title">쪽지함</div>
		</div>
		
		<div class="body-main">
			<div class="d-flex justify-content-between">
				<div class="d-flex justify-content-start">
					<input id="receiveNotes" type="radio" name="selectOne">
					<label for="receiveNotes" class="up-btn" style="margin-right: 7px;" onclick="javascript:location.href='${pageContext.request.contextPath}/note/receive/list';"><span>받은 쪽지함</span></label>
					<input id="sendNotes" type="radio" name="selectOne">
					<label for="sendNotes" class="up-btn" onclick="javascript:location.href='${pageContext.request.contextPath}/note/send/list';"><span>보낸 쪽지함</span></label>
				</div>
				<div>
					<input id="sendNote" type="radio" name="selectOnlyOne" checked>
					<label for="sendNote" class="up-btn" onclick="javascript:location.href='${pageContext.request.contextPath}/note/write';"><span>쪽지 보내기</span></label>
				</div>
			</div>
			<hr style="margin-bottom: 0px;">
			<form name="listForm" method="post">
				<div id="table-div">
				<table class="table note-table">
					<thead>
						<tr>
							<th scope="col" style="width: 8%">선택</th>
							<th scope="col" style="width: 450px;">내용</th>
							<th scope="col" style="width: 10%">${menuItem=="receive"?"보낸사람":"받는사람"}</th>
							<th scope="col" style="width: 17%;">${menuItem=="receive"?"받은날짜":"보낸날짜"}</th>
							<th scope="col" style="width: 17%;">읽은 날짜</th>
							<th scope="col" style="width: 8%">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
						
						<tr>
							<td>
								<input type="checkbox" name="nums" value="${dto.num}" class="form-check-input" style="margin-top: 6px;">
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.content}</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">${menuItem=="receive"?dto.senderName:dto.receiverName}</td>
							<td class="pd date-td" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">${dto.sendDay}</td>
							<td class="pd date-td" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">${dto.identifyDay}</td>
							<td class="pd cancel deleteNote" style="color:#4F4F4F padding: 10px 0;"><input type="hidden" value="${dto.num}">삭제</td>
						</tr>
						
						</c:forEach>
					</tbody>
				</table>
				</div>
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="condition" value="${condition}">
				<input type="hidden" name="keyword" value="${keyword}">
			</form>
			<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="board-list-footer d-flex justify-content-between" style="margin-top: 30px;">
				<button class="btnDelete btn btn-light" style="float: left; width: 70px; border-radius: 8px; border: 0.5px solid #A3A6AD; color: #A3A6AD;">
					삭제
				</button>
				<form class="d-flex justify-content-between" name="searchForm"
					class="d-flex justify-content-between"
					action="${pageContext.request.contextPath}/note/${menuItem}/list"
					method="post">
					<div>
						<select name="condition" class="form-select" id="sel-condition">
							<option value="content"
								${condition=="content"?"selected='selected'":""}>내용</option>
							<c:choose>
								<c:when test="${menuItem=='receive'}">
									<option value="senderName"
										${condition=="senderName"?"selected='selected'":""}>보낸사람</option>
									<option value="senderId"
										${condition=="senderName"?"selected='selected'":""}>아이디</option>
									<option value="sendDay"
										${condition=="sendDay"?"selected='selected'":""}>받은날짜</option>
								</c:when>
								<c:otherwise>
									<option value="receiverName"
										${condition=="receiverName"?"selected='selected'":""}>받는사람</option>
									<option value="receiverId"
										${condition=="receiverId"?"selected='selected'":""}>아이디</option>
									<option value="sendDay"
										${condition=="sendDay"?"selected='selected'":""}>보낸날짜</option>
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
				<div style="width: 70px;">
				</div>
			</div>
		</div>
	</div>
</div>

<img id="message-img" src="${pageContext.request.contextPath}/resources/images/note_2.png">

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="display: none">
  쪽지2
</button>

<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">쪽지 보내기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form name="noteForm" method="post">
					<table class="table write-form table-borderless">
						<tr style="border-top: 0px;">
							<td class="table-light" scope="row"
								style="width: 100px; background: white; text-align: left;"><input
								type='hidden' name='receivers' value='yellow'>
								받는 사람 : 김노랑
							</td>
						</tr>
						<tr>
							<td colspan="2" style="padding: 0px">
								<textarea name="content" id="content" class="form-control"></textarea>
							</td>
						</tr>
					</table>
					<input type='hidden' name='receiverName' value='김노랑'>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="sendOk();">보내기</button>
			</div>
		</div>
	</div>
</div>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
	<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="height: 100px;">
		<div class="toast-header">
			<img src="${pageContext.request.contextPath}/resources/images/alarm_pp.png" class="rounded me-2" style="width: 20px;"> <strong
				class="me-auto">쪽지보내기</strong> <small>방금</small>
			<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body">${receiverName}님에게 쪽지를 보냈습니다.</div>
	</div>
</div>

<script type="text/javascript">

$(function(){
	let bool = "${sended}";
	const toastLiveExample = document.getElementById('liveToast')
	if(bool === "true") {
		const toast = new bootstrap.Toast(toastLiveExample)
		toast.show()
	}
});

function sendOk() {
	const f = document.noteForm;
	let str;

	if($("input[name=receivers]").length === 0) {
		alert("받는 사람을 추가하세요. ");
		return;
	}

	str = f.content.value.trim();
	if(!str) {
		alert("내용을 입력하세요. ");
		f.content.focus();
		return;
	}

	f.action="${pageContext.request.contextPath}/note/write";
	f.submit();
}
</script>

