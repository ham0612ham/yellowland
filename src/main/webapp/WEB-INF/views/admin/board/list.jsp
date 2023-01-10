<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
	min-height: 500px;
	margin: auto;
	margin-top: 100px;
}

input[type=radio]:checked+label { background: #36C88A; color: white; border: 0.5px solid #36C88A; }
input[type=radio]:checked+label:hover { background: #18BD77; color: white; border: 0.5px solid #18BD77; }
input[type=radio]:hover+label { color: #36C88A; border: 0.5px solid #36C88A; }
label:hover { color: #18BD77; cursor: pointer; }
input[type=radio]+label { background: white; color: #A3A6AD; border: 0.5px solid #A3A6AD; }
.up-btn { padding: 8px 30px; }
.fw-semibold { height: 50px; width: 150px; }
.row { height: 200px; width: 180px;}
.table1 {float: left; width: 300px;  text-align: left;}
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
<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchList() {
	const f = document.searchForm;
	f.enabled.value=$("#selectEnabled").val();
	f.action = "${pageContext.request.contextPath}/admin/memberManage/list";
	f.submit();
}
	
function detailedMember(userId) {
	let dlg = $("#member-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 삭제 " : function() {
		    	   deleteOk(userId);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 550,
		  width: 800,
		  title: "회원상세정보",
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/admin/memberManage/detaile";
	let query = "userId="+userId;
	
	const fn = function(data){
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}
	
function updateOk() {
	const f = document.deteailedMemberForm;
	
	if(! f.stateCode.value) {
		f.stateCode.focus();
		return;
	}
	if(! $.trim(f.memo.value)) {
		f.memo.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateMemberState";
	let query=$("#deteailedMemberForm").serialize();

	const fn = function(data){
		$("form input[name=page]").val("${page}");
		searchList();
	};
	ajaxFun(url, "post", query, "json", fn);
		
	$('#member-dialog').dialog("close");
}

function deleteOk(userId) {
	if(confirm("선택한 계정을 삭제 하시겠습니까 ?")) {

	}
	
	$('#member-dialog').dialog("close");
}

function memberStateDetaileView() {
	$('#memberStateDetaile').dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '계정상태 상세',
		  close: function(event, ui) {
			   $(this).dialog("destroy"); // 이전 대화상자가 남아 있으므로 필요
		  }
	  });	
}

function selectStateChange() {
	const f = document.deteailedMemberForm;
	
	let s = f.stateCode.value;
	let txt = f.stateCode.options[f.stateCode.selectedIndex].text;
	
	f.memo.value = "";	
	if(! s) {
		return;
	}

	if(s!=="0" && s!=="6") {
		f.memo.value = txt;
	}
	
	f.memo.focus();
}
</script>
<div class="container">
	<div class="table1">
		<h3 class="fw-semibold">관리자메뉴</h3>
		<div class="row row-cols-auto">
		
			<div class="col"><a href="${pageContext.request.contextPath}/admin/noticeManage/list" class="text-decoration-none" style="color:#C2C2C2">공지사항 관리</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/admin/faqManage/list" class="text-decoration-none" style="color:#C2C2C2">자주하는질문 관리</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/admin/qnaManage/list" class="text-decoration-none" style="color:#C2C2C2">1:1문의 관리</a></div>
			<div class="colNoticeTitle">
				<div>게시글 관리</div>
			</div>
			<div class="col"><a href="${pageContext.request.contextPath}/admin/eventManage/list" class="text-decoration-none" style="color:#C2C2C2">이벤트 관리</a></div>
			<div class="col"><a href="${pageContext.request.contextPath}/admin/memberManage/list" class="text-decoration-none" style="color:#C2C2C2">회원 관리</a></div>
			
		</div>
	</div>
	<div class="body-container">
		<div class="table2">
			<h3 class="title1">게시글 관리</h3>
			<div class="body-main">
    	
	<div class="container text-center">
		
		
			<table class="table" style='margin-bottom: 0px;'>
				<tr>
					<td align="left" width="50%">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">
						<select id="selectEnabled" class="form-select" onchange="searchList();">
							<option value="" ${enabled=="" ? "selected='selected'":""}>::카테고리::</option>
							<option value="0" ${enabled=="0" ? "selected='selected'":""}>업종관련</option>
							<option value="1" ${enabled=="1" ? "selected='selected'":""}>지역관련</option>
						</select>
					</td>
				</tr>
			</table>
			
		<form name="listForm" method="post">		
			<table class="table note-table">
				<thead>
					<tr> 
						<th class="wx-60">번호</th>	
						<th class="wx-120">카테고리</th>					
						<th class="wx-120">제목</th>
						<th class="wx-120">작성일</th>
						
					</tr>
					<tr>
							<td class="pd" style="padding: 10px 0;">
								12
							</td>
							<td class="pd" style="padding: 10px 0;">
								지역관련
							</td>
							
							<td class="pd" style="padding: 10px 0;">김하나</td>
							<td class="pd" style="color:#4F4F4F padding: 10px 0; padding-top: 13px;">2022-12-12</td>
							
							
						</tr>
						
						
				</thead>
				
				<tbody>
				
				</tbody>
			</table>
		</form>		 
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			<div class="board-list-footer d-flex justify-content-between" style="margin-top: 30px;">
				<button class="btnDelete btn btn-light" style="float: left; width: 90px; border-radius: 8px; border: 0.5px solid #A3A6AD; color: #A3A6AD;" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/list';">
					새로고침
				</button>
				<form class="d-flex justify-content-between" name="searchForm"
					class="d-flex justify-content-between"
					action="${pageContext.request.contextPath}/admin/memberManage/list" method="post">
					<div>
						<select name="condition" class="form-select" id="sel-condition">
							<option value="subject"
								${condition=="subject" ? "selected='selected'":""}>제목</option>
							<c:choose>
								<c:when test="${menuItem=='receive'}">
									<option value="date"   ${condition=="date" ? "selected='selected'":""}>작성일</option>
									<option value="category"   ${condition=="category" ? "selected='selected'":""}>카테고리</option>
									
								</c:when>
								<c:otherwise>
									<option value="date"   ${condition=="date" ? "selected='selected'":""}>작성일</option>
									<option value="category"   ${condition=="category" ? "selected='selected'":""}>카테고리</option>
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
				<div style="width:30px;">&nbsp;</div>
			</div>
		
			</div>
    	
		
		</div>
	</div>

			

		</div>


	
</div>

<div id="member-dialog" style="display: none;"></div>