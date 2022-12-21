<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 회원 정보</h3>
<table class="table td-border mx-auto my-10" style="width: 99%;">
	<tr>
		<td class="wp-15 text-center bg-light">회원번호</td>
		<td class="wp-35 ps-5">${dto.memberIdx}</td>
		<td class="wp-15 text-center bg-light">아이디</td>
		<td class="wp-35 ps-5">${dto.userId}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">이 름</td>
		<td class="ps-5">${dto.userName}</td>
		<td class="text-center bg-light">생년월일</td>
		<td class="ps-5">${dto.birth}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">전화번호</td>
		<td class="ps-5">${dto.tel}</td>
		<td class="text-center bg-light">이메일</td>
		<td class="ps-5">${dto.email}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">회원가입일</td>
		<td class="ps-5">${dto.register_date}</td>
		<td class="text-center bg-light">최근로그인</td>
		<td class="ps-5">${dto.last_login}</td>
	</tr>
	
	<tr>
		<td class="text-center bg-light">계정상태</td>
		<td colspan="3" class="ps-5">
			${dto.enabled==1?"활성":"잠금"}
			<c:if test="${dto.enabled==0 && not empty memberState}">, ${memberState.memo}</c:if>
			&nbsp;<span class="btn" onclick="memberStateDetaileView();" style="cursor: pointer;">자세히</span>
		</td>
	</tr>
</table>

<form id="deteailedMemberForm" name="deteailedMemberForm" method="post">
	<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 유저 상태 변경</h3>
	
	<table class="table td-border mx-auto my-5">
		<tr>
			<td class="wp-15 text-center bg-light">계정상태</td>
			<td class="ps-5">
				<select class="form-select" name="stateCode" id="stateCode" onchange="selectStateChange()">
					<option value="">::상태코드::</option>
					<c:if test="${dto.enabled==0}">
						<option value="0">잠금 해제</option>
					</c:if>
					<option value="2">불법적인 방법으로 로그인</option>
					<option value="3">불건전 게시물 등록</option>
					<option value="4">다른 유저 비방</option>
					<option value="5">타계정 도용</option>
					<option value="6">기타 약관 위반</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="pe-7 text-center bg-light">메 모</td>
			<td class="ps-5">
				<input type="text" name="memo" id="memo" class="form-control" style="width: 95%;">
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="memberIdx" value="${dto.memberIdx}">
	<input type="hidden" name="userId" value="${dto.userId}">
	<input type="hidden" name="registerId" value="${sessionScope.member.userId}">
</form>

<div id="memberStateDetaile" style="display: none;">
	<table class="table table-border mx-auto my-10">
		<thead>
			<tr class="bg-light">
				<th>내용</th>
				<th width="130">담당자</th>
				<th width="200">등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${listState}">
				<tr>
					<td class="ps-5">${vo.memo} (${vo.stateCode})</td>
					<td class="text-center">${vo.registerId}</td>
					<td class="text-center">${vo.reg_date}</td>
				</tr>
			</c:forEach>
	  
			<c:if test="${listState.size()==0}">
				<tr align="center" style="border: none;">
					<td colspan="3">등록된 정보가 없습니다.</td>
				</tr>  
			</c:if>
		</tbody>
	</table>  
</div>
