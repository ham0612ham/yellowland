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
.container { background: #36C88A; margin: 0px; max-width: 100%; position: absolute; }
.title-div { text-align: center; }
.title1, .title2, .title3 { margin-bottom: 20px; }
.title-btn { padding: 10px 50px; border-radius: 40px; font-size: 20px; }
.image-btn { margin: 30px 4px; cursor: pointer }

@keyframes box-ani {
	0% { transform: translate(0, 60px); }
	100% { transform: translate(0, 0); }
}
@keyframes fadeIn {
  from { opacity: 0; }
  to {  opacity: 1; }
}

@keyframes fadeOut {
  from { opacity: 1; }
  to {  opacity: 0; }
}

.move {
	animation: box-ani 0.7s;
}
.show {
	animation: fadeIn 0.7s;
}
</style>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
Kakao.init('${daumKey}');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());

function kakaoShare() {
  Kakao.Link.sendDefault({
    objectType: 'feed',
    content: {
      title: '[노른자] 사장님 성향 테스트',
      description: '내 사업 유형은? 어떤 사업이 어울릴까?',
      imageUrl: 'https://k.kakaocdn.net/14/dn/btrVZN5yaRF/mwCrmBLt4LcEXUECxCmn11/o.jpg',
      link: {
        mobileWebUrl: 'http://localhost:9090/app/tendency/main',
        webUrl: 'http://localhost:9090/app/tendency/main',
      },
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'http://localhost:9090/app/tendency/main',
          webUrl: 'http://localhost:9090/app/tendency/main',
        },
      },
    ],
    // 카카오톡 미설치 시 카카오톡 설치 경로이동
    installTalk: true,
  })
}

function clip(){
	let url = '';
	let textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = 'http://localhost:9090/app/tendency/main';
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("링크가 복사되었습니다 :)")
};

function onClickFacebook() {
	window.open('http://www.facebook.com/sharer.php?u=//localhost:9090/app/tendency/main')
};

</script>

<div class="container">
	<div class="body-container">
		<div class="title-div">
			<div class="title1 show"><img class="move" src="${pageContext.request.contextPath}/resources/images/tendency_title1.png" style="width: 300px;"></div>
			<div class="title2 show"><img class="move" src="${pageContext.request.contextPath}/resources/images/tendency_title2.png" style="width: 300px;"></div>
			<div class="title3 show"><img class="move" src="${pageContext.request.contextPath}/resources/images/tendency_title3.png" style="width: 300px;"></div>
			<div class="show"><div class="btn btn-dark title-btn move" onclick="location.href='${pageContext.request.contextPath}/tendency/testStep1';">지금 테스트하기</div></div>
			<div>
				<span class="show"><img class="image-btn image-btn1 move" src="${pageContext.request.contextPath}/resources/images/kakao.png" style="width: 50px;" title="카카오톡 공유" onclick="kakaoShare();"></span>
				<span class="show"><img class="image-btn image-btn2 move" src="${pageContext.request.contextPath}/resources/images/facebook.png" style="width: 50px;" title="페이스북 공유" onclick="onClickFacebook();"></span>
				<span class="show"><img class="image-btn image-btn3 move" src="${pageContext.request.contextPath}/resources/images/link.png" style="width: 50px;" title="주소 복사" onclick="clip(); return false;"></span>
			</div>
		</div>
	</div>
</div>