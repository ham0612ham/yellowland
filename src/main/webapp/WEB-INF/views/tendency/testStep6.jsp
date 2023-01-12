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
.title-div { 
	font-size: 30px; color: #fff; font-weight: 600; margin-left: 10px; 
	margin-bottom: 20px;
}
.q-mark { text-align: left; font-size: 30px; font-weight: 600; color: #49B3FF; }
.q-disc { font-size: 20px; font-weight: 600 }
.choice-border { border: 0.5px solid #A3A6AD; border-radius: 10px; margin-top: 10px; }
.choice-border:hover { 
	border: 0.5px solid #A3A6AD; border-radius: 10px; margin-top: 10px; cursor: pointer; 
	background-color: #DDDDDD;
}
.choice-border:first-child { margin-top: 40px; }
.choice-tags { padding: 10px 30px; }

.food:hover { background-color: #18BD77; box-shadow: 0px 0px 15px rgb(54, 200, 138); }
.service:hover { background-color: #389FE9; box-shadow: 0px 0px 15px rgb(73, 179, 255); }
.retail:hover { background-color: #6660DB; box-shadow: 0px 0px 15px rgb(117, 110, 242); }
.progress-div { margin: 10px 0 20px 0px; width: 80%; }
.progress-bar { width: 12.5%; }
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
.choice-img { width: 18px; position: absolute; padding-top: 2px; margin-left: 3px; }
</style>

<script type="text/javascript">

$(function(){
	$(".pre-btn").click(function(){
		const f = document.listForm;
		f.action = "${pageContext.request.contextPath}/tendency/testStep5";
		f.submit();
	});
});

$(function(){
	$(".choice-tags").click(function(){
		let val = $(this).attr("data-val");
		$("input[name=dayNight]").val(val);
		
		const f = document.listForm;
		f.action = "${pageContext.request.contextPath}/tendency/testStep7";
		f.submit();
	});
});
</script>

<div class="container">
	<div class="body-container show">
		<div class="title-div">성향 테스트</div>
		<div class="progress-div d-flex justify-content-betwee">
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle number-circle">6</span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
			<span class="circle"></span>
		</div>
		<div class="question-div move">
			<div><span class="q-mark">Q. </span><span class="q-disc"> 오픈을 위해 가게에 도착한 당신! 지금 시각은?</span></div>
			<div class='choice-div'>
				<div class="choice-border">
					<div class="choice-tags" data-val="night">
						일찍 일어난 새가 졸리다.. 오후가 되어서 준비를 시작한다.
					</div>
				</div>
				<div class="choice-border">
					<div class="choice-tags" data-val="day">
						부자는 일찍 일어난다! 오전 일찍 일어나서 준비를 시작한다.
					</div>
				</div>
				<div class="pre-btn">이전 선택지</div>
				<form name="listForm" method="post">
					<input type="hidden" name="cateJobNum" value="${dto.cateJobNum}">
					<input type="hidden" name="independent" value="${dto.independent}">
					<input type="hidden" name="active" value="${dto.active}">
					<input type="hidden" name="study" value="${dto.study}">
					<input type="hidden" name="certificate" value="${dto.certificate}">
					<input type="hidden" name="dayNight" value="">
				</form>
			</div>
		</div>
	</div>
</div>