<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body {
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 14px;
	color: #222;
}

a { color: #222; text-decoration: none; cursor: pointer; }
a:active, a:hover { color: #f28011; text-decoration: underline; }

/* form-control */
.btn {
	color: #333;
	border: 1px solid #999;
	background-color: #fff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.btn:active, .btn:focus, .btn:hover {
	background-color: #f8f9fa;
	color:#333;
}
.btn[disabled], fieldset[disabled] .btn {
	pointer-events: none;
	cursor: default;
	opacity: .65;
}

.form-control {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-select[readonly] { background-color:#f8f9fa; }

.category-select { border: 1px solid #999; border-radius : 4px; background-color: #fff; padding: 4px 5px; vertical-align: baseline }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }

/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #212529; border-bottom: 1px solid #ced4da; }
.table-border tbody > tr { border-bottom: 1px solid #ced4da; }
.table-border tfoot > tr { border-bottom: 1px solid #ced4da; }
.td-border td { border: 1px solid #ced4da; }

/* board */
.board { margin: 30px auto; width: 700px; }

.title { width:100%; font-size: 16px; font-weight: 1000; padding: 13px 0; }

.table-form { margin-top: 20px; }
.table-form td { padding: 7px 0; }
.table-form tr:first-child { border-top: 2px solid #212529; margin-top:20px; }
.table-form tr > td:first-child { width: 110px; text-align: center; background: #fff; }
.table-form tr > td:nth-child(2) { 	padding-left: 10px; }
.table-form tr:last-child { border: none; }
.table-form input[type=text], .table-form input[type=file], .table-form textarea { width: 97%; }
.table-form input[type=password] { width: 50%; }

.categoryselect {}

</style>

<script type="text/javascript">
function sendOk() {
    const f = document.boardForm;

    let str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.name.value;
    if(!str) {
        alert("이름을 입력하세요. ");
        f.name.focus();
        return;
    }

    str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/community/${community.BOARDURL}/${mode}";
    f.submit();
}
</script>
</head>
<body>

<div class="board">
	<div class="title">
	    <h3> &nbsp;&nbsp;&nbsp;&nbsp; 업종별 커뮤니티 글작성</h3>
	</div>

	<form name="boardForm" method="post">
		<table class="table table-border table-form">
				<tr>
					<td>업종선택</td>
					<td>
						<select name="categoryselect" class="category-select">
							<c:forEach var="map" items="${listCategory}">
								<option value="${map.CATEGORYNUM}" ${dto.categoryNum == map.CATEGORYNUM ? "selected='selected'":"" }>${map.CATEGORY}</option>
                             <!-- dto의 카테고리와 map의 카테고리가 같으면 눈에 보이게 "selected='selected'"를 집어넣음 -->
  
							</c:forEach>
						</select>
						<select name="categoryselect" class="category-select">
							<c:forEach var="map" items="${listCategory}">
								<option value="${map.CATEGORYNUM}" ${dto.categoryNum == map.CATEGORYNUM ? "selected='selected'":"" }>${map.CATEGORY}</option>
                             <!-- dto의 카테고리와 map의 카테고리가 같으면 눈에 보이게 "selected='selected'"를 집어넣음 -->
  
							</c:forEach>
						</select>
						
					</td>
				</tr>
			
			<tr> 
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td> 
					<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
				</td>
			</tr>
			
			<tr> 
				<td>작성자</td>
				<td> 
					<input type="text" name="name" maxlength="10" class="form-control" value="${dto.name}">
				</td>
			</tr>
			
			<tr> 
				<td>글 &nbsp; 내용</td>
				<td valign="top"> 
					<textarea name="content" class="form-control">${dto.content}</textarea>
				</td>
			</tr>
			
			<tr>
				 <td class="table-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
					<td> 
					 <input type="file" name="selectFile" class="form-control">
					</td>
						</tr>
						<c:if test="${mode=='update'}">
							<tr>
								<td class="table-light col-sm-2" scope="row">첨부된파일</td>
								<td> 
									<p class="form-control-plaintext">
										<c:if test="${not empty dto.save_filename}">
											<a href="javascript:deleteFile('${dto.num}');"><i class="bi bi-trash"></i></a>
											${dto.ori_filename}
										</c:if>
										&nbsp;
									</p>
								</td>
							</tr>
						</c:if>
			
			<tr> 
				<td>비밀번호</td>
				<td>
					<input type="password" name="pwd" maxlength="8" class="form-control" value="${dto.pwd}">
				</td>
			</tr>
			
		</table>
			
		<table class="table">
			<tr> 
			 <td> 
					<button type="button" class="btn" onclick="sendOk();"> ${mode=="update"?"수정완료":"등록완료"} </button>
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/typeCommunity/list';"> ${mode=="update"?"수정취소":"등록취소"} </button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
			</tr>
		</table>

	</form>
	
</div>

</body>
</html>