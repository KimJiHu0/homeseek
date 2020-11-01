<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- donate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/donate.css"
	type="text/css" />
<!-- donate.js -->
<script src="resources/js/doante.js" type="text/javascript"></script>

</head>
<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<div id="top_title">
		<h3>후원하가</h3>
	</div>
	<hr id="top_line">

	<!-- 본문 -->
	<section>

		<div class="contents">
			<div id="main_image">
				<img alt="donate_main" src="resources/img/donate_main.jpg"
					id="donate_image">
			</div>
	
			<div class="donate_div">
				<p>Lorem Ipsum is simply dummy text of the printing and
					typesetting industry. Lorem Ipsum has been the industry's standard
					dummy text ever since the 1500s, when an unknown printer took a
					galley of type and scrambled it to make a type specimen book. It has
					survived not only five centuries, but also the leap into electronic
					typesetting, remaining essentially unchanged. It was popularised in
					the 1960s with the release of Letraset sheets containing Lorem Ipsum
					passages, and more recently with desktop publishing software like
					Aldus PageMaker including versions of Lorem Ipsum</p>
					<br>
					<br>
					<br>
					
				<form action="donate.do" id="donate_form">
		
					<input type="radio" id="donate_1" name="donate_value" value="1000">
					<label for=donate_1 id="label_1">1000원</label>
					 
					<input type="radio"id="donate_3" name="donate_value" value="3000"> 
					<label for=donate_1 id="label_3">3000원</label>
					 
					<input type="radio" id="donate_5" name="donate_value" value="5000"> 
					<label for=donate_1 id="label_5">5000원</label> 
					
					<input type="radio" id="donate_10" name="donate_value" value="10000"> 
					<label for=donate_1 id="label_10">10000원</label>
					
					<input type="submit" value="후원하기"> 
				</form>
			</div>
		</div>
		
		
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>