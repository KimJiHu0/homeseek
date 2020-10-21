<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/roomDetail.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/roomDetail.js"
	type="text/javascript"></script>
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
				<div id="roomimg">사진</div>
				
			</div>

			<!-- 방 올린 유저 정보를 담는 큰 div -->
			<div id="userinfocontainer">
				<div id="userinfodetail">
					<div id="userinfotitle">
						<p id="leftb">사용자 정보</p><p id="rightb">찜하기♥</p>
					</div>
					<div id="userinfo">
						<table>
							<tr>
								<th>아이디 : </th>
								<td>${member.member_id }</td>
							</tr>
							<tr>
								<th>이름 : </th>
								<td>${member.member_name }</td>
							</tr>
							<tr>
								<th>이메일 : </th>
								<td>${member.member_email }</td>
							</tr>
							<tr>
								<th>전화번호 : </th>
								<td>${member.member_phone }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<!-- second container -->
		
		<div id="noticeinfo">
			<p>
				안전한 거래를 위해 필요한 서류를 <b>꼭</b> 참고해주세요.
				<a href="#">공지사항 바로가기</a>
			</p>
		</div>
		
		<!-- third container -->
		<div id="thirdcontainer">
			<div id="roominfocontainer">
				<div id="roominfodetail">
					<table id="roominfo" border="1">
						<tr>
							<th>방 번호</th>
							<td>${room.room_no }</td>
						</tr>
						<tr>
							<th>방 이름</th>
							<td>${room.room_name }</td>
						</tr>
						<tr>
							<th>방 사진</th>
							<td>${room.room_photo }</td>
						</tr>
						<tr>
							<th>방 종류</th>
							<td>${room.room_type }</td>
						</tr>
						<tr>
							<th>방 보증금</th>
							<td>${room.room_deposit }</td>
						</tr>
						<tr>
							<th>방 가격</th>
							<td>${room.room_price }</td>
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
							<td>${room.room_kind }</td>
						</tr>
						<tr>
							<th>방 구조</th>
							<td>${room.room_structure }</td>
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
							<th>경도</th>
							<td>${room.room_longi }</td>
						</tr>
						<tr>
							<th>위도</th>
							<td>${room.room_lati }</td>
						</tr>
						<tr>
							<th>방 상세설명</th>
							<td>${room.room_detail }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${room.room_id }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>