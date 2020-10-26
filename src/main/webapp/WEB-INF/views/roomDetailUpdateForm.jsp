<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h1>수정</h1>
		<form action="updateroomres.do" method="POST" id="typechange">
			<input type="hidden" value="${room.room_no }" name="room_no" />
			<!-- 가장 큰 div박스 -->
			<div class="updateroominfo">
				<div class="updateroomimg">
					<!-- for문 돌려서 이미지들 가져오기 -->
					<div class="updateroomimgdetail">
						<img alt="사진" src="resources/img/backgroundimg.jpg">
					</div>
				</div>
				<!-- 매물이름 div -->
				<div class="updateroomname">
					<span>매물이름</span>
					<span>
						<input type="text" value="${room.room_name }" name="room_name">
					</span>
				</div>
				<!-- 매물종류 div -->
				<div class="updateroomtype">
					<span>매물종류</span>
					<span>
						<select id="room_type" name="room_type">
							<option value="1">월세</option>
							<option value="2">전세</option>
							<option value="3">매매</option>
							<option value="4">반전세</option>
							<option value="5">단기임대</option>
						</select>
					</span>
				</div>
				<!-- 보증금 div -->
				<!-- price : 매물 가격 -->
				<!-- deposit : 보증금 -->
				<!-- 매매면 pirce만  -->
				<!-- 전세면 price만 -->
				<!-- 월세면 deposit가 보증금 / price가 월세 -->
				<!-- 반전세면 deposit가 보증금 / price가 월세 -->
				<!-- 단기임대면 deposit가 보증금 / price가 월세 -->
				<div class="updateroomdeposit">
					<span>보증금</span>
					<span>
						<input type="text" value="${room.room_deposit }" name="room_deposit">
					</span>
				</div>
				<!-- 매물 가격 div -->
				<!-- 매매, 전세 : price만 -->
				<!-- 월세, 반전세, 단기임대 : deposit랑 같이 출력 -->
				<div class="updateroomprice">
					<span>가격</span>
					<span>
						<input type="text" value="${room.room_price }" name="room_price">
					</span>
				</div>
				
				<!-- 매물면적 -->
				<div class="updateroomextent">
					<span>매물면적</span>
					<span>
						<input type="text" value="${room.room_extent }" name="room_extent">
					</span>
				</div>
				
				<!-- 매물주소 -->
				<div class="updateroomaddr">
					<span>매물주소</span>
					<span>
						<input type="text" value="${room.room_addr }" id="room_addr" name="room_addr" readonly="readonly" onclick="addrcheck();">
					</span>
				</div>
				<!-- 매물 건물종류 -->
				<div class="updateroomkind">
					<span>매물 건물 종류</span>
						<span>
							<select id="room_kind" name="room_kind">
								<option value="1">아파트</option>
								<option value="2">빌라</option>
								<option value="3">주택</option>
								<option value="4">오피스텔</option>
								<option value="5">상가사무실</option>
							</select>
						</span>
				</div>
				<!-- 매물구조 -->
				<div class="updateroomstructure">
					<span>매물 구조</span>
					<span>
						<select id="room_structure" name="room_structure">
							<option value="1">방 1개</option>
							<option value="2">방 2개</option>
							<option value="3">방 3개이상</option>
						</select>
					</span>
				</div>
				<!-- 매물 층수 -->
				<div class="updateroomfloor">
					<span>매물 층수</span>
					<span>
						<input type="text" value="${room.room_floor }" name="room_floor">
					</span>
				</div>
				<!-- 매물 등록 날짜 -->
				<div class="updateroomregdate">
					<span>매물 등록 날짜</span>
					<span>
						<input type="date" value="${room.room_regdate}" id="room_regdate" readonly="readonly" name="room_regdate">
					</span>
				</div>
				<!-- 매물 준공 날짜 -->
				<div class="updateroomcpdate">
					<span>매물 준공 날짜</span>
					<span>
						<input type="date" value="${room.room_cpdate}" id="room_cpdate" name="room_cpdate">
					</span>
				</div>
				<!-- 매물 입주 가능일 -->
				<div class="updateroomavdate">
					<span>매물 입주 가능일</span>
					<span>
						<input type="date" value="${room.room_avdate}" id="room_avdate" name="room_avdate">
					</span>
				</div>
				<!-- 매물 상세설명 -->
				<div class="updateroomdetail">
					<span>매물 상세설명</span>
					<span>
						<textarea rows="10" cols="60" class="summernote" name="room_detail">${room.room_detail }</textarea>
					</span>
				</div>
				<!-- form태그 안에서 submit버튼을 클릭하면 값 넘기기 -->
				<div class="updateroomsubmit">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location.href='detailroom.do?room_no=${room.room_no }'">
				</div>
			</div>
		</form>
		<div id="roommap"></div>
		<!-- KakaoMap -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6f2a4b2da3be8e7e22cff8692d2d202&libraries=services,clusterer,drawing"></script>
		<script type="text/javascript">
			// room_addr이라는 id를 가진 변경될 경우 함수 실행
			// 지도를 생성할 div를 지정
			var container = document.getElementById("roommap"),
			// 지도를 생성할 떄 필요한 기본 옵션
			options = {
				// 지도의 중심 좌표
				// LatLng : center에 넣을 위도와 경도를 생성해주는 class
				// 위도 : latitude / 경도 : longtidue
				center : new kakao.maps.LatLng(33.450701, 126.570667),
				// 지도의 레벨 (확대, 축소 정도)
				level : 3
			}
			// 지도 생성 및 객체 리턴
			var map = new kakao.maps.Map(container, options);

			// 마커가 지도 위에 표기되도록 설정
			var infowindow = new kakao.maps.InfoWindow({
				zindex : 1
			});
			// 주소를 위도와 경도로 변환시켜주는 객체
			var geocoder = new kakao.maps.services.Geocoder();
			// roadname을 가지고 room_addr값을 가져오기
			var roadname = '${room.room_addr}';
			
			// 주소로 좌표를 검색
			geocoder.addressSearch(roadname, function(result, status){
				// 정상적으로 검색이 완료되었을 경우
				if(status === kakao.maps.services.Status.OK){
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					// 마커에 대한 설정
					var imgSrc = "resources/img/pin.png",
						imgSize = new kakao.maps.Size(64,69),
						imgOption = {offset : new kakao.maps.Point(27,69)};
					
					var markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption);
					
					// 결과값으로 받은 위치를 마커로 표시
					var marker = new kakao.maps.Marker({
						position : coords,
						image : markerImg,
						map : map
					});
					// 지도 중심을 결과값의 위치로 이동
					map.setCenter(coords);
				}
			});
			
		</script>
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

<!-- summerNote.js -->
<script
	src="${pageContext.request.contextPath}/resources/js/summerNote.js"
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
