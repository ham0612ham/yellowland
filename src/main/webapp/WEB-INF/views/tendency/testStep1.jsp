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
.question-div {
	width: 100%; min-height: 300px; background: #fff; border-radius: 20px; padding: 20px 50px;
	box-shadow: 10px 10px 15px rgb(0,0,0,0.2);
}
@keyframes box-ani {
	0% { transform: translate(0, 100px); }
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
	animation: box-ani 1s;
}
.show {
	animation: fadeIn 1s;
}
.hide {
	opacity: 0;
	animation: fadeOut 0.5s;	
}
.q-mark { text-align: left; font-size: 30px; font-weight: 600; color: #49B3FF; }
.q-disc { font-size: 20px; }
.choice-div { padding: 30px; }
.choice-tags { 
	width: 200px; height: 200px; border-radius: 100px; 
	text-align: center; color: #fff; font-size: 30px;
	font-weight: 600; padding-top: 75px; cursor: pointer;
}
.food { background-color: #36C88A; box-shadow: 0px 0px 15px rgb(54, 200, 138); }
.service { background-color: #49B3FF; box-shadow: 0px 0px 15px rgb(73, 179, 255); }
.retail { background-color: #756EF2; box-shadow: 0px 0px 15px rgb(117, 110, 242); }

.food:hover { background-color: #18BD77; box-shadow: 0px 0px 15px rgb(54, 200, 138); }
.service:hover { background-color: #389FE9; box-shadow: 0px 0px 15px rgb(73, 179, 255); }
.retail:hover { background-color: #6660DB; box-shadow: 0px 0px 15px rgb(117, 110, 242); }
.progress-div { margin: 40px 20px; width: 80%; }
.progress-bar { width: 12.5%; }
.circle {
	width: 10px; height: 10px; border-radius: 15px; background-color: #e9ecef;
	margin: auto 10px;
}
.number-circle {
	width: 20px; height: 20px; background-color: #000; color: #fff;
	font-size: 12px; padding: auto; text-align: center; padding-top: 2px;
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
      description: '내 사업 유형은? 어떤 사업이 어울릴까',
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
	$(".choice-tags").click(function(){
		let cateJobNum = $(this).attr("data-val");
		alert(cateJobNum);
	});
});
</script>

<div class="container">
	<div class="body-container show">
		<div class="progress-div d-flex justify-content-betwee">
			<span class="circle number-circle">1</span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
		</div>
		<div class="question-div move">
			<div><span class="q-mark">Q. </span><span class="q-disc"> 다음중 더 끌리는 업종을 선택해주세요.</span></div>
			<div class='choice-div d-flex justify-content-between'>
				<div class="choice-tags food" data-val="CS1">외식업</div>
				<div class="choice-tags service" data-val="CS2">서비스업</div>
				<div class="choice-tags retail" data-val="CS3">소매업</div>
			</div>
		</div>
	</div>
</div>