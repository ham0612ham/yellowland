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

<style>

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

article {
	font-family: Pretendard-Regular, sans-serif;
}

.detail-img {
	height: 300px;
}

.detail-list > div {
	margin-bottom: 30px;
	margin-left: 30px;
}

.back {
	position: absolute;
    top: -2px;
    left: -3px;
    width: 40px;
    z-index: 1;
    padding: 14px;
    cursor: pointer;
}

.carousel-control-prev {
    left: 0px;
    top: 70px;
}

.carousel-control-prev-icon {
	margin-top: -70px;
}

i {
	margin-right: 3px;
}

#subImg {
	display: flex;
    margin-left: -93px;
}

.img-flex {
	display: flex;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.img-flex .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	cursor: pointer;
}

</style>

<script type="text/javascript">


function backButton() {
	
	document.querySelector(".detail-view").style.display = "none";
	document.querySelector(".assign-ul").style.display = "block";
	
}

function deleteComm() {
	
	if(confirm(" 게시글을 삭제하시겠습니까 ? ")) {
		
		let url = "${pageContext.request.contextPath}/assignComm/delete?num=${dto.num}";
		location.href = url;
	}
	
}

// 메인 이미지
$(function() {
	let img = "${dto.thumbnail}";
	
	// 로컬에 이미지를 업로드 했다면
	if( img ) {
		// 메인이미지 로컬 저장 경로
		img = "${pageContext.request.contextPath}/uploads/image/" + img;
		
	} else {
		
		img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
		
	}
	
	// empty : 태그는 남기고 내용만 지움 
	$(".thumbnail-viewer").empty();
	$(".thumbnail-viewer").css("background-image", "url("+img+")");
	
	
	$(".thumbnail-viewer").click(function() {
		$("form[name=contactForm] input[name=thumbnailFile]").trigger("click");
	});
	
	// change : 값이 바뀔경우
	$("form[name=contactForm] input[name=thumbnailFile]").change(function() {
		
		let file = this.files[0];
		
		// 이미지 파일이 없을 경우
		if(! file) {
			$(".thumbnail-viewer").empty();
			
			if( img ) {
				
				if( img !== "${pageContext.request.contextPath}/resources/images/add_photo.png") {
					img = "${pageContext.request.contextPath}/uploads/image/" + img;
				}
				
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			
			$(".thumbnail-viewer").css("background-image", "url("+ img +")");
		
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
			$(".thumbnail-viewer").empty();
			$(".thumbnail-viewer").css("background-image", "url("+ e.target.result +")");
		};
		
		reader.readAsDataURL( file );
		
	});
	
});

// 추가 이미지
$(function() {
	
	let sel_files = [];
	let count = 0;
	
	$("body").on("click", ".img-add", function() {
		$("form[name=contactForm] input[name=imgFiles]").trigger("click");
	});
	
	$("form[name=contactForm] input[name=imgFiles]").change(function(){
		
		
		
		// 현재 고른  파일이 없다면
		if(! this.files) {
			let dt = new DataTransfer();
			
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			// 기존 저장된 파일들 다시 저장
			document.contactForm.imgFiles.files = dt.files;
			
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
			const $img = $("<img>", {"class":"item img-item"});
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
		
		document.contactForm.imgFiles.files = dt.files;
		
	});
	
	$("body").on("click", ".img-item", function() {
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
		
		document.contactForm.imgFiles.files = dt.files;
		
		$(this).remove();
		
		
	});
	
});

</script>

</head>
<body>

<!-- form Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상가 양도 작성 폼</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<div class="container">
	        	<form method="post" id="contactForm" name="contactForm" class="contactForm" enctype="multipart/form-data">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row no-gutters">
								<div style="margin-top: -20px;" class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
									<div class="contact-wrap w-100 p-md-5 p-4">
											<div class="row">
												<div class="row justify-content-center">
													<div class="col-md-6 text-center mb-5">
														<input type="text" class="form-control" name="subject" id="subject" placeholder="제목" value="${dto.subject}">
													</div>
												</div>
									          	<div style="margin-top: -25px; display: flex; margin-bottom: 13px;">
										          	<div class="col-md-6">
														<div class="form-group" id="mainImg">
															<label class="label" for="thumbnailFile">대표 이미지</label>
															<div class="thumbnail-viewer"></div>
															<input type="file" class="form-control" name="thumbnailFile" id="thumbnail" accept="image/*" 
																value="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}" style="display: none;">
														</div>
													</div>
													
													<c:if test="${mode=='update'}">
														<div class="col-md-10">
															<div class="form-group" id="subImg">
																<label class="label" for="imgName">추가 이미지</label>
															    <div class="img-flex">
															    	<c:forEach var="img" items="${imgList}">
															      		<img class="item img-add" src="${pageContext.request.contextPath}/uploads/image/${img.imgName}" class="d-block w-100">
															    	</c:forEach>
															    </div>
														    </div>
														</div>
														<input type="file" class="form-control" name="imgFiles" id="imgName" accept="image/*" multiple="multiple" 
																value="${pageContext.request.contextPath}/uploads/image/${dto.imgName}" style="display: none;">
													</c:if>
													<!-- 
													<div class="col-md-10">
														<div class="form-group" id="subImg">
															<label class="label" for="imgName">추가 이미지</label>
															<div class="img-flex">
																<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
															</div>
															<input type="file" class="form-control" name="imgFiles" id="imgName" accept="image/*" multiple="multiple" 
																value="${pageContext.request.contextPath}/uploads/image/${dto.imgName}" style="display: none;">
														</div>
													</div>
													-->
												</div>
									          	<p style="margin-bottom: 0; margin-left: 8px;">위치정보</p>
												<div class="col-md-6">
													<div class="form-group" style="display: flex;">
														<input type="text" class="form-control" name="zip" id="zip" placeholder="우편번호" value="${dto.zip}">
														<input class="btn btn-primary" style="margin-left: 3px;" type="button" value="우편번호찾기" onclick="kakaopost()">
													</div>
												</div>
												
												<div class="col-md-12">
													<div class="form-group">
														<input type="text" class="form-control" name="addr1" id="addr1" placeholder="기본 주소" value="${dto.addr1}">
													</div>
												</div>
												
												<div class="col-md-12">
													<div class="form-group">
														<input type="text" class="form-control" name="addr2" id="addr2" placeholder="상세 주소" value="${dto.addr2}">
													</div> 
												</div>
												
												<div class="col-md-12">
													<div style="margin-top: 10px;" class="form-group">
														<label class="label" for="editor" style="margin-left: 8px;">상세설명</label>
														<textarea name="content" class="form-control" id="editor" cols="30" rows="4"  
															placeholder="소개하고 싶은 상가에 대한 설명과 특징을 입력해주세요. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#13;&#10;
																		상가의 위치와 교통 및 주변 시설 등 전체적인 상가의 느낌 등을 작성해주세요.">${dto.content}</textarea>
													</div>
												</div>
												
											</div>
										<script>
									    	ClassicEditor.create( document.querySelector( '#editor' ) );
									    </script>
	
									</div>
								</div>
								<div class="col-lg-4 col-md-5 d-flex align-items-stretch">
									<div id="phone" class="info-wrap w-100 p-md-5 p-4">
							        	
								          	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 216px;">보증금</p>
															<input type="text" class="form-control" name="deposit" id="deposit" value="${dto.deposit}">
															<p class="unit" style="width: 85px;">만원</p>
														</div>
													</div>
									          	</div>
								          	</div>
								        	<div class="dbox w-100 d-flex align-items-start">
								        		<div class="icon d-flex align-items-center">
								        			<div class="col-md-6">
								        				<div class="sub" style="display: flex;">
								        					<p style="width: 216px;">월세</p>
															<input type="text" class="form-control" name="monthly" id="monthly" value="${dto.monthly}">
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
															<input type="text" class="form-control" name="expense" id="expense" value="${dto.expense}">
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
															<input type="text" class="form-control" name="area" id="area" value="${dto.area}">
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
																<select name="bFloor">
																	<option value="1" ${bFloor=="1" ? "selected='selected'":""}>1층</option>
																	<option value="2" ${bFloor=="2" ? "selected='selected'":""}>2층</option>
																	<option value="3" ${bFloor=="3" ? "selected='selected'":""}>3층</option>
																	<option value="4" ${bFloor=="4" ? "selected='selected'":""}>4층</option>
																	<option value="5" ${bFloor=="5" ? "selected='selected'":""}>5층</option>
																	<option value="6" ${bFloor=="6" ? "selected='selected'":""}>6층</option>
																	<option value="7" ${bFloor=="7" ? "selected='selected'":""}>7층</option>
																	<option value="8" ${bFloor=="8" ? "selected='selected'":""}>8층</option>
																	<option value="9" ${bFloor=="9" ? "selected='selected'":""}>9층</option>
																	<option value="10" ${bFloor=="10" ? "selected='selected'":""}>10층</option>
																	<option value="11" ${bFloor=="11" ? "selected='selected'":""}>11층</option>
																	<option value="12" ${bFloor=="12" ? "selected='selected'":""}>12층</option>
																	<option value="13" ${bFloor=="13" ? "selected='selected'":""}>13층</option>
																	<option value="14" ${bFloor=="14" ? "selected='selected'":""}>14층</option>
																	<option value="15" ${bFloor=="15" ? "selected='selected'":""}>15층</option>
																	<option value="16" ${bFloor=="16" ? "selected='selected'":""}>16층</option>
																	<option value="17" ${bFloor=="17" ? "selected='selected'":""}>17층</option>
																	<option value="18" ${bFloor=="18" ? "selected='selected'":""}>18층</option>
																	<option value="19" ${bFloor=="19" ? "selected='selected'":""}>19층</option>
																	<option value="20" ${bFloor=="20" ? "selected='selected'":""}>20층</option>
																</select>
															<p class="unit" style="width: 85px;">㎡</p>
														</div>
														<div class="sub" style="display: flex;">
								        					<p style="width:211px;">해당 층</p>
																<select name="floor">
																	<option value="1" ${floor=="1" ? "selected=selected":""}>1층</option>
																	<option value="2" ${floor=="2" ? "selected=selected":""}>2층</option>
																	<option value="3" ${floor=="3" ? "selected=selected":""}>3층</option>
																	<option value="4" ${floor=="4" ? "selected=selected":""}>4층</option>
																	<option value="5" ${floor=="5" ? "selected=selected":""}>5층</option>
																	<option value="6" ${floor=="6" ? "selected=selected":""}>6층</option>
																	<option value="7" ${floor=="7" ? "selected=selected":""}>7층</option>
																	<option value="8" ${floor=="8" ? "selected=selected":""}>8층</option>
																	<option value="9" ${floor=="9" ? "selected=selected":""}>9층</option>
																	<option value="10" ${floor=="10" ? "selected=selected":""}>10층</option>
																	<option value="11" ${floor=="11" ? "selected=selected":""}>11층</option>
																	<option value="12" ${floor=="12" ? "selected=selected":""}>12층</option>
																	<option value="13" ${floor=="13" ? "selected=selected":""}>13층</option>
																	<option value="14" ${floor=="14" ? "selected=selected":""}>14층</option>
																	<option value="15" ${floor=="15" ? "selected=selected":""}>15층</option>
																	<option value="16" ${floor=="16" ? "selected=selected":""}>16층</option>
																	<option value="17" ${floor=="17" ? "selected=selected":""}>17층</option>
																	<option value="18" ${floor=="18" ? "selected=selected":""}>18층</option>
																	<option value="19" ${floor=="19" ? "selected=selected":""}>19층</option>
																	<option value="20" ${floor=="20" ? "selected=selected":""}>20층</option>
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
								        						<option value="010" ${pNum1=="010" ? "selected='selected'":""}>010</option>
								        						<option value="02"  ${pNum1=="02"  ? "selected='selected'":""}>02</option>
								        						<option value="011" ${pNum1=="011" ? "selected='selected'":""}>011</option>
								        						<option value="016" ${pNum1=="016" ? "selected='selected'":""}>016</option>
								        						<option value="017" ${pNum1=="017" ? "selected='selected'":""}>017</option>
								        						<option value="018" ${pNum1=="018" ? "selected='selected'":""}>018</option>
								        						<option value="019" ${pNum1=="019" ? "selected='selected'":""}>019</option>
								        					</select> -
															<input style="width:63px;" type="text" class="form-control" name="pNum2" value="${dto.pNum2}"> -
															<input style="width:63px;" type="text" class="form-control" name="pNum3" value="${dto.pNum3}">
															<c:if test="${mode == 'update'}">
																<input type="hidden" name="num" value="${dto.num}">
																 
															</c:if>
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
			        <button type="button" onclick="check();" class="btn btn-primary">작성완료</button>
		      	</div>
			</form>
		</div>
      </div>
    </div>
  </div>
</div>

<article>
	<div class="detail-view">
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		    <div class="carousel-inner">
		    	<img class="back" onclick="backButton();" src="${pageContext.request.contextPath}/resources/images/back.png">
		    	<div class="carousel-item active">
			      	<img class="detail-img" src="${pageContext.request.contextPath}/uploads/image/${dto.thumbnail}" class="d-block w-100">
			    </div>
				<c:forEach var="img" items="${imgList}">
				    <div class="carousel-item active">
				      	<img class="detail-img" src="${pageContext.request.contextPath}/uploads/image/${img.imgName}" class="d-block w-100">
				    </div>	
				</c:forEach>
		    </div>
		    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
		    </button>
		    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
		    </button>
		</div>
		<br>
		
		<div style="display: flex; justify-content: flex-end;">
			<c:if test="${sessionScope.member.userId == dto.userId}">
				<li class="my-button"><button type="button" data-bs-toggle="modal"
					data-bs-target="#exampleModal" class="btn btn-primary"><i class="fa-regular fa-pen-to-square"></i></button></li>
				<li class="my-button" style="margin-left: 5px; margin-right: 5px;"><button type="button" onclick="deleteComm();" class="btn btn-primary"><i class="fa-regular fa-trash-can"></i></button></li>
			</c:if>
		</div>
		
		<div class="detail-list">
			<div style="display: flex;">
				<div>등록번호 ${dto.num}</div>
				<div>${dto.regDate}</div>
			</div>
			<div><i class="fa-regular fa-building"></i> ${dto.addr1}</div>
			<div><i class="fa-solid fa-building"></i> ${dto.addr2}</div>
			<div><i class="fa-solid fa-coins"></i> 월세 ${dto.deposit}/${dto.monthly}</div>
			<div><i class="fa-solid fa-plug"></i> 관리비 ${dto.expense}만원</div>
			<div><i class="fa-regular fa-comment"></i> ${dto.subject}</div>
			
			<div><i class="fa-solid fa-vector-square"></i> 전용 ${dto.area}㎡</div>
			<div><i class="fa-solid fa-square-parking"></i> ${dto.parking == 1 ? "주차 가능" : "주차 불가능"}</div>
			<div><i class="fa-solid fa-elevator"></i> ${dto.elevator == 1 ? "엘리베이터 있음 " : "엘리베이터 없음"}</div>
			<div><i class="fa-solid fa-florin-sign"></i> ${dto.floor}층/${dto.bFloor}층</div>
			<div><i class="fa-regular fa-calendar"></i> 입주 가능일 : ${dto.transDate}</div>
			<div>
				<div><i class="fa-solid fa-comment"></i> 상세 설명</div>
				<div>${dto.content}</div>
			</div>
			<div>
				<div><i class="fa-solid fa-location-dot"></i> 위치</div>
				<div>우편번호 또는 기본 주소를 통한 위치 표시하기</div>
			</div>
		</div>
		
	</div>
</article>

</body>
</html>