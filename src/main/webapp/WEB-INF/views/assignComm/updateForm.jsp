<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">

#add-img {
    object-fit: cover;
    width: 40px;
    height: 40px;
    border-radius: 10px;
    cursor: pointer;
}

</style>

<script type="text/javascript">

CKEDITOR.editorConfig = function( config ) {
    config.enterMode = CKEDITOR.ENTER_BR;
};

</script>

<script type="text/javascript">

function kakaopostUp() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#zip-up").value = data.zonecode;
           document.querySelector("#addr1-up").value =  data.address;
        }
    }).open();
}

function latLngAddrUp() {
	
	const f = document.updateForm;
	
	let addr = f.addr1.value.trim();
	
	let geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
	
    	// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        let latitude  = result[0].y;
	        let longitude = result[0].x;
	        
	      	//$(".lat").attr('value', latitude);
	        //$(".lng").attr('value', longitude);
	        
	        //document.querySelector("#lat-in").setAttribute("value", latitude);
	        //document.querySelector("#lng-in").setAttribute("value", longitude);
	        
	        document.getElementById("lat-up").value = latitude;
	        document.getElementById("lng-up").value = longitude;
	        
	      	// alert("lat-in: " + document.querySelector("#lat-in").value + " lng-in: " + document.querySelector("#lng-in").value);
	        
	    } 
	});
}

function checkUp() {
	
	const f = document.updateForm;
	
	if(! f.subject.value.trim()) {
		alert(" 제목을 입력해주세요! ");
		f.subject.focus();
		return false;
	}

	if(! f.pNum2.value.trim()) {
		alert(" 휴대폰 번호를 입력해주세요! ");
		f.pNum2.focus();
		return false;
		
	} else if(! f.pNum3.value.trim()) {
		alert(" 휴대폰 번호를 입력해주세요! ");
		f.pNum3.focus();
		return false;
	}
	
	if(! f.zip.value.trim()) {
		alert(" 우편 번호를 입력해주세요! ");
		f.zip.focus();
		return false;
	}
	
	if(! f.addr1.value.trim()) {
		alert(" 기본 주소를 입력해주세요! ");
		f.addr1.focus();
		return false;
	}
	
	if(! f.addr2.value.trim()) {
		alert(" 상세 주소를 입력해주세요! ");
		f.addr2.focus();
		return false;
	}
	
	if(! f.thumbnailFile.value.trim()) {
		alert(" 기본 이미지를 업로드해주세요! ");
		f.thumbnailFile.focus();
		return false;
	}
	
	if(! f.deposit.value.trim()) {
		alert(" 보증금을 입력해주세요! ");
		f.deposit.focus();
		return false;
	}
	
	if(! f.monthly.value.trim()) {
		alert(" 월세를 입력해주세요! ");
		f.monthly.focus();
		return false;
	}
	
	if(! f.expense.value.trim()) {
		alert(" 관리비를 입력해주세요! ");
		f.expense.focus();
		return false;
	}
	
	if(! f.area.value.trim()) {
		alert(" 전용면적을 입력해주세요! ");
		f.area.focus();
		return false;
	}
	
	
	if(! f.parking.value.trim()) {
		alert(" 주차 가능 여부를 입력해주세요! ");
		f.parking.focus();
		return false;
	}
	
	if(! f.elevator.value.trim()) {
		alert(" 엘리베이터 유무를 입력해주세요! ");
		f.elevator.focus();
		return false;
	}
	
	if(! f.transDate.value.trim()) {
		alert(" 양도 가능일을 입력해주세요! ");
		f.transDate.focus();
		return false;
	}
	
	
	f.action = "${pageContext.request.contextPath}/assignComm/update";
	f.submit();
	
}



