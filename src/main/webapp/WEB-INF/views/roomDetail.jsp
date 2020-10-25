<%@page import="com.mvc.homeseek.model.dto.RoomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 매물 상세보기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomDetail.css" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/roomDetail.js" type="text/javascript"></script>
	
<!-- alert띄우기 위한 스크립트 -->
<script type="text/javascript">
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
	
	/* roomDetail에서 신고버튼을 누르면 실행되는 함수 */
	function reportUser(){
		var room_id = "${member.member_id}";
		open("reportmember.do?room_id=" + room_id, "", "width=750, height=750");
	}
</script>
</head>
<body>
	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>
	<section>
		<!-- first container -->
		<div id="firstcontainer">
			<!-- 방 사진들을 담고있는 div박스 -->
			<div id="imgcontainer">

				<!-- 방 사진 정보 -->
				<div id="roomimg">
					<a href="#">
						<img alt="d" src="resources/img/arrowleft.png" id="leftarrow" class="arrow">
					</a>
					<a href="#">
						<img alt="d" src="resources/img/arrowright.png" id="rightarrow" class="arrow">
					</a>
				</div>
			</div>

			<!-- 방 올린 유저 정보를 담는 큰 div -->
			<div id="userinfocontainer">
				<div id="userinfodetail">
					<div id="userinfotitle">
						<span id="leftb">사용자 / 매물 정보</span><span id="rightb">찜하기♥</span>
					</div>
					<%
						RoomDto room = (RoomDto)request.getAttribute("room");
					
						// ROOM_TYPE가 매매일 경우에는 매매이기 때문에 ROOM_PRICE만 보여주고
						if(room.getRoom_type().equals("3")){
					%>
						<div class="roominfocontent">
							<span class="leftb">매물 종류</span>
							<span class="rightb">매매</span>
						</div>
						<div class="roominfocontent">
							<span class="leftb">매매가</span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						// 그게 아니라 전세일 경우에는 ROOM_PRICE와 젠세가로 ROOM_DEPOSIT를 보여준다.
						} else if(room.getRoom_type().equals("2")){
					%>
						<div class="roominfocontent">
							<span class="leftb">매물</span>
							<span class="rightb">전세</span>
						</div>
						<div class="roominfocontent">
							<span class="leftb">전세가 </span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						// 월세,4,5일 경우에는 둘 다 보여준다.
						} else if(room.getRoom_type().equals("1")){
					%>
						<div class="roominfocontent">
							<span class="leftb">매물</span>
							<span class="rightb">월세</span>
						</div>
						<div class="roominfocontent">
							<span class="leftb">보증금</span>
							<span class="rightb">${room.room_deposit }만원</span>
						</div>
						<div class="roominfocontent">
							<span class="leftb">월세가</span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						// 반전세인 경우(월세인데 보증금을 더 내고 월세를 줄인다.)
						} else if(room.getRoom_type().equals("4")){
					%>
						<div class="roominfocontent">
							<span class="leftb">매물</span>
							<span class="rightb">반전세</span>
						</div>
						<div class="roominfocontent">
							<span class="leftb">보증금</span>
							<span class="rightb">${room.room_deposit }만원</span>
						</div>
						<div class="roominfocontent" >
							<span class="leftb">월세가</span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						} else {
					%>
						<div class="roominfocontent">
							<span class="leftb">매물</span>
							<span class="rightb">단기임대</span>
						</div>
						<div class="roominfocontent">
							<span class="leftb">보증금 : </span>
							<span class="rightb">${room.room_deposit }만원</span>
						</div>
						<div class="roominfocontent">
							<span class="leftb">월세가 : </span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						}
					%>
					
					<div class="userinfocontent">
						<span class="leftb">ID / NAME : </span><span class="rightb">${member.member_name }(${member.member_id })</span>
					</div>
					<div class="userinfocontent">
						<span class="leftb"><a href="javascript:reportUser()" id="reportbtn">신고</a></span><span class="rightb"><a href="#" id="commentbtn">쪽지</a></span>
					</div>
					<div class="userinfocontent">
						<span class="leftb">Phone : </span><span class="rightb">${member.member_phone }</span>
					</div>
					<div class="userinfocontent">
						<span class="leftb"></span><span class="rightb"></span>
					</div>
				</div>
			</div>
		</div>
		
		<!-- second container -->
		
		<div id="noticeinfo">
			<span>
				안전한 거래를 위해 필요한 서류를 <b>꼭</b> 참고해주세요.
				<a href="#">공지사항 바로가기</a>
			</span>
		</div>
		<div id="recommendinfo">
			<span>
				추천 알고리즘 사용하기
			</span>
		</div>
		
		<div id="roommap"></div>
		<!-- kakaoMap을 쓰기위한 스크립트 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6f2a4b2da3be8e7e22cff8692d2d202&libraries=services,clusterer,drawing"></script>
		<script type="text/javascript">
		//-------------------------지도쓰기-----------------------//
		// roommap이라는 div를 container이라는 변수에 담아주기. [실제로 map이 담길 div]
		var container = document.getElementById("roommap");
		// 지도를 생성할 때 필요한 기본 옵션
		var options = {
			// 지도의 중심좌표
			// LatLng : center에 넣을 위도와 경도를 생성해주는 클래스
			// 위도(latitude) / 경도(longitude)
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			// 지도의 레벨(확대, 축소 정도)
			level : 3
		}
		
		// 지도 생성 및 객체 리턴
		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치${room.room_longi } / ${room.room_lati }
		var markerPosition = new kakao.maps.LatLng($("#room_longi").val(), $("#room_lati").val());
		var imgSrc = "resources/img/pin.png",
			imgSize = new kakao.maps.Size(64,69),
			imgOption = {offset : new kakao.maps.Point(27,69)};
		
		var markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption);
		
		// 마커 생성
		var marker1 = new kakao.maps.Marker({
			position : markerPosition,
			image : markerImg
		});
		
		// 마커가 지도 위에 표기되도록 설정
		var infowindow = new kakao.maps.InfoWindow({zindex:1});
		// 주소를 위도와 경도로 변환시켜주는 객체
		var geocoder = new kakao.maps.services.Geocoder();
		// roadname은 주소를 뜻하는데 room_addr은 지번 혹은 도로명주소를 받아오기 때문에 설정
		var roadname = '${room.room_addr}';
		
		// 주소로 좌표를 검색
		geocoder.addressSearch(roadname, function(result, status){
			// 정상적으로 검색이 완료되면
			if(status === kakao.maps.services.Status.OK){
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				var imgSrc = "resources/img/pin.png",
				imgSize = new kakao.maps.Size(64,69),
				imgOption = {offset : new kakao.maps.Point(27,69)};
				
				var markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption);
				
				// 결과값으로 받은 위치를 마커로 표시
				var marker = new kakao.maps.Marker({
					position : coords,
					image : markerImg,
					map:map
				});
				
				
				
				
				// 지도의 중심을 결과값으로 받은 위치로 이동
				map.setCenter(coords);
			} else {
				// 정상적으로 검색이 되지 않는다면
				marker1.setMap(map);
				var infowindow = new kakao.maps.InfoWindow({
					content : '<div id="mapcontent" style="text-align:center; padding : 6px 0; color : black;">Here</div>'
				});
				infowindow.open(map, marker1);
			}
		});
		
		$(function(){
			$("#mapcontent").parent().parent().attr('border-radius', '20px');
		})
		</script>
		
		<!-- third container -->
		<div id="thirdcontainer">
			<div id="roominfocontainer">
				<div id="roominfodetail">
					<table border="1">
						<tr>
							<th>방 이름</th>
							<td>${room.room_name }</td>
						</tr>
						<tr>
							<th>방 면적</th>
							<td>${room.room_extent }</td>
						</tr>
						<tr>
							<th>방 주소</th>
							<td>${room.room_addr }</td>
						</tr>
						<tr>
							<th>건물 종류</th>
							<%
								if(room.getRoom_kind().equals("1")){
							%>
								<td>아파트</td>
							<%
								} else if(room.getRoom_kind().equals("2")){
							%>
								<td>빌라</td>
							<%
								} else if(room.getRoom_kind().equals("3")){
							%>
								<td>주택</td>
							<%
								} else if(room.getRoom_kind().equals("4")){
							%>
								<td>오피스텔</td>
							<%
								} else {
							%>
								<td>상가사무실</td>
							<%
								}
							%>
						</tr>
						<tr>
							<th>방 구조</th>
							<%
								if(room.getRoom_structure().equals("1")){
							%>
								<td>방 1개</td>
							<%
								} else if(room.getRoom_structure().equals("2")){
							%>
								<td>방 2개</td>
							<%
								} else {
							%>
								<td>방 3개 이상</td>
							<%
								}
							%>
						</tr>
						<tr>
							<th>방 층수</th>
							<td>${room.room_floor }</td>
						</tr>
						<tr>
							<th>매물 등록 날짜</th>
							<td>${room.room_regdate }</td>
						</tr>
						<tr>
							<th>매물 준공 날짜</th>
							<td>${room.room_cpdate }</td>
						</tr>
						<tr>
							<th>입주 가능일</th>
							<td>${room.room_avdate }</td>
						</tr>
						<tr>
							<th>방 상세설명</th>
							<td>
								<textarea id="detailcontent" rows="10" cols="60" readonly="readonly">${room.room_detail }</textarea>
							</td>
						</tr>
						<%
							// 세션에 로그인되어있는 id를 가지고 수정버튼을 보여줄지 말지 선택
							
							// 매물올린사람
							String uploadid = room.getRoom_id();
							
							// 세션에 저장되어있는 사람
							MemberDto user = (MemberDto) request.getSession().getAttribute("login");
							// session에 담겨있는 값. 즉, id를 따로 담아준다.
							String useingid = user.getMember_id();
							if(uploadid.equals(useingid)){
						%>
						<tr>
							<td colspan="2">
								<input type="button" value="수정" onclick="location.href='updateroom.do?room_no=${room.room_no}'"/>
								<input type="button" value="삭제" onclick="location.href='deleteroom.do?room_no=${room.room_no}'"/>
							</td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>