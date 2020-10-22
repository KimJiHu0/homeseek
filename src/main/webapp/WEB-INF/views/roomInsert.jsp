<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
   MemberDto dto = (MemberDto)request.getSession().getAttribute("login");
%>
 --%>
<%
	MemberDto login = (MemberDto) session.getAttribute("login");
	session.getAttribute("member_id");
if ( login == null) {
	pageContext.forward("loginform.do");
}
%>


	<h1> [insertRoom.do] 방올리기 페이지 </h1>
	
	<form action="insertRes.do" method="POST">
		<table border="1">
	
			<tr>
				<th>매물이름</th>
				<td><input type="text" name="room_name"></td>
			</tr>
			<tr>
				<th>매물사진</th>
				<td><input type="file" name="room_photo"></td>
			</tr>
			<tr>
				<th>매물종류</th>
				<td>
					<select name="room_type">
						<option value="1">월세</option>
						<option value="2">전세</option>
						<option value="3">매매</option>
						<option value="4">반전세</option>
						<option value="5">단기임대</option>
					</select>				
				</td>
			</tr>
			<tr>
				<th>보증금</th>
				<td><input type="text" name="room_deposit"></td>
			</tr>
			<tr>
				<th>매물가격</th>
				<td><input type="text" name="room_price"></td>
			</tr>
			<tr>
				<th>매물면적</th>
				<td><input type="text" name="room_extent" placeholder="단위 : 제곱미터"></td>
			</tr>
			<tr>
				<th>매물주소</th>
				<td><input type="text" name="room_addr" placeholder="도로명주소로 입력해주세요"></td>
			</tr>
			<tr>
				<th>건물종류</th>
				<td>
					<select name="room_kind">
						<option value="1">아파트</option>
						<option value="2">빌라</option>
						<option value="3">주택</option>
						<option value="4">오피스텔</option>
						<option value="5">상가사무실</option>
					</select>
				</td>  
			</tr>
			<tr>
				<th>방 구조</th>
				<td>
					<select name="room_structure">
						<option value="1">방 1개</option>
						<option value="2">방 2개</option>
						<option value="3">방 3개이상</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>방 층수</th>
				<td><input type="text" name="room_floor"></td>
			</tr>
			<tr>
				<th>매물 등록날짜</th>
				<td><input type="date" name="room_regdate"></td>
			</tr>
			<tr>
				<th>준공 날짜</th>
				<td><input type="date" name="room_cpdate"></td>
			</tr>
			<tr>
				<th>입주 가능일</th>
				<td><input type="date" name="room_avdate"></td>
			</tr>
			<tr>
				<th>방 상세설명</th>
				<td><textarea rows="10" cols="60" name="room_datail"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="작성">
					<input type="button" value="취소" onclick="location.href='main.do'">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>