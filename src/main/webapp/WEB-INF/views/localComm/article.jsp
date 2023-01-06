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
  
</style>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3> 업종별 게시판 </h3>
		</div>
		
		<div class="category-title">
		  업종 >  외식업 / 커피 음료 </div>
		<div class="body-main">
 
			<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center">
						  제목입니다요 ${dto.subject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							작성자 : ${dto.userName}
						</td>
						
						<td width="50%">
						    작성일자 : ${dto.reg_date}
						</td>
						
						<td align="right">
							${dto.reg_date} | 조회 ${dto.hitCount}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.content}
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center p-3">
							 <button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi bi-heart"> </i>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
							</td>
						</tr>
					<tr>
						<td colspan="2">
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/board/article?${query}&boardNum=${preReadDto.boardNum}">${preReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/board/article?${query}&boardNum=${nextReadDto.boardNum}">${nextReadDto.subject}</a>
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
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/board/update?boardNum=${dto.boardNum}&page=${page}&size=${size}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
				    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/board/list?${query}';">목록</button>
					</td>
				</tr>
			</table>
				  <div class="reply">
					<form name="replyForm" method="post">
						<div class='form-header'>
							<span> // </span>
						</div>
						<table class="table table-borderless reply-form">
							<tr>
								<td>
									<textarea class='form-control' name="content"></textarea>
								</td>
							</tr>
							<tr>
							   <td align='right'>
							        <button type='button' class='btn btn-light btnSendReply'>댓글 등록</button>
							    </td>
							 </tr>
						</table>
					</form>
					<div id="listReply"></div>
				</div>
		</div>
	</div>
</div>



<script type="text/javascript">
//페이징처리 
$(function() {
 listPage(1); 
 
});

function listPage(page){
	let url ="${pageContext.request.contextPath}/community/listReply.do";
	let query = "num=${dto.num}&pageNo"+page;
	
	let selector = "#listReply";
	
	const fn = function(data) {
		$(selector).html(data);
	};
	
	ajaxFun(url,"get",query,"html", fn);
}

// 댓글등록 
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
		
		let url = "${pageContext.request.contextPath}/typeCommunity/insertReply";
		let query = "num=" + num + "&content=" + content + "&answer=0";
		
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
		
		let url = "${pageContext.request.contextPath}/bbs/deleteReply";
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
		// 초기값 흰색이므로 true
		let isNoLike = $i.css("color") == "rgb(0, 0, 0)";
		let msg = isNoLike ? "게시글에 공감하십니까 ? " : "게시글 공감을 취소하시겠습니까 ? ";
		
		// 확인창에서 취소 누르면 취소
		if(! confirm( msg )) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/community/insertBoardLike.do";
		let num = "${dto.num}";
		// let query = {num:num, isNoLike:isNoLike};
		let query = "num=" + num + "&isNoLike=" + isNoLike;
		
		const fn = function(data){
			let state = data.state;
			if(state === "true") {
				let color = "black";
				if( isNoLike ) {
					color = "blue";
				}
				$i.css("color", color);
				
				let count = data.boardLikeCount;
				$("#boardLikeCount").text(count);
			} else if(state === "liked") {
				alert("좋아요는 한번만 가능합니다!");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

</script>
