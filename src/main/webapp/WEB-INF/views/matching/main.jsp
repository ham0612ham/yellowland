<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.btn-primary:hover {
	background: white;
	font-weight: 600;
	
}

</style>
	<div style="position: relative;">
		<div id="back-red" style="position: absolute; z-index: -2;">
		</div>
	         <div style="height: 600px; width: 100%; padding: auto;">
				<table class="table align-middle" style="width: 900px; margin: auto;">
				    <tr style="height: 500px;">
						<th class="three-div1-img" rowspan="3" style="border: none">
						<img style="width: 300px; float: left;" src="${pageContext.request.contextPath}/resources/images/buildings.png">
						</th>
			        	<th class="three-div1-text" style="border: none;">
							<div style="font-weight:80; font-size:40px"> <span class="text-bold">성공적인 창업을 위한  </span></div>
							<div style="font-weight:80; font-size:20px"> <span class="text-bold"> 맞춤 상가매칭 솔루션 </span> </div>
							<div style="font-weight:80; font-size:20px; color:#38C68A"> <span class="text-bold"> 노른자 창업 상담소 </span> </div>
							<div style="font-size: 18px; font-weight: 200; margin-top: 8px; font-weight: bold ">혼자 해결할 수 없는 창업고민 <br>
							   창업전문가가 직접 상담합니다.</div>
							<div>&nbsp;</div>
							<button class ="btn btn-primary mb-3 shadow-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/matching/write'"> 매칭서비스 참여하기 </button>
						</th>
					</tr>
				</table>
			</div>
	</div>
		
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
	
<script type="text/javascript">

</script>


<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "df1625ed-220c-4cb9-bb52-af3f513c8cd8"
  });
</script>
