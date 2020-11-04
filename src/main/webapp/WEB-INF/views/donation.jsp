<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 후원하기</title>

<!-- donate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/donate.css" type="text/css" />
	
<!-- donate.js -->
<script src="resources/js/donate.js" type="text/javascript"></script>

<!-- BootPay 결제 api	 -->
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.6.min.js" type="application/javascript"></script>
</head>
<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp"%>
	<% 
		MemberDto memberDto = (MemberDto) request.getSession().getAttribute("login");
		String member_id = memberDto.getMember_id();
		String member_phone = memberDto.getMember_phone();
		String member_name = memberDto.getMember_name();
	
	%>

	<div id="top_title">
		<h3>후원하가</h3>
	</div>
	<hr id="top_line">

	<!-- 본문 -->
	<section>
	<input type="hidden" value="<%=member_id %>" id="member_id">
	<input type="hidden" value="<%=member_phone %>" id="member_phone">
	<input type="hidden" value="<%=member_name %>" id="member_name">
	
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
				
					<label id="value1">
					<input type="radio" id="value" name="donate_value" value="100">
					1000원</label>
					 
					<label id="value3">
					<input type="radio" id="value" name="donate_value" value="300"> 
					3000원</label>
					 
					 <label id="value5">
					<input type="radio" id="value" name="donate_value" value="500"> 
					5000원</label> 
					
					<label id="value10">
					<input type="radio" id="value" name="donate_value" value="1000"> 
					10000원</label>
					
					<input type="button" onclick="pay()" value="후원하기" id="donate_button"> 
				</form> 
				
				
			</div>
		</div>
		
		
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>