<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 매물 수정하기</title>

<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<section>
		<form action="updateroomres.do" id="plusfilepath" method="POST"
			enctype='multipart/form-data'>
			<input class="update-input" type="hidden" value="${room.room_no}"
				name="room_no">
			<!-- 가장 큰 div박스 -->
			<div class="update-container">
				<div class="update-title">
					<h1>매물 수정하기</h1>
				</div>
				<!-- 이미지를 담아줄 div -->
				<div class="update-image">
					<div class="update-image-detail">
						<a href="javascript:leftimg();"> <img class="leftarrow" alt="왼쪽화살표"
							src="resources/img/arrowleft.png">
						</a> 
						
						<a href="javascript:rightimg();"> <img class="rightarrow" alt="오른쪽화살표"
							src="resources/img/arrowright.png">
						</a>
					</div>
				</div>
				<!-- 수정할 방정보를 담아줄 div -->
				<div class="update-content">
					<div class="update-content-detail">
						<div class="update-content-detail-title">매물 이름</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="text"
								value="${room.room_name }" name="room_name">
						</div>
					</div>
					<div class="update-content-detail">
						<div class="update-content-detail-title">매물 종류</div>
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
						<div class="update-content-detail-title">보증금(만원)</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="text"
								value="${room.room_deposit }" name="room_deposit"
								placeholder="숫자만 입력해주세요.">
						</div>
					</div>

					<div class="update-content-detail">
						<div class="update-content-detail-title">매물 가격(만원)</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="text"
								value="${room.room_price }" name="room_price"
								placeholder="숫자만 입력해주세요.">
						</div>
					</div>

					<div class="update-content-detail">
						<div class="update-content-detail-title">매물 면적(㎡)</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="text"
								value="${room.room_extent }" name="room_extent"
								placeholder="숫자만 입력해주세요.">
						</div>
					</div>

					<div class="update-content-detail">
						<div class="update-content-detail-title">매물 주소</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="text"
								value="${room.room_addr }" id="room_addr" class="room_addr"
								name="room_addr" readonly="readonly" onclick="addrcheck();">
						</div>
					</div>
					<div class="update-content-detail">
						<div class="update-content-detail-title">건물 종류</div>
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
						<div class="update-content-detail-title">매물 구조</div>
						<div class="update-content-detail-content">
							<select id="room_structure" name="room_structure">
								<option value="1">방 1개</option>
								<option value="2">방 2개</option>
								<option value="3">방 3개이상</option>
							</select>
						</div>
					</div>

					<div class="update-content-detail">
						<div class="update-content-detail-title">매물 층수</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="text"
								value="${room.room_floor }" name="room_floor"
								placeholder="숫자만 입력해주세요.">층
						</div>
					</div>

					<div class="update-content-detail">
						<div class="update-content-detail-title">매물 등록 날짜</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="date"
								value="${room.room_regdate}" id="room_regdate"
								readonly="readonly" name="room_regdate">
						</div>
					</div>

					<div class="update-content-detail">
						<div class="update-content-detail-title">매물 준공 날짜</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="date"
								value="${room.room_cpdate}" id="room_cpdate" name="room_cpdate">
						</div>
					</div>

					<div class="update-content-detail">
						<div class="update-content-detail-title">입주 가능 날짜</div>
						<div class="update-content-detail-content">
							<input class="update-input" type="date"
								value="${room.room_avdate}" id="room_avdate" name="room_avdate">
						</div>
					</div>
				</div>
				<div class="update-content-two">
					<div class="update-content-detail-summernote">
						<div class="update-content-detail-title-summernote">매물 상세정보
						</div>
						<div class="update-content-detail-content-summernote">
							<textarea class="summernote" name="room_detail">${room.room_detail }</textarea>
						</div>
					</div>
				</div>
				<!-- 여러 파일을 올릴 때 , 로 구분해서 update해주기 위한 태그 -->
				<input type="hidden" id="room_photo" name="room_photo" value="" />

				<!-- 지도 넣을 자리 -->

				<!-- submit button -->
				<div class="update-room-submit">
					<input class="submitbtn" type="submit" value="수정"> <input
						class="submitbtn" type="button" value="취소"
						onclick="location.href='detailroom.do?room_no=${room.room_no }'">
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
	//매물 거래 종류를 선언 => 전세,월세,매매,반전세,단기임대
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
		
		
//--------------------submit이 실행 되기 직전에 파일업로드 한 모든 src를 가져와서 더해준 다음에 배열에서 String형태로 바꿔서 DB에 저장--------------------
		$("#plusfilepath").submit(function() {
			alert("sumbit하기 전 실행되는 함수 시작 !");
			// room_photos라는 변수에  room_photo라는 class를 가진 모든 애들을 담아준다.
			var room_photos = document.getElementsByClassName('room_photo');
			// 배열 생성
			var array = new Array();
			// 썸머노트에서 파일 2개 올리면 room_photo라는 class이름으로 input 태그에 value가 채워진다.
			// 이를 모드 room_photos에 담아주고, 그것의 length를 뽑아주면 2가 뽑힘.

			// room_photos의 length까지 for문을 돌려주는데
			for (var i = 0; i < room_photos.length; i++) {
				// array의 0번지부터 , room_photos의 0번지부터 마지막번지까지의 value를 담아준다.
				array[i] = room_photos[i].value;
			}

			var realroomphoto = array.join(',');

			// 배열을 string으로 바꾼 값을 room_photo라는 태그에 넣어준다.
			$("#room_photo").val(realroomphoto);

			return true;
		})

