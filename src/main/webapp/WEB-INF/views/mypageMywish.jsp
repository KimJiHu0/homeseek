<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 나의 찜목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMywish.css" type="text/css" />
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	
	<section>
		
		<div class="maincontainer">
			<div class="mywish-menu">
				<div class="mywish-menu-title"><a class="gowishlist" href="#">내가 찜한 매물</a></div>
				<div class="mywish-menu-title"><a class="goroomlist" href="#">내가 올린 매물</a></div>
			</div>
			<div class="mywish-list">
				<table border="1">
				<col width="80px">
				<col width="100px">
				<col width="80px">
				<col width="250px">
				<col width="80px">
				<col width="250px">
				<col width="80px">
				<col width="100px">
				<col width="80px">
					<tr>
						<th colspan="9">&nbsp;</th>
					</tr>
					<c:choose>
						<c:when test="${empty wishlist }">
							<tr>
								<th colspan="9">현재 회원님께서 찜한 매물이 없습니다.</th>
							</tr>
						</c:when>
						<c:otherwise>
						<tr>
							<td></td>
							<td>찜번호</td>
							<td></td>
							<td>글제목</td>
							<td></td>
							<td>파는사람아이디</td>
							<td></td>
							<td>글작성날짜</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="9">&nbsp;</td>
						</tr>
							<c:forEach items="${wishlist }" var="wishlist">
								<tr>
									<td></td>
									<td>${wishlist.wish_no }</td>
									<td></td>
									<td>${wishlist.roomdto.room_name }</td>
									<td></td>
									<td>${wishlist.roomdto.room_id }</td>
									<td></td>
									<td>${wishlist.roomdto.room_regdate }</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="9">&nbsp;</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>		
			</div>
		</div>
	
	</section>
	
	<%@ include file="./form/footer.jsp" %>
</body>
</html>