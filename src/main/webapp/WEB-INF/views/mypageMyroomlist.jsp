<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 내가 올린 매물</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMyroomlist.css" type="text/css" />
</head>
<body>
		
	<%@ include file="./form/header.jsp" %>
	
	<section>
		<div class="maincontainer">
			<div class="mywish-menu">
				<div class="mywish-menu-title"><a class="gowishlist" href="mypagewishlist.do">내가 찜한 매물</a></div>
				<div class="mywish-menu-title"><a class="goroomlist" href="#">내가 올린 매물</a></div>
			</div>
			<hr/>
			
		</div>
	

	</section>
	
	<%@ include file="./form/footer.jsp" %>

</body>
</html>