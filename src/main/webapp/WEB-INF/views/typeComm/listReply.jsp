<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class='reply-info'>
	<span class='reply-count' style="font-weight: bold; color: #36C88A; margin-left: 10px;">댓글 ${replyCount}개</span>
</div>

<table class='table table-borderless' style="margin-top: 10px;">
	<c:forEach var="vo" items="${listReply}">
		<tr class='border' style="height: 120px;" >
			<td width='90%'>
				<div class='row reply-writer' style="width:100%; height: 40px;">
					<h4 class="articleWriterCircle" data-userId="${vo.userId}" style="display: inline; color: #756EF2; width: 35px;" >●&nbsp;</h4>${dto.userName}
					<div class='name' style="float: left; width: 70px; margin-right: 0px; font-weight: bold; padding:0px; padding-left: 10px; text-align: inherit; height: 30px;">${vo.userName}</div>
					<div class='date' style="float: left; width: 200px; color: #9B9898;  padding:0px; height: 30px;" >${vo.regDate}</div>
						
					<c:choose>
						<c:when test="${sessionScope.member.userId==vo.userId}">
							<div class='deleteReply' style="width: 35px; margin-left:442px; float:right; display: inline; padding: 0px; cursor : pointer;" data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>
						</c:when>
					</c:choose>
			
				</div>
				<div>
					<div class='content' style="float: left; margin-left: 40px; width: 85%; overflow-wrap: anywhere;">${vo.content}</div>
				</div>
			
			</td>
		</tr>
	</c:forEach>
</table>

<div class="page-navigation">
	${paging}
</div>	