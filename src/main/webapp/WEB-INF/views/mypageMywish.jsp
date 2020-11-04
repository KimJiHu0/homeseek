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
	
		<table>
			<c:choose>
				<c:when test="${empty wishlist }">
					<p>찜한 글이 없습니다.</p>
				</c:when>
			</c:choose>
		</table>
	
	</section>
	
	<%@ include file="./form/footer.jsp" %>
</body>
</html>