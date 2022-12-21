<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
// 메뉴 활성화
$(function(){
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
    
    try {
    	$('nav ul>li>a').each(function() {
    		if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	if($('nav ul>li>a').hasClass("active_menu")) return false;
    	
    	$('nav ul>.menu--item__has_sub_menu').each(function() {
    		if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    }catch(e) {
    }
});

$(function(){
	$('nav ul>.menu--item__has_sub_menu ul>li>a').each(function() {
		if($(this).hasClass('active_menu')) {
			$(this).closest(".menu--item__has_sub_menu").addClass('menu--subitens__opened');
			return false;
		}
	});
});
</script>

<nav class="vertical_nav">
	<ul id="js-menu" class="menu">
	
		<li class="menu--item">
	        
				
				<span class="menu--label" style="font-size:24px;font-weight:600" >관리자메뉴</span>
			
		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/notice/list" class="menu--link" title="공지사항관리">
				
				<span class="menu--label">공지사항관리</span>
			</a>
		</li>
		
		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/faq/list" class="menu--link" title="자주하는질문">
				
				<span class="menu--label">자주하는 질문</span>
			</a>
		</li>
		
		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/qna/list" class="menu--link" title="1대1문의">
				
				<span class="menu--label">1대1문의</span>
			</a>
		</li>
		
		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/board/list" class="menu--link" title="게시글 관리">
				
				<span class="menu--label">게시글관리</span>
			</a>
		</li>
		
		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/memberManage/list" class="menu--link" title="회원 관리">
				
				<span class="menu--label">회원 관리</span>
			</a>
		</li>
		
	</ul>
</nav>


