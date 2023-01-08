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
						    작성일자 : ${dto.regDate}
						</td>
						
						<td align="right">
							${dto.regDate} | 조회 ${dto.hitCount}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.content}
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center p-3">
							 <button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi bi-heart"> </i>&nbsp;&nbsp;<span id="boardLikeCount">좋아요</span></button>
							</td>
						</tr>
					<tr>
						<td colspan="2">
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/localComm/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/localComm/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
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
				    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/localComm/list?${query}';">목록</button>
					</td>
				</tr>
			</table>
			
			<!-- 댓글 -->
			
		</div>
	</div>
</div>




