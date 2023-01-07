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
.title-input { font-size: 14px; }
#this-title { font-size: 30px; font-weight: 600; color: #36C88A; }
.center-text { text-align: center;  }
.ck.ck-editor {
	max-width: 97%;
}
.ck-editor__editable {
    min-height: 250px;
}
.ck-content .image>figcaption {
	min-height: 25px;
}
.img-add:hover { cursor: pointer }
.write-form .img-viewer {
	cursor: pointer; border: 1px solid #ccc;
	width: 45px; height: 45px; border-radius: 45px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative; z-index: 9999; background-repeat : no-repeat;
	background-size : cover;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">
function sendOk() {
    const f = document.eventForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
	f.content.value = str;
    
    let mode = "${mode}";
    if( (mode === "write") && (!f.selectFile.value) ) {
        alert("이미지 파일을 추가 하세요. ");
        f.selectFile.focus();
        return;
	}

    f.action = "${pageContext.request.contextPath}/event/${mode}";
    f.submit();
}

$(function() {
	let img = "${dto.imageFilename}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/photo/" + img;
		$(".write-form .img-viewer").empty();
		$(".write-form .img-viewer").css("background-image", "url("+img+")");
	}
	
	$(".write-form .img-viewer").click(function(){
		$("form[name=eventForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=eventForm] input[name=selectFile]").change(function(){
		let file = this.files[0];
		if(! file) {
			$(".write-form .img-viewer").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/photo/" + img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".write-form .img-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			$(".write-form .img-viewer").empty();
			$(".write-form .img-viewer").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});
</script>

<div class="container">
	<div class="body-container">	
		<div id="this-title">이벤트</div>
		
		<div class="body-main">
			<form name="eventForm" method="post" enctype="multipart/form-data">
				<table class="table write-form table-form">
					<tr>
						<td class="table-light col-sm-2 center-text align-middle" scope="row">제목</td>
						<td>
							<input type="text" name="subject" class="form-control title-input" value="${dto.subject}">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2 center-text align-middle" scope="row">이미지</td>
						<td>
							<div class="img-viewer"></div>
							<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2 center-text align-middle" scope="row">내용</td>
						<td>
							<div class="editor">${dto.content}</div>
							<input type="hidden" name="content">
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-primary" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/sbbs/list';">${mode=='update'?'수정취소':'등록취소'}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="userId" value="admin">
								<input type="hidden" name="imageFilename" value="${dto.imageFilename}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>


<script>
	ClassicEditor.create( document.querySelector( '.editor' ), {
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
	
			 styles: [
			     'full',
			     'side'
			 ]
		},
			language: 'ko',
			ckfinder: {
		 	uploadUrl: '${pageContext.request.contextPath}/image/upload'
			}
		}).then( editor => {
			window.editor = editor;
		}).catch( err => {
			console.error( err.stack );
	});
</script>

