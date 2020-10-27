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
<!-- roomDetailUpdateForm에 대한 CSS 스크립트 선언 / KakaoMap때문에. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/roomDetailUpdateForm.css"
	type="text/css" />
</head>
<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<section>
		<form action="updateroomres.do" method="POST">
    <input type="hidden" value="${room.room_no}" name="room_no">
    <!-- 가장 큰 div박스 -->
    <div class="update-container">
        <!-- 이미지를 담아줄 div -->
        <div class="updateroom-img">
            <div class="updateroomimgdetail">
                <img class="room-img" alt="가져온 이미지들" src="resources/img/backgroundimg.jpg">
            </div>
        </div>
        <!-- 수정할 방정보를 담아줄 div -->
        <div class="update-content">
            <div class="update-content-detail">
                <div class="update-content-detail-title">
                    매물 이름
                </div>
                <div class="update-content-detail-content">
                    <input type="text" value="${room.room_name }" name="room_name">
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
                	<input type="text" value="${room.room_deposit }" name="room_deposit">
                </div>
            </div>
            
            <div class="update-content-detail">
                <div class="update-content-detail-title">
                    매물 가격(만원)
                </div>
                <div class="update-content-detail-content">
                	<input type="text" value="${room.room_price }" name="room_price">
                </div>
            </div>
            
            <div class="update-content-detail">
                <div class="update-content-detail-title">
                    매물 면적(㎡)
                </div>
                <div class="update-content-detail-content">
                	<input type="text" value="${room.room_extent }" name="room_extent">
                </div>
            </div>
            
            <div class="update-content-detail">
                <div class="update-content-detail-title">
                    매물 주소
                </div>
                <div class="update-content-detail-content">
                	<input type="text" value="${room.room_addr }" id="room_addr" class="room_addr" name="room_addr" readonly="readonly" onclick="addrcheck();">
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
                	<input type="text" value="${room.room_floor }" name="room_floor">
                </div>
            </div>
            
            <div class="update-content-detail">
                <div class="update-content-detail-title">
                    매물 등록 날짜
                </div>
                <div class="update-content-detail-content">
                	<input type="date" value="${room.room_regdate}" id="room_regdate" readonly="readonly" name="room_regdate">
                </div>
            </div>
            
            <div class="update-content-detail">
                <div class="update-content-detail-title">
                    매물 준공 날짜
                </div>
                <div class="update-content-detail-content">
                	<input type="date" value="${room.room_cpdate}" id="room_cpdate" name="room_cpdate">
                </div>
            </div>
            
            <div class="update-content-detail">
                <div class="update-content-detail-title">
                    입주 가능 날짜
                </div>
                <div class="update-content-detail-content">
                	<input type="date" value="${room.room_avdate}" id="room_avdate" name="room_avdate">
                </div>
            </div>
            
            <div class="update-content-detail">
                <div class="update-content-detail-title">
                    매물 상세정보
                </div>
                <div class="update-content-detail-content">
                	<textarea rows="10" cols="60" class="summernote" name="room_detail">${room.room_detail }</textarea>
                </div>
            </div>
        </div>
        <div id="roomkakaomap"></div>
        <div id = "display"></div>
            
		<!-- KakaoMap -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6f2a4b2da3be8e7e22cff8692d2d202&libraries=services,clusterer,drawing"></script>
		<script type="text/javascript">
		
				// room_addr이라는 id를 가진 변경될 경우 함수 실행
				// 지도를 생성할 div를 지정
				var container = document.getElementById("roomkakaomap");
				// 지도를 생성할 떄 필요한 기본 옵션
				var options = {
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
				var roadname = $("#room_addr").val();
				
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
        
        <!-- submit button -->
        <div class="updateroomsubmit">
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="location.href='detailroom.do?room_no=${room.room_no }'">
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
