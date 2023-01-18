<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div class="header-main">
		<nav class="main-nav navbar">
			<div class="d-flex justify-content-start" style="height: 55px;">
			<ul class="main-menu" style="padding-left: 0px">
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/" style="padding-left: 0px"><img id="img-logo" src="${pageContext.request.contextPath}/resources/images/logo_color.png"></a></li>
			</ul>
			<ul class="main-menu">
				<li><a href="${pageContext.request.contextPath}/commercial/map" class="main-menu-a">뜨는 상권</a></li>
				<li><a href="${pageContext.request.contextPath}/matching/main" class="main-menu-a">상권 매칭</a></li>
				<li><a href="${pageContext.request.contextPath}/analysis/area/main" class="main-menu-a">상권 현황</a>
					<ul class="sub-menu" style="z-index: 100">
						<li><a href="${pageContext.request.contextPath}/analysis/area/main" aria-label="subemnu">지역별 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/analysis/dist/main" aria-label="subemnu">상권별 현황</a></li>
					</ul>
				</li>
				<li><a href="${pageContext.request.contextPath}/assignComm/main" class="main-menu-a">상가 양도</a></li>
				<li><a href="#" class="main-menu-a">커뮤니티</a>
					<ul class="sub-menu" style="z-index: 100">
						<li><a href="${pageContext.request.contextPath}/localComm/list" aria-label="subemnu">지역별 커뮤니티</a></li>
						<li><a href="${pageContext.request.contextPath}/typeComm/list" aria-label="subemnu">업종별 커뮤니티</a></li>
					</ul>
				</li>
				<li><a href="${pageContext.request.contextPath}/notice/list" class="main-menu-a">고객센터</a>
					<ul class="sub-menu" style="z-index: 100">
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
					<li><a href="${pageContext.request.contextPath}/admin/noticeManage/list" class="main-menu-a">관리자 메뉴</a>
						<ul class="sub-menu" style="z-index: 100">
							<li><a href="${pageContext.request.contextPath}/admin/noticeManage/list" aria-label="subemnu">공지사항 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/faqManage/list" aria-label="subemnu">자주하는 질문 관리</a></li>
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
			       		<a class="login-menu-a" style="padding-right: 14px;" href="${pageContext.request.contextPath}/member/login">로그인</a>
			       		<a class="login-menu-a" href="${pageContext.request.contextPath}/member/member">회원가입</a>
		           </c:if>
		           <c:if test="${not empty sessionScope.member}">
						<span class="login-menu-a" id="user-sort">${sessionScope.member.userName}</span>님
						<a class="login-menu-a" style="padding-right: 14px;" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
						<a class="login-menu-a" href="${pageContext.request.contextPath}/member/detail">마이페이지</a>
						<a href="${pageContext.request.contextPath}/note/receive/list" title="쪽지" class="position-relative">
							<span class="new-noteCount position-absolute translate-middle badge rounded-pill">
								<img style="width: 20px; margin-top: 15px; margin-left: 30px; z-index: -1" src="${pageContext.request.contextPath}/resources/images/note.png">
								<span id="unreadMessages" class="position-absolute translate-middle badge rounded-pill bg-warning" style="top: 15px; display: none">
								    ${countMessage}+
								</span>
							</span>
						</a>
		           </c:if>
		        </li>
		    </ul>
		    </div>
		</nav>
	</div>