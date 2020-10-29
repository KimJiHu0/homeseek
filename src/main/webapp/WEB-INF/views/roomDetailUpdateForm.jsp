<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 매물 수정하기</title>
</head>
<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<section>
		<form action="updateroomres.do" method="POST" enctype='multipart/form-data'>
		    <input class="update-input" type="hidden" value="${room.room_no}" name="room_no">
		    <!-- 가장 큰 div박스 -->
		    <div class="update-container">
		    	<div class="update-title">
		    		<h1>매물 수정하기</h1>
		    	</div>
		        <!-- 이미지를 담아줄 div -->
		        <div class="update-image">
		            <div class="update-image-detail">
		           		<a href="#">
		            		<img class="leftarrow" alt="왼쪽화살표" src="resources/img/arrowleft.png">
		            	</a>
		                	<img class="room-image" alt="가져온 이미지들" src="resources/img/backgroundimg.jpg">
		                <a href="#">
		                	<img class="rightarrow" alt="오른쪽화살표" src="resources/img/arrowright.png">
		            	</a>
		            </div>
		        </div>
		        <!-- 수정할 방정보를 담아줄 div -->
		        <div class="update-content">
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 이름
		                </div>
		                <div class="update-content-detail-content">
		                    <input class="update-input" type="text" value="${room.room_name }" name="room_name">
		                </div>
		            </div>
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 종류
		                </div>
		                <div class="update-content-detail-content">
		                	<select id="room_type" name="room_type">
								<option value="1">월세</option>
								<option value="2">전세</option>
								<option value="3">매매</option>
								<option value="4">반전세</option>
								<option value="5">단기임대</option>
							</select>
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    보증금(만원)
		                </div>
		                <div class="update-content-detail-content">
		                	<input class="update-input" type="text" value="${room.room_deposit }" name="room_deposit" placeholder="숫자만 입력해주세요.">
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 가격(만원)
		                </div>
		                <div class="update-content-detail-content">
		                	<input class="update-input" type="text" value="${room.room_price }" name="room_price" placeholder="숫자만 입력해주세요.">
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 면적(㎡)
		                </div>
		                <div class="update-content-detail-content">
		                	<input class="update-input" type="text" value="${room.room_extent }" name="room_extent" placeholder="숫자만 입력해주세요.">
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 주소
		                </div>
		                <div class="update-content-detail-content">
		                	<input class="update-input" type="text" value="${room.room_addr }" id="room_addr" class="room_addr" name="room_addr" readonly="readonly" onclick="addrcheck();">
		                </div>
		            </div>
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    건물 종류
		                </div>
		                <div class="update-content-detail-content">
		                	<select id="room_kind" name="room_kind">
								<option value="1">아파트</option>
								<option value="2">빌라</option>
								<option value="3">주택</option>
								<option value="4">오피스텔</option>
								<option value="5">상가사무실</option>
							</select>
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 구조
		                </div>
		                <div class="update-content-detail-content">
		                	<select id="room_structure" name="room_structure">
								<option value="1">방 1개</option>
								<option value="2">방 2개</option>
								<option value="3">방 3개이상</option>
							</select>
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 층수
		                </div>
		                <div class="update-content-detail-content">
		                	<input class="update-input" type="text" value="${room.room_floor }" name="room_floor" placeholder="숫자만 입력해주세요.">층
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 등록 날짜
		                </div>
		                <div class="update-content-detail-content">
		                	<input class="update-input" type="date" value="${room.room_regdate}" id="room_regdate" readonly="readonly" name="room_regdate">
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    매물 준공 날짜
		                </div>
		                <div class="update-content-detail-content">
		                	<input class="update-input" type="date" value="${room.room_cpdate}" id="room_cpdate" name="room_cpdate">
		                </div>
		            </div>
		            
		            <div class="update-content-detail">
		                <div class="update-content-detail-title">
		                    입주 가능 날짜
		                </div>
		                <div class="update-content-detail-content">
		                	<input class="update-input" type="date" value="${room.room_avdate}" id="room_avdate" name="room_avdate">
		                </div>
		            </div>
		        </div>
				<div class="update-content-two">		            
		            <div class="update-content-detail-summernote">
		                <div class="update-content-detail-title-summernote">
		                    매물 상세정보
		                </div>
		                <div class="update-content-detail-content-summernote">
		                	<textarea class="summernote" name="room_detail">${room.room_detail }</textarea>
		                </div>
		            </div>
		        </div>
		        <!-- summernote -->
		        <script type="text/javascript">
		        
		        $(document).ready(function() {
		       	 //$('#summernote').val("${board_data.BOARD_CONTENT}");
		            $('.summernote').summernote({
		                  placeholder: '???',
		                  minHeight: 370,
		                  maxHeight: 370,
		                  focus: true, 
		                  lang : 'ko-KR',
		                  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		                  callbacks : {
		               	   onImageUpload : function(files, editor, welEditable){
		               		for (var i = files.length - 1; i >= 0; i--) {
				            	sendFile(files[i], this);
				            }
		               	 }
		              }
		          });
		       });

		       function sendFile(file, editor){
		       	var data = new FormData();
		       	data.append("file", file);
		       	data.append("room_no", ${room.room_no}),
		       	$.ajax({
		       		data : data,
		       		type : "POST",
		       		url : "fileupload.do",
		       		cache : false,
		       		contentType : false,
		       		enctype : 'multipart/form-data',
		       		processData : false,
		       		success : function(img_name){
		       			alert(img_name);
		       			var image =$("<img>").attr("src",img_name);
		       			$('.summernote').summernote('insertNode', image[0]);
		       			document.getElementById("room_photo").value = img_name;
		       		},
		       		error : function(){
		       			alert("실패");
		       		}
		       	});
		       }
		        
		        </script>
		        <!-- 지도 넣을 자리 -->
		        
		        <!-- submit button -->
		        <div class="update-room-submit">
					<input class="submitbtn" type="submit" value="수정">
					<input class="submitbtn" type="button" value="취소" onclick="location.href='detailroom.do?room_no=${room.room_no }'">
				</div>
		    </div>
		</form>		
	</section>

	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<!-- 도로명주소API js -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/loadAddress.js"
	type="text/javascript"></script>