//메인 이미지
$(function() {
	let img = "${dto.thumbnail}";
	
	// 로컬에 이미지를 업로드 했다면
	if( img ) {
		// 메인이미지 로컬 저장 경로
		// img = "${pageContext.request.contextPath}/uploads/image/" + img;
		img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
		
	} else {
		
		img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
		
	}
	
	// empty : 태그는 남기고 내용만 지움 
	$(".thumbnail-viewerUp").empty();
	$(".thumbnail-viewerUp").css("background-image", "url("+img+")");
	
	
	$(".thumbnail-viewerUp").click(function() {
		$("form[name=updateForm] input[name=thumbnailFile]").trigger("click");
	});
	
	// change : 값이 바뀔경우
	$("form[name=updateForm] input[name=thumbnailFile]").change(function() {
		
		let file = this.files[0];
		
		// 이미지 파일이 없을 경우
		if(! file) {
			$(".thumbnail-viewerUp").empty();
			
			if( img ) {
				
				if( img !== "${pageContext.request.contextPath}/resources/images/add_photo.png") {
					img = "${pageContext.request.contextPath}/uploads/image/" + img;
				}
				
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			
			$(".thumbnail-viewerUp").css("background-image", "url("+ img +")");
		
			return false;
		}
		
		// 이미지 파일이 아닌 경우 
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		let reader = new FileReader();
		
		// 파일의 내용을 다 읽었으면 
		reader.onload = function(e) {
			$(".thumbnail-viewerUp").empty();
			$(".thumbnail-viewerUp").css("background-image", "url("+ e.target.result +")");
		};
		
		reader.readAsDataURL( file );
		
	});
	
});

// 추가 이미지
$(function() {
	
	let sel_files = [];
	let count = 0;
	
	$("body").on("click", ".img-update", function() {
		$("form[name=updateForm] input[name=imgFiles]").trigger("click");
	});
	
	$("form[name=updateForm] input[name=imgFiles]").change(function(){
		
		
		// 현재 고른  파일이 없다면
		if(! this.files) {
			let dt = new DataTransfer();
			
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			// 기존 저장된 파일들 다시 저장
			document.updateForm.imgFiles.files = dt.files;
			
			return false;
			
		}
		
		// 유사 배열을 배열로 변환
		const fileArr = Array.from(this.files);
		
		
		
		fileArr.forEach((file, index) => {
			
			count++;
			
			if(count > 4) {
				alert(" 추가 이미지는 최대 4개까지 넣을 수 있습니다. ");
				count--;
				return false;
			}
			
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item img-up"});
			$img.attr("data-filename", file.name);
			
			reader.onload = e => {
				$img.attr("src", e.target.result);
			};
			
			reader.readAsDataURL(file);
			$(".img-flex").append($img);
			
		});
		
		let dt = new DataTransfer();
		
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		document.updateForm.imgFiles.files = dt.files;
		
	});
	
	$("body").on("click", ".img-up", function() {
		if(! confirm("선택한 파일을 삭제하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				// splice : 원하는 위치에 요소를 추가하거나 삭제
				// splice(index, [0:추가,1:삭제], [0일 경우, 추가할 값])
				// i번째 요소 삭제
				sel_files.splice(i, 1);
				count--;
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		document.updateForm.imgFiles.files = dt.files;
		
		$(this).remove();
		
		
	});
	
});

</script>

</head>
<body>


<!-- form Modal -->

<div class="modal fade" id="updateModal" tabindex="-1" data-backdrop="static">
  <div class="modal-dialog main-modal">
    <div class="modal-content mc">
      <div class="modal-header">
        <h5 class="modal-title" id="updateModalLabel">상가 양도 수정 폼 </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<div class="container" style="margin-top: 40px;">
	        	<form method="post" id="updateForm" name="updateForm" class="updateForm" enctype="multipart/form-data">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row no-gutters">
								<div style="margin-top: -20px;" class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
									<div class="contact-wrap w-100 p-md-5 p-4">
											<div class="row">
												<div class="row justify-content-center">
													<div class="col-md-6 text-center mb-5">
														<input type="text" class="form-control subject" name="subject" placeholder="제목" value="${dto.subject}">
													</div>
												</div>
									          	<div style="margin-top: -25px; display: flex; margin-bottom: 13px;">
										          	<div class="col-md-6">
														<div class="form-group mainImg" >
															<label class="label" for="thumbnailFile">대표 이미지</label>
															<div class="thumbnail-viewerUp"></div>
															<input type="file" name="thumbnailFile" accept="image/*" class="form-control" style="display: none;">
														</div>
													</div>
													
												<input type="hidden" name="num" value="${dto.num}">
													<div class="col-md-10">
														<div class="form-group subImg">
															<label class="label" for="imgName">추가 이미지</label>
															<div class="img-flex">
																<img id="add-img" class="item img-update" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
															</div>
															<input type="file" name="imgFiles" accept="image/*" multiple="multiple" class="form-control" style="display: none;">
														</div>
													</div>
												</div>
									          	<p style="margin-bottom: 0; margin-left: 8px;">위치정보</p>
												<div class="col-md-6">
													<div class="form-group" style="display: flex;">
														<input type="text" class="form-control" name="zip" id="zip-up" placeholder="우편번호" value="${dto.zip}">
														<input class="btn btn-primary" style="margin-left: 3px;" type="button" value="우편번호찾기" onclick="kakaopostUp();">
													</div>
												</div>
												
												<div class="col-md-12">
													<div class="form-group">
														<input type="text" readonly="readonly" class="form-control" name="addr1" id="addr1-up" placeholder="기본 주소" value="${dto.addr1}">
													</div>
												</div>
												
												<div>
													<input type="hidden" id="lat-up" class="lat" name="lat" value="${dto.lat}">
													<input type="hidden" id="lng-up" class="lng" name="lng" value="${dto.lng}">
												</div>
												
												<div class="col-md-12">
													<div class="form-group">
														<input type="text" onclick="latLngAddrUp();" class="form-control addr2" name="addr2" placeholder="상세 주소" value="${dto.addr2}">
													</div> 
												</div>
												
												<div class="col-md-12">
													<div style="margin-top: 10px;" class="form-group">
														<label class="label" for="editorUp" style="margin-left: 8px;">상세설명</label>
														<textarea name="content" class="form-control" id="editorUp" cols="30" rows="4"  
															placeholder="소개하고 싶은 상가에 대한 설명과 특징을 입력해주세요. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#13;&#10;
																		상가의 위치와 교통 및 주변 시설 등 전체적인 상가의 느낌 등을 작성해주세요.">${dto.content}</textarea>
													</div>
												</div>
												
											</div>
										<script>
									    	ClassicEditor.create( document.querySelector( '#editorUp' ) );
									    </script>
	
									</div>
								</div>
								<div class="col-lg-4 col-md-5 d-flex align-items-stretch">
									<div class="info-wrap w-100 p-md-5 p-4 phone">
							        	
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 216px;">보증금</p>
															<input type="text" class="form-control deposit" name="deposit" value="${dto.deposit}">
															<p class="unit" style="width: 85px;">만원</p>
														</div>
													</div>
									          	</div>
								          	</div>
								        	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 216px; font-size: 16px;">월세</p>
															<input type="text" class="form-control monthly" name="monthly" style=" font-size: 16px;" value="${dto.monthly}">
															<p class="unit" style="width: 85px;">만원</p>
														</div>
													</div>
									          	</div>
								          	</div>
								        	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 216px;">관리비</p>
															<input type="text" class="form-control expense" name="expense"  value="${dto.expense}">
															<p class="unit" style="width: 85px;">만원</p>
														</div>
													</div>
									          	</div>
								          	</div>
								        	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex; ">
								        					<p style="width: 216px;">전용면적</p>
															<input type="text" class="form-control area" name="area" value="${dto.area}">
															<p class="unit" style="width: 85px;">㎡</p>
														</div>
													</div>
									          	</div>
								          	</div>
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 211px;">건물 층</p>
																<select class="form-select" name="bFloor">
																	<option value="1" ${dto.bFloor=="1" ? "selected='selected'":""}>1층</option>
																	<option value="2" ${dto.bFloor=="2" ? "selected='selected'":""}>2층</option>
																	<option value="3" ${dto.bFloor=="3" ? "selected='selected'":""}>3층</option>
																	<option value="4" ${dto.bFloor=="4" ? "selected='selected'":""}>4층</option>
																	<option value="5" ${dto.bFloor=="5" ? "selected='selected'":""}>5층</option>
																	<option value="6" ${dto.bFloor=="6" ? "selected='selected'":""}>6층</option>
																	<option value="7" ${dto.bFloor=="7" ? "selected='selected'":""}>7층</option>
																	<option value="8" ${dto.bFloor=="8" ? "selected='selected'":""}>8층</option>
																	<option value="9" ${dto.bFloor=="9" ? "selected='selected'":""}>9층</option>
																	<option value="10" ${dto.bFloor=="10" ? "selected='selected'":""}>10층</option>
																	<option value="11" ${dto.bFloor=="11" ? "selected='selected'":""}>11층</option>
																	<option value="12" ${dto.bFloor=="12" ? "selected='selected'":""}>12층</option>
																	<option value="13" ${dto.bFloor=="13" ? "selected='selected'":""}>13층</option>
																	<option value="14" ${dto.bFloor=="14" ? "selected='selected'":""}>14층</option>
																	<option value="15" ${dto.bFloor=="15" ? "selected='selected'":""}>15층</option>
																	<option value="16" ${dto.bFloor=="16" ? "selected='selected'":""}>16층</option>
																	<option value="17" ${dto.bFloor=="17" ? "selected='selected'":""}>17층</option>
																	<option value="18" ${dto.bFloor=="18" ? "selected='selected'":""}>18층</option>
																	<option value="19" ${dto.bFloor=="19" ? "selected='selected'":""}>19층</option>
																	<option value="20" ${dto.bFloor=="20" ? "selected='selected'":""}>20층</option>
																</select>
															<p class="unit" style="width: 85px;">㎡</p>
														</div>
														<div class="sub" style="display: flex;">
								        					<p style="width:211px;">해당 층</p>
																<select class="form-select" name="floor">
																	<option value="1" ${dto.floor=="1" ? "selected=selected":""}>1층</option>
																	<option value="2" ${dto.floor=="2" ? "selected=selected":""}>2층</option>
																	<option value="3" ${dto.floor=="3" ? "selected=selected":""}>3층</option>
																	<option value="4" ${dto.floor=="4" ? "selected=selected":""}>4층</option>
																	<option value="5" ${dto.floor=="5" ? "selected=selected":""}>5층</option>
																	<option value="6" ${dto.floor=="6" ? "selected=selected":""}>6층</option>
																	<option value="7" ${dto.floor=="7" ? "selected=selected":""}>7층</option>
																	<option value="8" ${dto.floor=="8" ? "selected=selected":""}>8층</option>
																	<option value="9" ${dto.floor=="9" ? "selected=selected":""}>9층</option>
																	<option value="10" ${dto.floor=="10" ? "selected=selected":""}>10층</option>
																	<option value="11" ${dto.floor=="11" ? "selected=selected":""}>11층</option>
																	<option value="12" ${dto.floor=="12" ? "selected=selected":""}>12층</option>
																	<option value="13" ${dto.floor=="13" ? "selected=selected":""}>13층</option>
																	<option value="14" ${dto.floor=="14" ? "selected=selected":""}>14층</option>
																	<option value="15" ${dto.floor=="15" ? "selected=selected":""}>15층</option>
																	<option value="16" ${dto.floor=="16" ? "selected=selected":""}>16층</option>
																	<option value="17" ${dto.floor=="17" ? "selected=selected":""}>17층</option>
																	<option value="18" ${dto.floor=="18" ? "selected=selected":""}>18층</option>
																	<option value="19" ${dto.floor=="19" ? "selected=selected":""}>19층</option>
																	<option value="20" ${dto.floor=="20" ? "selected=selected":""}>20층</option>
																</select>
															<p class="unit" style="width: 85px;">㎡</p>
														</div>
													</div>
									          	</div>
								          	</div>
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex; width: 195px;">
								        					<p style="width:45px; margin-right: 34px;">주차</p>
															<input style="width: 14px;" type="radio" name="parking" value="1" ${dto.parking == "1" ? "checked=checked":""}><p style="width: 45px;">가능</p>
															<input style="width: 14px;" type="radio" name="parking" value="0" ${dto.parking == "0" ? "checked=checked":""}><p style="width: 45px;">없음</p>
														</div>
														<div class="sub" style="display: flex; width: 195px; margin-bottom: 1px;">
								        					<p style="width: 80px;">엘리베이터</p>
															<input style="width: 14px;" type="radio" name="elevator" value="1" ${dto.elevator == "1" ? "checked=checked":""}><p style="width: 45px;">있음</p>
															<input style="width: 14px;" type="radio" name="elevator" value="0" ${dto.elevator == "0" ? "checked=checked":""}><p style="width: 45px;">없음</p>
														</div>
													</div>
									          	</div>
								          	</div>
								          	<div class="dbox w-100 d-flex align-items-start" style="margin-bottom: 10px;">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<p style="width: 75px; margin-bottom: 1px;">양도가능일</p>
								        				<div class="sub" style="display: flex; width: 172px; margin-top: 2px;">
															<input style="width: 227px;" type="date" class="form-control" name="transDate" value="${dto.transDate}">
														</div>
													</div>
									          	</div>
								          	</div>
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<p style="width:125px; margin-bottom: 1px;">연락처</p>
								        				<div class="sub" style="display: flex; margin-top: 2px;">
								        					<select name="pNum1">
								        						<option value="010" ${dto.pNum1=="010" ? "selected='selected'":""}>010</option>
								        						<option value="02"  ${dto.pNum1=="02"  ? "selected='selected'":""}>02</option>
								        						<option value="011" ${dto.pNum1=="011" ? "selected='selected'":""}>011</option>
								        						<option value="016" ${dto.pNum1=="016" ? "selected='selected'":""}>016</option>
								        						<option value="017" ${dto.pNum1=="017" ? "selected='selected'":""}>017</option>
								        						<option value="018" ${dto.pNum1=="018" ? "selected='selected'":""}>018</option>
								        						<option value="019" ${dto.pNum1=="019" ? "selected='selected'":""}>019</option>
								        					</select> -
															<input style="width:63px;" type="text" class="form-control" name="pNum2" value="${dto.pNum2}"> -
															<input style="width:63px;" type="text" class="form-control" name="pNum3" value="${dto.pNum3}">
															
														</div>
													</div>
									          	</div>
								          	</div>
						          </div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" onclick="checkUp();" class="btn btn-primary">수정완료</button>
		      	</div>
			</form>
		</div>
      </div>
    </div>
  </div>
</div>


</body>
</html>