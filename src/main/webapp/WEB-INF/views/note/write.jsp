<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
#this-title { font-size: 30px; font-weight: 600; color: #36C88A; }
.body-container {
	max-width: 800px;
	margin: auto;
}

.dialog-receiver-list { height: 200px; overflow-y: scroll; }
.dialog-receiver-list ul, .dialog-receiver-list li { list-style: none; padding: 0; }
.btnReceiverDialog { width: 70px; }
.receiver-user { color: #6c757d; margin-right: 3px; cursor: pointer; min-width: 70px; }
td, table, tr { border: 0px; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">

function sendOk() {
	const f = document.noteForm;
	let str;

	if($("#forms-receiver-list input[name=receivers]").length === 0) {
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

<script type="text/javascript">
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
	$(".btnReceiverDialog").click(function(){
		$("#condition").val("userName");
		$("#keyword").val("");
		$(".dialog-receiver-list ul").empty();
		
		$("#myDialogModal").modal("show");
	});
	
	// 대화상자 - 받는사람 검색 버튼
	$(".btnReceiverFind").click(function(){
		let condition = $("#condition").val();
		let keyword = $("#keyword").val();
		if(! keyword) {
			$("#keyword").focus();
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/note/listFriend"; 
		let query = "condition="+condition+"&keyword="+encodeURIComponent(keyword);
		
		const fn = function(data){
			$(".dialog-receiver-list ul").empty();
			searchListFriend(data);
		};
		ajaxFun(url, "get", query, "json", fn);
	});
	
	function searchListFriend(data) {
		let s;
		for(let i=0; i<data.listFriend.length; i++) {
			let userId = data.listFriend[i].userId;
			let userName = data.listFriend[i].userName;
			
			s = "<li><input type='checkbox' class='form-check-input' data-userId='"+userId+"' title='"+userId+"'> <span>"+userName+"</span></li>";
			$(".dialog-receiver-list ul").append(s);
		}
	}
	
	// 대화상자-받는 사람 추가 버튼
	$(".btnAdd").click(function(){
		let len1 = $(".dialog-receiver-list ul input[type=checkbox]:checked").length;
		let len2 = $("#forms-receiver-list input[name=receivers]").length;
		
		if(len1 === 0) {
			alert("추가할 사람을 먼저 선택하세요.");
			return false;			
		}
		
		if(len1 + len2 >= 5) {
			alert("받는사람은 최대 5명까지만 가능합니다.");
			return false;
		}
		
		var b, userId, userName, s;

		b = false;
		$(".dialog-receiver-list ul input[type=checkbox]:checked").each(function(){
			userId = $(this).attr("data-userId");
			userName = $(this).next("span").text();
			
			$("#forms-receiver-list input[name=receivers]").each(function(){
				if($(this).val() === userId) {
					b = true;
					return false;
				}
			});
			
			if(! b) {
				s = "<span class='receiver-user btn border px-1' data-userId='"+userId+"'>"+userName+"</span>";
				$(".forms-receiver-name").append(s);
				
				s = "<input type='hidden' name='receivers' value='"+userId+"'>";
				$("#forms-receiver-list").append(s);
			}
		});
		
		$("#myDialogModal").modal("hide");
	});
	
	$(".btnClose").click(function(){
		$("#myDialogModal").modal("hide");
	});
	
	$("body").on("click", ".receiver-user", function(){
		let userId = $(this).attr("data-userId");
		
		$(this).parent().remove();
		$("#forms-receiver-list input[name=receivers]").each(function(){
			let receiver = $(this).val();
			if(userId === receiver) {
				$(this).remove();
				return false;
			}
		});
		
	});

});
</script>


<div class="container">
	<div class="body-container">	
		<div class="body-title" style="margin-bottom: 12px;">
			<div id="this-title">쪽지 보내기</div>
		</div>
		
		<div class="body-main">
			
			<div class="tab-content pt-2" id="nav-tabContent">
				<div class="tab-pane fade show active mt-3" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
				
					<form name="noteForm" method="post">
						<table class="table mt-5 write-form">
							<tr>
								<td class="table-light col-sm-2" scope="row">받는사람</td>
								<td>
									<div class="row">
										<div class="col-auto pe-0">
											<button type="button" class="btn btn-primary btnReceiverDialog">추가</button>
										</div>
										<div class="col">
											<div class="forms-receiver-name"></div>
										</div>
									</div>
								</td>
							</tr>
		        
							<tr>
								<td colspan="2">
									<textarea name="content" id="content" class="form-control">${dto.content}</textarea>
								</td>
							</tr>
							
						</table>
						
						<small class="form-control-plaintext">한번에 보낼수 있는 최대 인원은 5명입니다.</small>
						<table class="table table-borderless">
		 					<tr>
								<td class="text-center">
									<button type="button" class="btn btn-dark" onclick="sendOk();">보내기&nbsp;<i class="bi bi-check2"></i></button>
									<button type="reset" class="btn btn-light">다시입력</button>
									<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/note/send/list';">취소&nbsp;<i class="bi bi-x"></i></button>
									<div id="forms-receiver-list"></div>
								</td>
							</tr>
						</table>
					</form>
				
				</div>
			</div>		
		
		</div>
	</div>
</div>

<div class="modal fade" id="myDialogModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">받는 사람</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-auto p-1">
						<select name="condition" id="condition" class="form-select">
							<option value="userName">이름</option>
							<option value="userId">아이디</option>
						</select>
					</div>
					<div class="col-auto p-1">
						<input type="text" name="keyword" id="keyword" class="form-control">
					</div>
					<div class="col-auto p-1">
						<button type="button" class="btn btn-light btnReceiverFind"> <i class="bi bi-search"></i> </button>
					</div>				
				</div>
				<div class="row p-1">
					<div class="border p-1 dialog-receiver-list">
						<ul></ul>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnAdd">추가</button>
				<button type="button" class="btn btn-secondary btnClose">닫기</button>
			</div>			
		</div>
	</div>
</div>