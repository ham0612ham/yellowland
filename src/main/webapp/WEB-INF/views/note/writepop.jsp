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
td, table, tr { border: 0px; margin: 0px; }
#content { width: 100%; min-height: 300px; }
.btn-bottom > button { width: 20%; margin: 0 2px; }
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
</script>


<div class="container">
	<div class="body-container">	
		<div class="body-title" style="margin-bottom: 12px;">
			<div id="this-title">쪽지 보내기</div>
		</div>

		<div class="body-main">
		
			<form name="noteForm" method="post">
				<table class="table write-form table-borderless">
					<tr style="border-top: 0.5px solid #eee;">
						<td class="table-light" scope="row" style="width: 100px; background: white;"><input type='hidden' name='receivers' value='${receiverId}'>${receiverId}</td>
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
						<td colspan="2" style="padding: 0px">
							<textarea name="content" id="content" class="form-control">${dto.content}
							</textarea>
						</td>
					</tr>
				</table>

				<table class="table table-borderless">
					<tr>
						<td class="text-center btn-bottom">
							<button type="button" class="btn btn-secondary">취소</button>
							<button type="button" class="btn btn-primary" onclick="sendOk();">보내기</button>
							<div id="forms-receiver-list"></div>
						</td>
					</tr>
				</table>
			</form>

		</div>

	</div>
</div>
