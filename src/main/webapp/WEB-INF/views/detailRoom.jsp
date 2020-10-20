<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailRoom.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/resources/js/detailRoom.js" type="text/javascript"></script>
</head>
<body>
	<!-- header.jsp -->
	<%@ include file="form/header.jsp" %>
	<section>
		<div id="galleryWrap">
	      <p>
	         <a href="http://www.naver.com" onclick="return prevGallery();">
	            <img alt="이전그림" src="${pageContext.request.contextPath}/resources/img/arrowleft.png"/>
	         </a>
	         
	         <img alt="그림1" src="resources/img/img01.jpg" id="gallery"/>
	         
	         <a href="#next" onclick="nextGallery();">
	            <img alt="다음그림" src="${pageContext.request.contextPath}/resources/img/arrowright.png">
	         </a>
	      </p>
	   </div>
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp" %>
</body>
</html>