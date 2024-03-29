
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
		
		let text = $(this).text();
		$("input[name=selectCategory]").attr("data-text", text);
		
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
			innerHtml += "<option value='"+"all"+"'>"+"전체"+"</option>";
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
			innerHtml = "<option value='4'>4분기</option><option value='3'>3분기</option><option value='2'>2분기</option><option value='1'>1분기</option>";
		} else {
			innerHtml = "<option value='3'>3분기</option><option value='2'>2분기</option><option value='1'>1분기</option>";
		}
		
		$("select[name=qCode]").html(innerHtml);
	});
	
});


$(function(){
	let url = "/app/bringcate/job";
	let query = "cateJobNum=all";
	let innerHtml;
		
	const fn = function(data) {
		innerHtml += "<option value='"+"all"+"'>"+"전체"+"</option>";
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
			alert("검색할 항목을 골라주세요");
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
			$("#excelButton-div").html('<button class="btn" id="captureButton" style="margin-right: 5px;" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="현재 펼쳐진 이미지대로 캡쳐됩니다.">캡쳐 저장</button><button class="btn" id="excelButton">엑셀 저장</button>');
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
				
				let regexp = /구$/;
				if(regexp.test(guName)) {
					$(this).children().html("<img class='btn-oc align-middle' data-click='true' src='/app/resources/images/plus.png'>");
				}
			});

			let subInfo = "";
			
			switch(tableTitle){
				case "점포수": subInfo = "(단위: 개, 기준일: 2022년9월30일)"; break;
				case "신생기업 생존율": subInfo = "(단위: %, 기준일: 2022년9월30일)"; break;
				case "연차별 생존율": subInfo = "(단위: %, 기준일: 2022년9월30일)"; break;
				case "평균 영업기간": subInfo = "(단위: 년, 기준일: 2022년9월30일)"; break;
				case "개/폐업수(률)": subInfo = "(단위: 개,%,3개월간 개폐업수, 기준일: 2022년9월30일)"; break;
				case "인구수": subInfo = "(단위: ha당 명, 기준일: 2022년9월30일)"; break;
				case "소득/가구수": subInfo = "(단위: 지수,가구, 기준일: 2022년9월30일)"; break;
			}
			$("#sub-info").text(subInfo);
		}
		ajaxFun(url, "get", query, "html", fn);
	});
});

function s2ab(s) { 
    var buf = new ArrayBuffer(s.length);
    var view = new Uint8Array(buf);
    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
    return buf;    
}
function exportExcel(){ 
    var wb = XLSX.utils.book_new();

    var newWorksheet = excelHandler.getWorksheet();
    
    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}
$(document).ready(function() { 
    $(".body-container").on("click", "#excelButton", function(){
        exportExcel();
    });
});

var excelHandler = {
        getExcelFileName : function(){
            return '서울시_상권별현황_'+$("input[name=selectCategory]").attr("data-text")+'.xlsx';
        },
        getSheetName : function(){
            return '서울시 상권별현황';
        },
        getExcelData : function(){
            return document.getElementById('table1'); 
        },
        getWorksheet : function(){
            return XLSX.utils.table_to_sheet(this.getExcelData());
        }
}


$(function(){
	$("#excelButton-div").on("click", "#captureButton", function(){
		printDiv();
	});
});

function printDiv() {
	const now = new Date().getTime();
	
	let div = $("#table1");
	div = div[0];
	html2canvas(div).then(function(canvas){
		var myImage = canvas.toDataURL("image/jpeg");
		downloadURI(myImage, now+".png") // 현재시간 밀리세컨드로 png 이름 저장
	});
}

function downloadURI(uri, name) {
	var link = document.createElement("a")
	if( typeof link.download === 'string' ) {
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
		$("#link-box").show;
	} else {
		window.open(uri);
	}
}
