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

.typeCkeck {
 	
}

.
element.style {
    width: 80px;
}
.form-select {
	border-radius: 0px;
	border: 2px;
}


</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">

function sendOk() {
	const f = doctment.localCommForm;
	let str;
	
	str = f.subject.valye.trim();
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
	
	f.action = "${pageContext.request.contextPath}/qna/${mode}";
	f.submit();
	
}

</script>


<div class="container">
	<div class="body-container">	
		<h3 class="fw-semibold">업종별 커뮤니티 글 작성</h3>
		<hr>

		<form name="localCommForm">	
			<table class="table">
				<thead>
					<tr>
						<th scope="col" class="typeCkeck">업종 선택</th>
						<th scope="col" class="typeCkeck">
							<div class="col-auto p-1" style="flex:1; float: left;">
								<select name="siguNum" class="form-select" style="width: 80px;">
									<option value="all" ${condition=="all"?"selected='selected'":""}>시군구</option>
									<option value="content1" ${condition=="subject"?"selected='selected'":""}>시군구1</option>
									<option value="content2" ${condition=="content"?"selected='selected'":""}>시군구2</option>
								</select>
							</div>
							<div class="col-auto p-1" style="flex:1; float: left;">
								<select name="dongNum" class="form-select" style="width: 80px;">
									<option value="all" ${condition=="all"?"selected='selected'":""}>행정동</option>
									<option value="content1" ${condition=="subject"?"selected='selected'":""}>행정동1</option>
									<option value="content2" ${condition=="content"?"selected='selected'":""}>행정동2</option>
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
						<th scope="row" >글 내용</th>
						<td>
							<div class="editor">${dto.content}</div>
							<input type="hidden" name="content">
						</td>
					</tr>
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
								onclick="location.href='${pageContext.request.contextPath}/qna/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
									class="bi bi-x"></i>
						</button>
							
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
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
