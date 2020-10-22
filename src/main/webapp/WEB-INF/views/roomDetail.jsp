<%@page import="com.mvc.homeseek.model.dto.RoomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
<!-- alert띄우기 위한 스크립트 -->
<script type="text/javascript">
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
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
					<img alt="d" src="resources/img/arrowleft.png" id="leftarrow">
					사진
					<img alt="d" src="resources/img/arrowright.png" id="rightarrow">
				</div>
				
			</div>

			<!-- 방 올린 유저 정보를 담는 큰 div -->
			<div id="userinfocontainer">
				<div id="userinfodetail">
					<div id="userinfotitle">
						<span id="leftb">사용자 / 매물 정보</span><span id="rightb">찜하기♥</span>
					</div>
					<!-- 매물 종류가 매매일 때(3) ROOM_PRICE만 보여주기 -->
					<%
						RoomDto room = (RoomDto)request.getAttribute("room");
					
						// ROOM_TYPE가 매매일 경우에는 매매이기 때문에 ROOM_PRICE만 보여주고
						if(room.getRoom_type().equals("3")){
					%>
						<div class="userinfocontent">
							<span class="leftb">매물 종류 : </span>
							<span class="rightb">매매</span>
						</div>
						<div class="userinfocontent">
							<span class="leftb">매매가 : </span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						// 그게 아니라 전세일 경우에는 ROOM_PRICE와 젠세가로 ROOM_DEPOSIT를 보여준다.
						} else if(room.getRoom_type().equals("2")){
					%>
						<div class="userinfocontent">
							<span class="leftb">매물 : </span>
							<span class="rightb">전세</span>
						</div>
						<div class="userinfocontent">
							<span class="leftb">전세가 : </span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						// 월세,4,5일 경우에는 둘 다 보여준다.
						} else if(room.getRoom_type().equals("1")){
					%>
						<div class="userinfocontent">
							<span class="leftb">매물 : </span>
							<span class="rightb">월세</span>
						</div>
						<div class="userinfocontent">
							<span class="leftb">보증금 : </span>
							<span class="rightb">${room.room_deposit }만원</span>
						</div>
						<div class="userinfocontent">
							<span class="leftb">월세가 : </span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						// 반전세인 경우(월세인데 보증금을 더 내고 월세를 줄인다.)
						} else if(room.getRoom_type().equals("4")){
					%>
						<div class="userinfocontent">
							<span class="leftb">매물 : </span>
							<span class="rightb">반전세</span>
						</div>
						<div class="userinfocontent">
							<span class="leftb">보증금 : </span>
							<span class="rightb">${room.room_deposit }만원</span>
						</div>
						<div class="userinfocontent">
							<span class="leftb">월세가 : </span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						} else {
					%>
						<div class="userinfocontent">
							<span class="leftb">매물 : </span>
							<span class="rightb">단기임대</span>
						</div>
						<div class="userinfocontent">
							<span class="leftb">보증금 : </span>
							<span class="rightb">${room.room_deposit }만원</span>
						</div>
						<div class="userinfocontent">
							<span class="leftb">월세가 : </span>
							<span class="rightb">${room.room_price }만원</span>
						</div>
					<%
						}
					%>
					
					<div class="userinfocontent">
						<span class="leftb">${member.member_name }(${member.member_id })</span><span class="rightb">쪽지하기</span> | <span>신고하기</span>
					</div>
					<div class="userinfocontent">
						<span class="leftb">E-Mail : </span><span class="rightb">${member.member_email }</span>
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
			<p>
				안전한 거래를 위해 필요한 서류를 <b>꼭</b> 참고해주세요.
				<a href="#">공지사항 바로가기</a>
			</p>
		</div>
		
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
							<th>방 사진</th>
							<td>${room.room_photo }</td>
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
							<td><fmt:formatDate value="${room.room_regdate }" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<th>매물 준공 날짜</th>
							<td><fmt:formatDate value="${room.room_cpdate }" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<th>입주 가능일</th>
							<td><fmt:formatDate value="${room.room_avdate }" pattern="yyyy-MM-dd"/></td>
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
							<td>
								<textarea rows="10" cols="60" readonly="readonly">${room.room_detail }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" value="수정" onclick="location.href='updateroom.do?room_no=${room.room_no}'"/>
								<input type="button" value="삭제" onclick="location.href='deleteroom.do?room_no=${room.room_no}'"/>
							</td>
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