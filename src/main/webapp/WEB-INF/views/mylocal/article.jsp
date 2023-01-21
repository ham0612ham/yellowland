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

.body-title {
  font-size:20px;
  font-weight : bold;
  padding: 13px 0;
  
  }
  
 .category-title {
  font-size: 15px;
  color: ##BDBDBD; }
  
.localCommTitle {
	color:#36C88A; 
	font-weight: bold; 
}  

.subjectTitle {
	font-weight: bold; 
}
  
.articleWriterCircle {display: inline; color: #36C88A;}
  
.btn-outline-secondary {
	    --bs-btn-hover-bg: #18bd77;
	    --bs-btn-active-bg: #18bd77;
	    --bs-btn-active-border-color: #18bd77;
}  
  
</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId}">
function deleteOk(num) {
    if(confirm("글을 삭제 하시겠습니까 ? ")) {
    	let query = "num="+num+"&page=${page}";
	    let url = "${pageContext.request.contextPath}/mylocal/delete?" + query;
    	location.href = url;
    }
}
</c:if>
</script>

<script type="text/javascript">
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
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}


// 페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	let url = "${pageContext.request.contextPath}/mylocal/listReply";
	let query = "num=${dto.num}&pageNo="+page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
		
		$(".articleWriterCircle").each(function(){
			if($(this).attr("data-userId") == "${dto.userId}") {
				$(this).css("color", "#36C88A");
			}
		});
	};
	ajaxFun(url, "get", query, "html", fn);
}


$(function(){
	$(".btnSendReply").click(function(){
		let num = "${dto.num}";
		const $tb = $(this).closest("table");

		let content = $tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/mylocal/insertReply";
		let query = "num="+num+"&content="+content;
		
		const fn = function(data){
			$tb.find("textarea").val("");
			
			let state = data.state;
			if(state === "true") {
				listPage(1);
			} else if(state === "false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

//댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let page = $(this).attr("data-pageNo");
		
		let url = "${pageContext.request.contextPath}/mylocal/deleteReply";
		let query = "replyNum=" + replyNum + "&mode=reply";
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});



// 게시글 공감 여부
$(function(){
	$(".btnSendLocalLike").click(function(){
		if(!'${sessionScope.member.userId}') {
			alert("공감은 회원만 가능합니다.");
			return false;			
		}
		
		let color = "";
		const $i = $(this).find("i");
		let like = $i.hasClass("bi-heart-fill");
		
		let url = "${pageContext.request.contextPath}/mylocal/insertMylocalLike";
		let num = "${dto.num}";
		let query = "num=" + num + "&like=" + like;
		
		const fn = function(data){
			let state = data.state;
			if(state === "true") {
				if( like ) {
					$i.removeClass("bi-heart-fill").addClass("bi-heart");
					color = "#A3A6AD";
				} else {
					$i.removeClass("bi-heart").addClass("bi-heart-fill");
					color = "#FF4F99";
				}
				$i.css("color", color);
				let count = data.localCommLikeCount;
				$("#localCommLikeCount").text(count);
			} else if(state === "liked") {
				alert("좋아요는 한 번만 가능합니다");
			} else if(state === "false") {
				alert("공감 여부 처리가 실패했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

// 이름 마스킹 처리
let maskingFunc = {
	checkNull : function (str){
		if(typeof str == "undefined" || str == null || str == ""){
			return true;
		}
		else{
			return false;
		}
	},
	/*
	※ 이름 마스킹
	ex1) 원본 데이터 : 갓댐희, 변경 데이터 : 갓댐*
	ex2) 원본 데이터 : 하늘에수, 변경 데이터 : 하늘**
	ex3) 원본 데이터 : 갓댐, 변경 데이터 : 갓*
	*/
	name : function(userName){
		let originStr = userName;
		let maskingStr;
		let strLength;
		
		if(this.checkNull(originStr) == true){
			return originStr;
		}
		
		strLength = originStr.length;
		
		if(strLength < 3){
			maskingStr = originStr.replace(/(?<=.{1})./gi, "*");
		}else {
			maskingStr = originStr.replace(/(?<=.{2})./gi, "*");
		}
		
		return maskingStr;
	}
}


</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3 class="localCommTitle"> 지역별 게시판 </h3>
		</div>
		
		<div class="category-title">
		  ${dto.siguName} >  ${dto.dongName} </div>
		<div class="body-main">
 			<hr style="border: 0; height: 2px; background: black; margin-bottom: 0px;">
			<table class="table mb-0">
				<thead>
					<tr>
						<td class="subjectTitle" colspan="2" align="center">
						 ${dto.subject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							<h4 class="articleWriterCircle">●&nbsp;</h4>${dto.userName}
						</td>
						<td colspan="2" width="50%" style="text-align: right;">
						    <p style="display: inline; color: #696969; ">작성일자 </p><p style="display: inline; font-weight: 500;">${dto.regDate}</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style="display: inline; color: #696969;">조회</p> <p style="display: inline; font-weight: 500;">${dto.hitCount}</p>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200" style="min-height: 500px; overflow-wrap: anywhere; border-bottom: none;">
							${dto.content}
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center p-3">
							 <button type="button" class="btn btnSendLocalLike" title="좋아요" style="border-color: #A3A6AD">
							 	<i class="bi ${userMylocalLiked ? 'bi-heart-fill':'bi-heart' }" style="color: ${userMylocalLiked ? '#FF4F99':'#A3A6AD' }"></i>&nbsp;
							 	<span id="localCommLikeCount" style="color: #A3A6AD">${likeCount}</span>
							 </button>
						</td>
					<tr>
						<td colspan="2" >
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/mylocal/article?${query}&num=${preReadDto.num}" style="text-decoration: none; color:black;">${preReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-decoration: none;">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/mylocal/article?${query}&num=${nextReadDto.num}" style="text-decoration: none; color:black;">${nextReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-borderless">
				<tr>
					<td width="50%">
						
						<c:choose>
							<c:when test="${sessionScope.member.userId==dto.userId}">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/mylocal/update?num=${dto.num}&page=${page}';">수정</button>
							</c:when>
						</c:choose>
	
						<c:choose>
				    		<c:when test="${sessionScope.member.userId==dto.userId}">
				    			<button type="button" class="btn btn-light" onclick="deleteOk(${dto.num});">삭제</button>
				    		</c:when>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/mylocal/list?${query}';">목록</button>
					</td>
				</tr>
			</table>
			
			<!-- 댓글 -->
			<div class="reply">
				<form name="replyForm" method="post">
					<div id="listReply"></div>
					
					<table class="table table-borderless reply-form">
						<tr>
							<td>
								<textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn btn-primary btnSendReply'>댓글 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
				
			</div>
		</div>
	</div>
</div>




