<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

#chat-channel-button a > img {
    position: fixed;
    bottom: 4px;
    right: 2px;
    width: 70px;
}

.footer-div { background: white; }
</style>

	<div class="footer-div" id="footer-div" style="width: 100%; height: 70px;">
		<div class="links" style="text-align: center; padding: 15px;">
			<a class="navbar-brand" href="#" style="padding-left: 0px"><img id="img-gray" src="${pageContext.request.contextPath}/resources/images/logo_gray.png"></a>
			<span>회사소개</span><span>이용약관</span><span>고객센터</span><span>인재채용</span><span>TEL : 02-336-8546</span>
			<div style="text-align: center;">주소 : 서울 마포구 월드컵북로 21 풍성빌딩 2층</div>
		</div>
	</div>
	<div id="chat-channel-button"></div>
 
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('7683313bbbcbe3d0800c99abb84b7aa6'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<script>
  Kakao.Channel.createChatButton({
    container: '#chat-channel-button',
    channelPublicId: '_mqxeixj',
  });
</script>
	