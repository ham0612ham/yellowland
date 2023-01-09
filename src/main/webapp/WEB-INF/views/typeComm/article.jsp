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
    if(confirm("글을 삭제 하시 겠습니까 ? ")) {
    	let query = "num="+num+"&page=${page}";
	    let url = "${pageContext.request.contextPath}/localComm/delete?" + query;
    	location.href = url;
    }
}
</c:if>

// 페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	let url = "${pageContext.request.contextPath}/localComm/listReply.do";
	let query = "num=${dto.num}&pageNo="+page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 댓글 등록
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
		
		let url = "${pageContext.request.contextPath}/localComm/insertReply";
		let query = "num="+num+"&content="+content + "&answer=0";
		
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

//삭제
$(function(){
	$("body").on("click", ".reply-dropdown", function(){
		const $menu = $(this).next(".reply-menu");
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$(".reply-menu").hide();
			$menu.fadeIn(100);

			let pos = $(this).offset();
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	$("body").on("click", function() {
		if($(event.target.parentNode).hasClass("reply-dropdown")) {
			return false;
		}
		$(".reply-menu").hide();
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
		
		let url = "${pageContext.request.contextPath}/localComm/deleteReply";
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
	$(".btnSendBoardLike").click(function(){
			const $i = $(this).find("i");
			let userLocalCommLiked = $i.hasClass("bi-hand-thumbs-up-fill");
			let msg = userLocalCommLiked ? "게시글 공감을 취소하시겠습니까 ? " : "게시글에 공감하십니까 ? ";
			
			if(! confirm( msg )) {
				return false;
			}
			
			let url = "${pageContext.request.contextPath}/localComm/insertLocalCommLike";
			let num = "${dto.num}";
			let query = "num="+num+"&userLocalCommLiked="+userLocalCommLiked;
			
			const fn = function(data){
				let state = data.state;
				if(state === "true") {
					if( userLiked ) {
						$i.removeClass("bi-hand-thumbs-up-fill").addClass("bi-hand-thumbs-up");
					} else {
						$i.removeClass("bi-hand-thumbs-up").addClass("bi-hand-thumbs-up-fill");
					}
					
					var count = data.localCommLikeCount;
					$("#localCommLikeCount").text(count);
				} else if(state === "liked") {
					alert("게시글 공감은 한번만 가능합니다. !!!");
				} else if(state === "false") {
					alert("게시물 공감 여부 처리가 실패했습니다. !!!");
				}
			};
			
			ajaxFun(url, "post", query, "json", fn);
		});
});
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3 class="localCommTitle"> 지역별 게시판 </h3>
		</div>
		
		<div class="category-title">
		  ${dto.siguName}시구이름 >  ${dto.dongName}동이름 </div>
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
						<td colspan="2" valign="top" height="200" style="min-height: 500px; overflow-wrap: anywhere;">
							${dto.content}
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center p-3">
							 <button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요">&nbsp;<i class="bi bi-heart"> </i>&nbsp;<span id="localCommLikeCount">${dto.localCommLikeCount}</span></button>
							</td>
						</tr>
					<tr>
						<td colspan="2" >
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/localComm/article?${query}&num=${preReadDto.num}" style="text-decoration: none; color:black;">${preReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-decoration: none;">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/localComm/article?${query}&num=${nextReadDto.num}" style="text-decoration: none; color:black;">${nextReadDto.subject}</a>
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
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/localComm/update?num=${dto.num}&page=${page}&size=${size}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
				    			<button type="button" class="btn btn-light" onclick="deleteOk(${dto.num});">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/localComm/list?${query}';">목록</button>
					</td>
				</tr>
			</table>
			
			<!-- 댓글 -->
			<div class="reply">
				<form name="replyForm" method="post">
					<div class='form-header'>
						<span class="bold">댓글&nbsp;${dto.replyCount}개</span>
					</div>
					
					<div id="listReply"></div>
					
					<table class="table table-borderless reply-form">
						<tr>
							<td>
								<textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn btn-light btnSendReply'>답글 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
				
			</div>
		</div>
	</div>
</div>




