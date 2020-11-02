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

<!-- Iamport 결제 api	 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

	var IMP = window.IMP; // 생략가능
	IMP.init('imp78816785'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

</script>
</head>
<body>
	<%
	MemberDto memberDto = (MemberDto) request.getSession().getAttribute("login");
	String member_id = memberDto.getMember_id();
	String member_name = memberDto.getMember_name();
	String member_phone = memberDto.getMember_phone();
	
	%>


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
				
					<label id="value1">
					<input type="radio" id="value" name="donate_value" value="1000">
					1000원</label>
					 
					<label id="value3">
					<input type="radio" id="value" name="donate_value" value="3000"> 
					3000원</label>
					 
					 <label id="value5">
					<input type="radio" id="value" name="donate_value" value="5000"> 
					5000원</label> 
					
					<label id="value10">
					<input type="radio" id="value" name="donate_value" value="10000"> 
					10000원</label>
					
					<input type="button" onclick="requestPay()" value="후원하기"> 
				</form>
			</div>
		</div>
		
		
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>