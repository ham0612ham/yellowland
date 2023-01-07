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
	height:400px;
}

.ck-rounded-corners .ck.ck-editor__main>.ck-editor__editable, .ck.ck-editor__main>.ck-editor__editable.ck-rounded-corners {
	height:400px;
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
input[type=radio]:checked+label { background: #36C88A; color: white; border: 0.5px solid #36C88A; }
input[type=radio]:checked+label:hover { background: #18BD77; color: white; border: 0.5px solid #18BD77; }
input[type=radio]:hover+label { color: #36C88A; border: 0.5px solid #36C88A; }
label:hover { color: #18BD77; cursor: pointer; }
input[type=radio]+label { background: white; color: #A3A6AD; border: 0.5px solid #A3A6AD; }
.up-btn { padding: 8px 30px; }
.fw-semibold { height: 50px;  }
.row { height: 200px; width: 180px;}
.table1 {float: left; width: 300px;text-align: left;}
.table2 {width: 700px; text-align: left;}

.col {margin-left: 5px; font-weight: bold; color: #C2C2C2; font-size: 18px;}
.colNoticeTitle {font-weight: bold; color: #36C88A; font-size: 18px; margin-left: 5px; }
.title1 {font-weight: bold; color: #36C88A; font-size: 31px; margin: 0px; }

.text-decoration-none {color: #C2C2C2;} 

.division {margin-top: 20px; margin-bottom: 10px;}
.container.text-center {margin-top: 0px; margin-left: 40px; margin-right: 100px;}

.accordion-button {background-color: #36C88A; color: white;} 
.collapseOne {background-color: #36C88A;}

.pagination {margin-top: 30px;}
#keyword-input { height: 38.2px; width: 200px; margin-left: 6px; border-radius: 8px; border: 0.5px solid #A3A6AD; }
#sel-condition { width: 150px; color: #000; 
	border: 0.5px solid #A3A6AD; font-size: 14px; 
	border-radius: 8px; height: 38.2px; width: 150px;
}
.search-btn { height: 38.2px; margin-left: 5px; border-radius: 8px; width: 70px; }

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">
function sendOk() {
	const f = document.noticeForm;
	let str;
	
	str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요!");
        f.subject.focus();
        return;
    }

	str = window.editor.getData().trim();
    if(! str==null) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
	f.content.value = str;

    f.action = "${pageContext.request.contextPath}/admin/noticeManage/${mode}";
    f.submit();
}
<c:if test="${mode=='update'}">
function deleteFile(fileNum) {
	let url = "${pageContext.request.contextPath}/admin/noticeManage/deleteFile";
	$.post(url, {fileNum:fileNum}, function(data){
		$("#f"+fileNum).remove();
	}, "json");
}
</c:if>
</script>


<div class="container">
	<div class="body-container">	
		<h3 class="fw-semibold" style="color: #36C88A;">공지사항관리</h3>
		<br>

		<form name="noticeForm" method="post" enctype="multipart/form-data">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col"><input name="subject" type="text" class="form-control" value="${dto.subject}"></th>
					</tr>
				</thead>
				
					<tr>
						<th scope="row">작성자</th>
						<td>${sessionScope.member.userName}</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
							<td>	
								<div style="margin-top: 10px; width: 700px; " class="form-control" >
									<div class="editor">${dto.content}</div>
									<input type="hidden" name="content">
								</div>
							</td>	
					</tr>
					  <tr>
                  <td class="table-light col-sm-2">첨 부</td>
                  <td> 
                     <input type="file" name="selectFile" multiple="multiple" class="form-control">
                  </td>
               </tr>
               
               <c:if test="${mode=='update'}">
                  <c:forEach var="vo" items="${listFile}">
                     <tr id="f${vo.fileNum}">
                        <td class="table-light col-sm-2" scope="row">첨부된파일</td>
                        <td> 
                           <p class="form-control-plaintext">
                              <a href="javascript:deleteFile('${vo.fileNum}');"><i class="bi bi-trash"></i></a>
                              ${vo.oriFilename}
                           </p>
                        </td>
                     </tr>
                  </c:forEach> 
               </c:if>
				
			</table>
				
		



		<table class="table table-borderless">
			<tr>
				<td class="text-center">
					<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button> 
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



