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

.form-select {
 border: revert;
 border-radius: 3px;
}


.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
	min-height:400px;
}

.ck-rounded-corners .ck.ck-editor__main>.ck-editor__editable, .ck.ck-editor__main>.ck-editor__editable.ck-rounded-corners {
	min-height:400px;
}

.ck.ck-editor {
	width: 600px;
}

.tr,.th {
	width: 20px;
}

.btn-dark {
    --bs-btn-color: #fff;
    --bs-btn-bg: #36c88a;
    --bs-btn-border-color: ##36c88a;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #36c88a;
    --bs-btn-hover-border-color: #36c88a;
    --bs-btn-focus-shadow-rgb: 66,70,73;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #2ca974;
    --bs-btn-active-border-color: #373b3e;
    --bs-btn-active-shadow: inset 0 3px 5pxrgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #212529;
    --bs-btn-disabled-border-color: #212529;
}


.
element.style {
    width: 80px;
}

  
div#ckEditor img { max-width: 100%; height: auto; }

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">

function sendOk() {
	const f = document.typeCommForm;
	let str;

	str = f.catejobNum.value;
	if(!str) {
		alert("업종을 선택하세요 !");
		f.catejobNum.focus();
		return;
	}
	
	str = f.jobNum.value;
	if(!str) {
		alert("세부업종을 선택하세요 !");
		f.jobNum.focus();
		return;
	}
	
	str = f.subject.value.trim();
	if(!str) {
		alert("제목을 입력하세요 !");
		f.subject.focus();
		return;
	}
	
	str = window.editor.getData().trim();
	if(! str){
		alert("내용을 입력하세요. ");
		window.editor.focus();
		return;
	}
	
	f.content.value = str; 
	
	f.action = "${pageContext.request.contextPath}/typeComm/${mode}";
	f.submit();
}

//글 수정시, 첨부파일 삭제
<c:if test="${mode=='update'}">
function deleteFile(fileNum) {
	let url = "${pageContext.request.contextPath}/typeComm/deleteFile";
	$.post(url, {fileNum:fileNum}, function(data){
		$("#f"+fileNum).remove();
	}, "json");
}
</c:if>
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
	$("form select[name=catejobNum]").change(function(){
		let catejobNum = $(this).val();
		$("form select[name=jobNum]").find('option').remove().end()
				.append("<option value=''>::세부업종 ::</option>");
		
		if(! catejobNum) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/typeComm/listJob";
		let query = "catejobNum="+catejobNum;

		const fn = function(data) {
			$.each(data.listJob, function(index, item){
				let jobNum = item.jobNum;
				let jobName = item.jobName;
				
				let ss = "${dto.jobNum}" == jobNum ? "selected = 'selected'" : ""
			
				let s = "<option value='"+jobNum+"' " + ss + ">"+jobName+"</option>";
				$("form select[name=jobNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
	});

	let mode = "${mode}"
	if(mode == "update") {
		$("form select[name=catejobNum]").trigger("change");
	}
});

// 글 수정시, 첨부파일 삭제
<c:if test="${mode=='update'}">
function deleteFile(fileNum) {
	let url = "${pageContext.request.contextPath}/typeComm/deleteFile";
	$.post(url, {fileNum:fileNum}, function(data){
		$("#f"+fileNum).remove();
	}, "json");
}
</c:if>

</script>

<div class="container">
	<div class="body-container">	
		<h3 class="fw-semibold">업종별 커뮤니티 글 작성</h3>
		<hr>

		<form name="typeCommForm" method="post" enctype="multipart/form-data">	
			<table class="table">
				<thead>
					<tr>
						<th scope="col" class="typeCkeck">업종 선택</th>
						<th scope="col" class="typeCkeck">
							<div class="col-auto p-1" style="flex:1; float: left;">
								<select name="catejobNum" class="form-select" style="width: 100px;">
									<option value="">::업종 ::</option>
									<c:forEach var="vo" items="${listCategory}">
									<option value="${vo.catejobNum}" ${vo.catejobNum==dto.catejobNum?"selected='selected'":""}>${vo.catejobName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-auto p-1" style="flex:1; float: left;">
								<select name="jobNum" class="form-select" style="width: 156px;">
									<option value="" ${condition=="all"?"selected='selected'":""}>::세부업종 ::</option>
								</select>
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">글 제목</th>
						<td>
							<input type="text" name="subject" value="${dto.subject}"
							${mode=="update" || mode=="answer" ? "readonly='readonly'":""}></td>
					</tr>
					<tr>
						<th scope="row" style="width: 300px;">작성자</th>
						<td>${sessionScope.member.userName}</td>
					</tr>
					<tr>
						<th scope="row">글 내용</th>
						<td>
							<div class="editor" id="ckEditor">${dto.content}</div> <input type="hidden"
							name="content">
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td>
							<input type="file" name="selectFile" multiple="multiple">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<c:forEach var="vo" items="${listFile}">
							<tr id="f${vo.fileNum}">
								<td class="table-light col-sm-2" scope="row">첨부된파일</td>
								<td> 
									<p class="form-control-plaintext">
										<a href="javascript:deleteFile('${vo.fileNum}');"><i class="bi bi-trash"></i></a>
										${vo.originalFilename}
									</p>
								</td>
							</tr>
						</c:forEach> 
					</c:if>
				</tbody>
			</table>
			<br>
			
			<table class="table table-borderless">
				<tr>
					<td class="text-center">
						<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i
									class="bi bi-check2"></i>
						</button>
						<button type="button" class="btn btn-light"
								onclick="location.href='${pageContext.request.contextPath}/typeComm/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
									class="bi bi-x"></i>
						</button>
							
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="page" value="${page}">
							
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

	<script>
			ClassicEditor
				.create( document.querySelector( '.editor' ), {
					fontFamily: {
			            options: [
			                'default',
			                '맑은 고딕, Malgun Gothic, 돋움, sans-serif',
			                '나눔고딕, NanumGothic, Arial'
			            ]
			        },
			        fontSize: {
			            options: [
			                9, 11, 13, 'default', 17, 19, 21
			            ]
			        },
					toolbar: {
						items: [
							'heading','|',
							'fontFamily','fontSize','bold','italic','fontColor','|',
							'alignment','bulletedList','numberedList','|',
							'imageUpload','insertTable','sourceEditing','blockQuote','mediaEmbed','|',
							'undo','redo','|',
							'link','outdent','indent','|',
						]
					},
					image: {
			            toolbar: [
			                'imageStyle:inline',
			                'imageStyle:side',
			                '|',
			                'imageTextAlternative'
			            ],
	
			            // The default value.
			            styles: [
			                'full',
			                'side'
			            ]
			        },
					language: 'ko',
					ckfinder: {
				        uploadUrl: '${pageContext.request.contextPath}/image/upload' // 업로드 url (post로 요청 감)
				    }
				})
				.then( editor => {
					window.editor = editor;
				})
				.catch( err => {
					console.error( err.stack );
				});
	</script>
