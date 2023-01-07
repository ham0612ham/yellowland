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
#this-title { font-size: 30px; font-weight: 600; color: #36C88A; }
.a-href { color: #000; text-decoration: none; }
.btn-func { background: #36C88A; color: white; border: 0.5px solid #36C88A; }
.btn-func:clicked { background: #18BD77; color: white; border: 0.5px solid #18BD77; }
.btn-func:hover { color: #36C88A; border: 0.5px solid #36C88A; }
</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId}">
function deleteOk() {
	let query = "num=${dto.num}&imageFilename=${dto.imageFilename}";
    let url = "${pageContext.request.contextPath}/event/delete?" + query;

    if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
  	  location.href = url;
    }
}

</c:if>
</script>

<div class="container">
	<div class="body-container">	
		<div id="this-title">이벤트</div>
		<table class="table mb-0">
			<thead>
				<tr>
					<td colspan="2" align="center">
						${dto.subject}
					</td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td width="50%">
						이름 : ${dto.userName}						
					</td>
					<td align="right">
						${dto.reg_date}
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom: none;">
						<img class="w-100 h-auto" src="${pageContext.request.contextPath}/uploads/photo/${dto.imageFilename}">
					</td>
				</tr>
										
				<tr>
					<td colspan="2">
						${dto.content}
					</td>
				</tr>
					
				<tr>
					<td colspan="2">
						이전글 :
						<c:if test="${not empty preReadDto}">
							<a class="a-href" href="${pageContext.request.contextPath}/event/article?num=${preReadDto.num}">${preReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						다음글 :
						<c:if test="${not empty nextReadDto}">
							<a class="a-href" href="${pageContext.request.contextPath}/event/article?num=${nextReadDto.num}">${nextReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
			
		<table class="table table-borderless">
			<tr>
				<c:if test="${sessionScope.member.userId==dto.userId}">
				<td width="50%">
					<c:choose>
						<c:when test="${sessionScope.member.userId==dto.userId}">
							<button type="button" class="btn btn-func" onclick="location.href='${pageContext.request.contextPath}/event/update?num=${dto.num}&page=${page}';">수정</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-func" disabled="disabled">수정</button>
						</c:otherwise>
					</c:choose>
			    	
					<c:choose>
			    		<c:when test="${sessionScope.member.userId==dto.userId}">
			    			<button type="button" class="btn btn-func" onclick="deleteOk();">삭제</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn btn-func" disabled="disabled">삭제</button>
			    		</c:otherwise>
			    	</c:choose>
				</td>
				</c:if>
				<td class="text-end">
					<button type="button" class="btn btn-func" onclick="location.href='${pageContext.request.contextPath}/event/list?page=${page}';">리스트</button>
				</td>
			</tr>
		</table>
	</div>
</div>