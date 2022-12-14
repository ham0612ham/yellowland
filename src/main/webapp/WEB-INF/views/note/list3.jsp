<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 900px;
	min-height: 900px;
	margin: auto;
	margin-top: 100px;
}
#this-title { font-size: 30px; font-weight: 600; color: #36C88A; }
input[type=checkbox], input[type=radio] { display: none; }
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
.date-td { font-size: 14px; margin-top: 10px; }
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
			alert("????????? ????????? ?????? ?????? ????????? !!!");
			return;
		}
         
		if(confirm("????????? ????????? ?????? ?????? ???????????? ? ")) {
			const f = document.listForm;
			f.action = "${pageContext.request.contextPath}/note/${menuItem}/delete";
			f.submit();
		}
	});
});
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title" style="margin-bottom: 12px;">
			<div id="this-title">?????????</div>
		</div>
		
		<div class="body-main">
			<div class="d-flex justify-content-between">
				<div class="d-flex justify-content-start">
					<input id="receiveNotes" type="radio" name="selectOne">
					<label for="receiveNotes" class="up-btn" style="margin-right: 7px;" onclick="javascript:location.href='${pageContext.request.contextPath}/note/receive/list';"><span>?????? ?????????</span></label>
					<input id="sendNotes" type="radio" name="selectOne">
					<label for="sendNotes" class="up-btn" onclick="javascript:location.href='${pageContext.request.contextPath}/note/send/list';"><span>?????? ?????????</span></label>
				</div>
				<div>
					<input id="sendNote" type="radio" name="selectOnlyOne" checked>
					<label for="sendNote" class="up-btn" onclick="javascript:location.href='${pageContext.request.contextPath}/note/write';"><span>?????? ?????????</span></label>
				</div>
			</div>
			<hr style="margin-bottom: 0px;">
			<form name="listForm" method="post">
				<table class="table note-table">
					<thead>
						<tr>
							<th scope="col" style="width: 8%">??????</th>
							<th scope="col" style="width: 450px;">??????</th>
							<th scope="col" style="width: 10%">${menuItem=="receive"?"????????????":"????????????"}</th>
							<th scope="col" style="width: 12%">${menuItem=="receive"?"????????????":"????????????"}</th>
							<th scope="col" style="width: 12%">?????? ??????</th>
							<th scope="col" style="width: 8%">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
						<tr>
							<td class="pd" style="padding: 10px 0;"><input type="checkbox" name="nums" class="form-check-input">
								12
							</td>
							<td class="ellipsis pd content-td" style="text-align: start; padding: 10px 0;">
								<span>
									<a href="#" class="text-reset">??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.??????????????? ?????? ??????????????? ??????????????????.</a>
								</span>
							</td>
							<td class="pd" style="padding: 10px 0;">?????????</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							<td class="pd cancel" style="color:#4F4F4F padding: 10px 0;">??????</td>
						</tr>
						
					</tbody>
				</table>
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="condition" value="${page}">
				<input type="hidden" name="keyword" value="${page}">
			</form>

			<div class="page-navigation">${dataCount == 0 ? "????????? ???????????? ????????????." : paging}
			</div>

			<div class="board-list-footer d-flex justify-content-between" style="margin-top: 30px;">
				<button class="btnDelete btn btn-light" style="float: left; width: 70px; border-radius: 8px; border: 0.5px solid #A3A6AD; color: #A3A6AD;">
					??????
				</button>
				<form class="d-flex justify-content-between" name="searchForm"
					class="d-flex justify-content-between"
					action="${pageContext.request.contextPath}/note/${menuItem}/list"
					method="post">
					<div>
						<select name="condition" class="form-select" id="sel-condition">
							<option value="content"
								${condition=="content"?"selected='selected'":""}>??????</option>
							<c:choose>
								<c:when test="${menuItem=='receive'}">
									<option value="senderName"
										${condition=="senderName"?"selected='selected'":""}>????????????</option>
									<option value="senderId"
										${condition=="senderName"?"selected='selected'":""}>?????????</option>
									<option value="sendDay"
										${condition=="sendDay"?"selected='selected'":""}>????????????</option>
								</c:when>
								<c:otherwise>
									<option value="receiverName"
										${condition=="receiverName"?"selected='selected'":""}>????????????</option>
									<option value="receiverId"
										${condition=="receiverId"?"selected='selected'":""}>?????????</option>
									<option value="sendDay"
										${condition=="sendDay"?"selected='selected'":""}>????????????</option>
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
							??????
						</div>
					</div>
				</form>
				<div style="width: 70px;">&nbsp;</div>
			</div>

		</div>
	</div>
</div>