<!-- roomDetailUpdateForm에 대한 CSS 스크립트 선언 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/roomDetailUpdateForm.css"
	type="text/css" />


<script type="text/javascript">
	// 매물 거래 종류를 선언 => 전세,월세,매매,반전세,단기임대
	var room_type = "${room.room_type}";
	// 매물 종류 => 아파트, 빌라, 주택, 오피스텔, 상가사무실
	var room_kind = "${room.room_kind}";
	// 매물 방 구조 => 방1개, 방2개, 방3개 이상
	var room_structure = "${room.room_structure}";

	$(function() {

		// 매물 종류 selected 조건문
		// room_type가 1 = 월세 / 2 = 전세 / 3 = 매매 / 4 = 반전세 / 5 = 단기임대 
		if (room_type == 1) {
			$("#room_type option[value=1]").prop('selected', 'selected')
					.change();
		} else if (room_type == 2) {
			$("#room_type option[value=2]").prop('selected', 'selected')
					.change();
		} else if (room_type == 3) {
			$("#room_type option[value=3]").prop('selected', 'selected')
					.change();
		} else if (room_type == 4) {
			$("#room_type option[value=4]").prop('selected', 'selected')
					.change();
		} else if (room_type == 5) {
			$("#room_type option[value=5]").prop('selected', 'selected')
					.change();
		}
		// 매물 종류 selected 조건문

		if (room_kind == 1) {
			$("#room_kind option[value=1]").prop('selected', 'selected')
					.change();
		} else if (room_kind == 2) {
			$("#room_kind option[value=2]").prop('selected', 'selected')
					.change();
		} else if (room_kind == 3) {
			$("#room_kind option[value=3]").prop('selected', 'selected')
					.change();
		} else if (room_kind == 4) {
			$("#room_kind option[value=4]").prop('selected', 'selected')
					.change();
		} else if (room_kind == 5) {
			$("#room_kind option[value=5]").prop('selected', 'selected')
					.change();
		}
		// 매물 방 구조 selected 조건문
		if (room_structure == 1) {
			$("#room_structure option[value=1]").prop('selected', 'selected')
					.change();
		} else if (room_structure == 2) {
			$("#room_structure option[value=2]").prop('selected', 'selected')
					.change();
		} else if (room_structure == 3) {
			$("#room_structure option[value=3]").prop('selected', 'selected')
					.change();
		}
	})
</script>
</html>
