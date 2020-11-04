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
	
		<table border="1">
		<col width="150px">
		<col width="150px">
		<col width="150px">
		<col width="150px">
		<col width="150px">
		<col width="150px">
			<tr>
				<th colspan="6">&nbsp;</th>
			</tr>
			<c:choose>
				<c:when test="${empty wishlist }">
					<tr>
						<th>현재 회원님께서 찜한 매물이 없습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
				<tr>
					<td></td>
					<td>찜목록번호</td>
					<td>내아이디</td>
					<td>파는사람아이디</td>
					<td>찜한글 번호</td>
					<td></td>
				</tr>
					<c:forEach items="${wishlist }" var="wishlist">
						<tr>
							<td></td>
							<td>${wishlist.wish_no }</td>
							<td>${wishlist.wish_id }</td>
							<td>${wishlist.wish_sell_id }</td>
							<td>${wishlist.room_no }</td>
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	
	</section>
	
	<%@ include file="./form/footer.jsp" %>
</body>
</html>