// ---------------------시작하자마자 room_photo의 값을 가져와서 잘라주기 위해-----------------------
		$(function() {
			// 디테일을 보여줄 때 넘어오는 room_photo의 값을 변수에 담아주고
			var room_photo_src = '${room.room_photo}';

			// 그 변수를 ,를 기준으로 split해서 배열에 담아준다.
			var room_photo_src_split = room_photo_src.split(',');

			$('.update-image-detail')
					.append(
							"<img alt='DB에서 가져온 사진' class='room-image'/>");
				$('.room-image').attr("src", room_photo_src_split[0]);
		})
	})
	
// ------------------- 화살표 누르기 ----------------------------------------
	
	// "파일이름, 파일이름"
		var room_photo_src = '${room.room_photo}';
		
		// room_photo_src_split[0] = 파일이름
		// room_photo_src_split[1] = 파일이름
		var room_photo_src_split = room_photo_src.split(',');
		// 2개를 올렸으면 : 0, 1
		
		// 2개의 파일을 올렸으면 2
		var i = room_photo_src_split.length - 1; // : 1
		var j = 0;
		
		var k = 0;
		
		// 왼쪽 화살표 누르면 넘어가는 함수
		function leftimg(){
			// detail에서 넘어온 값을 그대로 넘겨주기 위해.
			// 사진을 다시 올리기 전에 실행
			if(document.getElementsByClassName("room-image").length > 0){
				--j;
				if(j < 0){
					j = 0;
				} else {
					$('.room-image').attr("src", room_photo_src_split[j]);
				}
			// 사진을 다시 올리고 난 후에 실행
			} else {
				var array = new Array();
				
				var b = $('.room_image');
				
				--k;
				if(k < 0){
					k = 0;
					alert("좌클릭 : " + k);
				} else {
					$('.' + String(k)).show();
					$('.' + String(k-1)).hide();
					$('.' + String(k+1)).hide();
				}
			}
		}
		
		// 오른쪽 화살표 눌면 넘어가는 함수
		function rightimg(){
			// 다시 올릴 사진을 올리기 전에 실행한다.
			if(document.getElementsByClassName("room-image").length > 0){
				++j;
				if(j > i){
					j = room_photo_src_split.length - 1;
				} else {
					$('.room-image').attr("src", room_photo_src_split[j]);
				}
			// 다시 올릴 사진을 올리고 난 후에 실행한다.	
			} else {
				var array = new Array();
				
				var b = $('.room_image');
				
				++k;
				if(k > b.length -1){
					k = b.length - 1;
					alert("우클릭 : " + k);
				} else {
					$('.' + String(k)).show();
					$('.' + String(k-1)).hide();
					$('.' + String(k+1)).hide();
				}
			}
		}
	

// --------------------------------------썸머노트----------------------------------------------
	$(document)
			.ready(
					function() {
						//$('#summernote').val("${board_data.BOARD_CONTENT}");
						$('.summernote')
								.summernote(
										{
											placeholder : '???',
											minHeight : 370,
											maxHeight : 370,
											focus : true,
											lang : 'ko-KR',
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ],
											callbacks : {
												onImageUpload : function(files,
														editor, welEditable) {
													for (var i = files.length - 1; i >= 0; i--) {
														sendFile(files[i], this);
														console.log("첫번째로 들어오는 곳");
													}
												}
											}
										});
					});

	var cnt = 0;

	function sendFile(file, editor) {
		$(".room-image").remove();
		$(".room_image").remove();
		$(".room_photo").remove();
		var data = new FormData();
		// 파일을 보낸다.
		data.append("file", file);
		data.append("room_id", '${room.room_id}');

			$.ajax({
					data : data,
					type : "POST",
					url : "fileupload.do",
					cache : false,
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(img_name) { 
						//alert(cnt);
						//alert(img_name); // 여기 잘 넘어옴
						//$(".roomimg").attr("src", img_name);

						// image라는 변수에다가 img태그를 만들고 src를 준다.
						var image = $("<img>").attr("src", img_name); //img_name : resources/rgusqls@naver.com/homeseekimg.jsp
						image.attr("alt", "업로드  할 사진입니다.");
						// 클래스 추가
						image.addClass('room_image ' + cnt);
						// 올리는 모든 사진들을 hide해준다.
						image.css("display", "none");
						// <img class="room_image" src="resources/rgusqls@naver.com/사진.jpg">
						//var image = $("<img>").attr("src", img_name);

						// 이미지태그가 content가 박히는 명령어
						//$('.summernote').summernote('insertNode', image[0]);
						// update-image-detail에 image를 append

						$('.update-image-detail').append(image[0]);
						// 대신 첫번쨰에 있는 사진만 show
						$('.room_image').eq(0).show();
						// 파일이 추가될때마다 input 태그가 생성된다.
						// 즉 3개가 추가되면 input 태그은 3개가 된다.
						$('.update-content-two')
								.append(
										"<input class='room_photo "+cnt+"' type='hidden' value=''/>");
						// 위에서 만든 input 태그에 class를 지정해줘서 거기의 value를 넣어준다.
						$('.' + String(cnt)).val(img_name);
						//document.getElementById("room_photo").value = img_name;
						cnt++;
						console.log("3번째로 들어오는곳");
						// 전역변수 k를 0으로 초기화
					},
					error : function() {
						alert("실패");
					}
				});
	}

	
</script>

</html>
