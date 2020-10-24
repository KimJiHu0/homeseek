<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 공인중개사 없는 깔끔한 거래</title>
<script src="${pageContext.request.contextPath}/resources/js/index.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
</head>
<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	
	
	<section>
		<div class="test">
			<!-- 메인페이지에서 작성할 부분 여기에 작성 -->
			<div class="mainText">
				H O O M <span>S E E</span> K
			</div>
			
			<div class="mainSearch">
			<form action="listroom.do" class="searchform"> <!-- 아직 검색기능 안만들었음, 일단 list로 가게 해놓음 -->
				<input type="text" class="searchtxt" placeholder="지역명, 대학교명, 지하철 명을 입력해주세요">
			</form>
			</div> 
			
		</div>
		
    	<img id="backgroundimg" alt="메인사진" src="${pageContext.request.contextPath}/resources/img/backgroundimg.jpg">
	</section>
</body>
</html>