<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<header class="header clearfix">
	
 	<div class="header-container"style="background:#38C68A ">
		   <nav class="main-nav navbar">
			<div class="d-flex justify-content-start" style="height: 55px;">
			<ul class="main-menu2" style="padding-left: 0px">
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/" style="padding-left: 0px"><img id="img-logo" src="${pageContext.request.contextPath}/resources/images/logo_white.png"></a></li>
			</ul>
			<ul class="main-menu2">
				<li><a href="${pageContext.request.contextPath}/commercial/map" class="main-menu2-a">뜨는 상권</a></li>
				<li><a href="${pageContext.request.contextPath}/matching/main" class="main-menu2-a">상권 매칭</a></li>
				<li><a href="${pageContext.request.contextPath}/analysis/main" class="main-menu2-a">상권 현황</a>
					<ul class="sub-menu2">
						<li><a href="#" aria-label="subemnu">지역별 현황</a></li>
						<li><a href="#" aria-label="subemnu">상권별 현황</a></li>
					</ul>
				</li>
				<li><a href="${pageContext.request.contextPath}/assignComm/main" class="main-menu-a">상가 양도</a></li>
				<li><a href="">커뮤니티</a>
					<ul class="sub-menu2">
						<li><a href="${pageContext.request.contextPath}/localComm/list" aria-label="subemnu">지역별 커뮤니티</a></li>
						<li><a href="${pageContext.request.contextPath}/typeComm/list" aria-label="subemnu">업종별 커뮤니티</a></li>
					</ul>
				</li>
				<li><a href="${pageContext.request.contextPath}/notice/list" class="main-menu2-a">고객센터</a>
					<ul class="sub-menu2">
						<li><a href="${pageContext.request.contextPath}/notice/list" aria-label="subemnu">공지사항</a></li>
						<li><a href="${pageContext.request.contextPath}/faq/list" aria-label="subemnu">자주하는 질문</a></li>
						<li><a href="${pageContext.request.contextPath}/qna/list" aria-label="subemnu">1:1문의</a></li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/event/list" class="main-menu-a">이벤트</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/tendency/main" class="main-menu-a">성향 테스트</a>
				</li>
				<c:if test="${sessionScope.member.membership==99}">
					<li><a href="${pageContext.request.contextPath}/admin/noticeManage/list" class="main-menu2-a">관리자 메뉴</a>
						<ul class="sub-menu2">
							<li><a href="${pageContext.request.contextPath}/admin/noticeManage/list" aria-label="subemnu">공지사항 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/faqManage/list" aria-label="subemnu">자주하는질문관리</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/qnaManage/list" aria-label="subemnu">1:1문의 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/board/list" aria-label="subemnu">게시글 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/eventManage/list" aria-label="subemnu">이벤트 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/memberManage/list" aria-label="subemnu">회원 관리</a></li>
						</ul>
					</li>
				</c:if>
			</ul>
			</div>
			<div class="d-flex justify-content-end login-menu">
			<ul>
		        <li>
		           <c:if test="${empty sessionScope.member}">
			       		<a class="login-menu2-a" style="padding-right: 14px;" href="${pageContext.request.contextPath}/member/login">로그인</a>
			       		<a class="login-menu2-a" href="${pageContext.request.contextPath}/member/member">회원가입</a>
		           </c:if>
		           <c:if test="${not empty sessionScope.member}">
						<span class="login-menu2-a">${sessionScope.member.userName}님</span>
						<a class="login-menu2-a" style="padding-right: 14px;" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
						<a class="login-menu2-a" href="${pageContext.request.contextPath}/"></a>
		           </c:if>
		        </li>
		    </ul>
		    </div>
		   </nav>
	</div>	
	
</header>


