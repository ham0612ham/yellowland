
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$(".container").on("click", ".btn-oc", function(){
		let id = $(this).parent().parent().parent().attr("data-tt-id")+"-1";
		console.log(id);
		
		if($(this).attr("data-click")==="true"){
			$(".leaf").each(function(index, item){
				if($(this).attr("data-tt-id") === id) {
					$(this).css("display", '');
				}
			});
			$(this).attr("data-click", "false");
			$(this).attr("src", "/app/resources/images/minus.png");
			$(this).parent().parent().parent().children().css("background", "rgba(54, 200, 138, 0.3)");
		} else {
			$(".leaf").each(function(index, item){
				if($(this).attr("data-tt-id") === id) {
					$(this).css("display", 'none');
				}
			});
			$(this).attr("data-click", "true");
			$(this).attr("src", "/app/resources/images/plus.png");
			$(this).parent().parent().parent().children().css("background", "#fff");
		}
	});
});

$(function(){
	$(".btn-td").click(function(){
		$(".btn-td").css("color", "#A3A6AD");
		$(".btn-td").css("border", "0.5px solid #e1e1e1");
		$(".btn-td").css("font-weight", "400");
		
		$(this).css("color", "#36C88A");
		$(this).css("border", "0.5px solid #36C88A");
		$(this).css("font-weight", "600");
		
		let val = $(this).attr("data-val");
		$("input[name=selectCategory]").val(val);
		
		if(val === "population" || val === "income" || val === "rent") {
			$("select[name=induL]").hide();
			$("select[name=induM]").hide();
			$("#induLM").hide();
		} else {
			$("select[name=induL]").show();
			$("select[name=induM]").show();
			$("#induLM").show();
		}
	});
});

$(function(){
	$("select[name=induL]").change(function(){
		let cateJobNum = $(this).val().substring(0, 3);
		if(cateJobNum === "CS0") cateJobNum = "all";
		
		let url = "/app/bringcate/job";
		let query = "cateJobNum="+cateJobNum;
		let innerHtml;
		
		const fn = function(data) {
			innerHtml += "<option value='"+"all"+"'>"+"??????"+"</option>";
			for(let dto of data.jobList) {
				innerHtml += "<option value='"+dto.jobNum+"'>"+dto.jobName+"</option>";
			}
			$("#induM").html(innerHtml);
		}
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	$("select[name=yCode]").change(function(){
		let yCode = $(this).val();
		let innerHtml = "";
		if(yCode !== "2022") {
			innerHtml = "<option value='4'>4??????</option><option value='3'>3??????</option><option value='2'>2??????</option><option value='1'>1??????</option>";
		} else {
			innerHtml = "<option value='3'>3??????</option><option value='2'>2??????</option><option value='1'>1??????</option>";
		}
		
		$("select[name=qCode]").html(innerHtml);
	});
	
});


$(function(){
	let url = "/app/bringcate/job";
	let query = "cateJobNum=all";
	let innerHtml;
		
	const fn = function(data) {
		innerHtml += "<option value='"+"all"+"'>"+"??????"+"</option>";
		for(let dto of data.jobList) {
			innerHtml += "<option value='"+dto.jobNum+"'>"+dto.jobName+"</option>";
		}
		$("#induM").html(innerHtml);
	}
		
	ajaxFun(url, "post", query, "json", fn);
});

$(function(){
	$("#btn-formSend").click(function(){
		let val = $("input[name=selectCategory]").val();
		
		if(!val) {
			alert("????????? ????????? ???????????????");
			return;
		}
		
		let selectBusinessArea = $("#selectBusinessArea").val();
		let yCode = $("#selectYear").val();
		let qCode = $("#selectQuart").val();
		let qCondition = $("#qCondition").val();
		let induM = $("#induM").val();
		let fileName = "";
		if(val === "population" || val === "income") {
			fileName = "dist"+selectBusinessArea+val+yCode+qCode+qCondition;
		} else {
			fileName = "dist"+selectBusinessArea+val+yCode+qCode+qCondition+induM;
		}
		
		let url = "/app/analysis/dist/getHtml";
		let query = "fileName="+fileName;
		
		const fn = function(data) {
			$("#output-table").html(data);
			
			$("tr.branch").css("display", '');
			$("#tableSpace > table").addClass('table');
			$("#tableSpace > table").addClass('table-bordered');
			$("td").addClass('align-middle');
			$("th").addClass('align-middle');
			$("thead").css("border-top", "2px solid")
			
			let tableTitle = $("caption").text();
			$("#table-title").text(tableTitle);
			
			$("tbody > tr td:first-child").each(function(index, item){
				let guName = $(this).text();
				
				let regexp = /???$/;
				if(regexp.test(guName)) {
					$(this).children().html("<img class='btn-oc align-middle' data-click='true' src='/app/resources/images/plus.png'>");
				}
			});

			let subInfo = "";
			
			switch(tableTitle){
				case "?????????": subInfo = "(??????: ???, ?????????: 2022???9???30???)"; break;
				case "???????????? ?????????": subInfo = "(??????: %, ?????????: 2022???9???30???)"; break;
				case "????????? ?????????": subInfo = "(??????: %, ?????????: 2022???9???30???)"; break;
				case "?????? ????????????": subInfo = "(??????: ???, ?????????: 2022???9???30???)"; break;
				case "???/?????????(???)": subInfo = "(??????: ???,%,3????????? ????????????, ?????????: 2022???9???30???)"; break;
				case "?????????": subInfo = "(??????: ha??? ???, ?????????: 2022???9???30???)"; break;
				case "??????/?????????": subInfo = "(??????: ??????,??????, ?????????: 2022???9???30???)"; break;
			}
			$("#sub-info").text(subInfo);
		}
		ajaxFun(url, "get", query, "html", fn);
	});
});

