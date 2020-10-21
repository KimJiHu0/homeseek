<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detailRoom.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/detailRoom.js"
	type="text/javascript"></script>
</head>
<body>
	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>
	<section>

		<a href="#" onclick="return prevRoom();">
			<img alt="이전그림" src="${pageContext.request.contextPath}/resources/img/arrowleft.png" />
		</a>
		<a href="#" onclick="nextRoom();">
			<img alt="다음그림" src="${pageContext.request.contextPath}/resources/img/arrowright.png">
		</a>
		<!-- first container -->
		<div id="firstcontainer">
			<!-- 방 사진들을 담고있는 div박스 -->
			<div id="imgcontainer">

				<!-- 방 사진 정보 -->
				<div id="roomimg">사진</div>
				
			</div>

			<!-- 방 올린 유저 정보를 담는 큰 div -->
			<div id="userinfocontainer">
				<div id="userinfodetail">사용자 정보담기</div>
			</div>
			
			<div id="roominfocontainer">
				<div id="roominfodetail"></div>
			</div>
		</div>
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>