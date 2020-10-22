<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomList.css" type="text/css" />

<!-- alert띄우기 위한 스크립트 -->
<script type="text/javascript">
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
</script>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<section>
		<table>
			<tr>
				<th>방 번호</th>
				<th>방 이름</th>
				<th>방 층수</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td>작성된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="list">
						<tr>
							<td><a href="detailroom.do?room_no=${list.room_no }">${list.room_no }</a></td>
							<td>${list.room_name }</td>
							<td>${list.room_floor }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>