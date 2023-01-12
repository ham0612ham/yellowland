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
.container { height: 1100px; background: #36C88A; margin: 0px; max-width: 100%; position: absolute; }
.question-div {
	width: 100%; min-height: 300px; background: #fff; border-radius: 20px; padding: 20px 50px;
	box-shadow: 10px 10px 15px rgb(0,0,0,0.2);
}
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
.title-div { 
	font-size: 30px; color: #fff; font-weight: 600; margin-left: 10px; 
	margin-bottom: 20px;
}
.result-border { border: 0.5px solid #A3A6AD; border-radius: 10px; margin-top: 10px; }
.result-border:first-child { margin-top: 40px; }
.result-tags { padding: 10px 30px; }
.result-tag { padding: 10px 30px 0px 30px; }

.circle {
	width: 10px; height: 10px; border-radius: 15px; background-color: #e9ecef;
	margin: auto 10px;
}
.number-circle {
	width: 20px; height: 20px; background-color: #000; color: #fff;
	font-size: 12px; padding: auto; text-align: center; padding-top: 2px;
}
.pre-btn { text-align: right; margin-top: 30px; color: #A3A6AD; }
.pre-btn:hover { color: #36C88A; }
.result-img { width: 300px; }
.result-img-div { text-align: center; margin-top: 30px; }
.result-job { font-size: 35px; text-align: center; font-weight: 600; }
.result-job-div {margin-top: 20px;}
.colon { width: 60px; }
.blue-job { font-weight: 600; color: #49B3FF; }
.gray-div { 
	background: #E1E1E1; padding: 5px 15px; margin-right: 5px; 
	border-radius: 20px; font-size: 14px;
}
.gray-color { color: #A3A6AD; }
.menu { font-weight: 600; }
.menu:hover { color: #49B3FF; cursor: pointer; }
.image-btn { margin: 0px 4px 30px 4px; cursor: pointer }
</style>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

Kakao.init('${daumKey}');

//SDK 초기화 여부를 판단합니다.
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

$(function(){
	if('${cateJobNum}' === 'CS1') {
		$(".result-img").prop("src", "${pageContext.request.contextPath}/resources/images/testStep/food.png");
	} else if ('${cateJobNum}' === 'CS2') {
		$(".result-img").prop("src", "${pageContext.request.contextPath}/resources/images/testStep/service.png");
	} else if ('${cateJobNum}' === 'CS3') {
		$(".result-img").prop("src", "${pageContext.request.contextPath}/resources/images/testStep/retail.png");
	}
});

</script>

<div class="container">
	<div class="body-container show">
		<div class="title-div">분석 결과</div>
		<div class="question-div move">
			<div class='result-div'>
				<div class='result-img-div'>
					<img class="result-img" src="${pageContext.request.contextPath}/resources/images/testStep/food.png">
				</div>
				<div class="result-job-div">
					<div class="result-job">
						<span class="semi">
							<img class="colon" src="${pageContext.request.contextPath}/resources/images/testStep/colon_1.png">
						</span>
						<span class="job">${first}</span>
						<span class="semi">
							<img class="colon" src="${pageContext.request.contextPath}/resources/images/testStep/colon_2.png">
						</span>
					</div>
				</div>
				<div class="result-border">
					<div class="result-tags">
						당신의 성향에 가장 어울리는 가게는 <span class="blue-job">${first}</span>입니다.
					</div>
				</div>
				<div class="result-border">
					<div class="result-tag">
						<span class="blue-job">${first}</span> 외에 당신에게 어울리는 다른 가게는 어떤 것이 있을까요?
					</div>
					<div class="result-tag d-flex flex-row mb-3" style='margin: 0px;'>
						<div class="gray-div"><span>${second}</span></div>
						<div class="gray-div"><span>${third}</span></div>
						<div class="gray-div"><span>${fourth}</span></div>
						<div class="gray-div"><span>${fifth}</span></div>
					</div>
				</div>
				<div class="result-border" style="margin-bottom: 30px; font-size: 14px;">
					<div class="result-tags d-flex justify-content-between" style="padding: 10px 30px 5px 30px;">
						<div>직접 조건별 상권을 확인하고싶다면?</div>
						<div>
							<span class="menu" onclick='location.href="${pageContext.request.contextPath}/commercial/map"'>뜨는 상권</span>
							<span class="gray-color">으로 알아보기</span>
						</div>
					</div>
					<div class="result-tags d-flex justify-content-between" style="padding: 0 30px;">
						<div>맞춤별 동네를 찾고 싶다면?</div>
						<div>
							<span class="menu" onclick='location.href="${pageContext.request.contextPath}/matching/main"'>상권 매칭</span>
							<span class="gray-color">으로 알아보기</span>
						</div>
					</div>
					<div class="result-tags d-flex justify-content-between" style="padding: 5px 30px 10px 30px;">
						<div>모든 수치를 한 눈에 보고 싶다면?</div>
						<div>
							<span class="menu" onclick='location.href="${pageContext.request.contextPath}/analysis/area/main"'>상권 현황</span>
							<span class="gray-color">으로 알아보기</span>
						</div>
					</div>
				</div>
				<div style="text-align: center;">
					<span><img class="image-btn image-btn1" src="${pageContext.request.contextPath}/resources/images/kakao.png" style="width: 50px;" title="카카오톡 공유" onclick="kakaoShare();"></span>
					<span><img class="image-btn image-btn2" src="${pageContext.request.contextPath}/resources/images/facebook.png" style="width: 50px;" title="페이스북 공유" onclick="onClickFacebook();"></span>
					<span><img class="image-btn image-btn3" src="${pageContext.request.contextPath}/resources/images/link.png" style="width: 50px;" title="주소 복사" onclick="clip(); return false;"></span>
				</div>
			</div>
		</div>
	</div>
</div>