<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 후원하기</title>

<!-- donate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/donate.css" type="text/css" />
	


<!-- BootPay 결제 api	 -->
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.6.min.js" type="application/javascript"></script>

<!-- footer 설정용 -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
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

	
	<hr id="top_line">

	<!-- 본문 -->
	<section>
	<input type="hidden" value="<%=member_id %>" id="member_id">
	<input type="hidden" value="<%=member_phone %>" id="member_phone">
	<input type="hidden" value="<%=member_name %>" id="member_name">
	
		<div class="contents">
			<div id="main_image">
				<img alt="donate_main" src="resources/img/donate_main.jpg" class="donate_image">
				<img alt="donate_main" src="resources/img/donate_main_desk.jpg" class="donate_image">
				<img alt="donate_main" src="resources/img/donate_main_coding.jpg" class="donate_image">
				<img alt="donate_main" src="resources/img/donate_main_office.jpg" class="donate_image">
				
			</div>
	
			<div class="donate_div">
				
				<p id="main_para">
				<p id="main_title">Homeseek은...</p>
				 부동산 거래시 중간단계에서 생기는 수수료를 줄이고 
				거짓, 허위매물로 인한 피해사례를 줄이고 안전하고 투명한 거래를 지향하기 위해서 만든 
				개인과 개인을 공인중계사 없이 이어주는 무료 서비스입니다.<br><br>
				Homeseek 운영진들이 서비스를 계속할 수 있도록 도와주세요.
				
				</p>

				<div class="choosebox">
					<form action="donate.do" id="donate_form">
						<h3 id="form_title">금액을 선택해 주세요.</h3>
					
						<ul class="radio_ul">
							<li class="radio_li">
								<input type="radio" id="value1" name="donate_value" value="100">
								<label id="value1" for="value1">₩1,000</label>
								<div class="check"></div>
							</li>
			
							<li class="radio_li">
								<input type="radio" id="value3" name="donate_value" value="300">
								<label id="value3" for="value3">₩3,000</label>
								<div class="check"></div>
							</li>
			
							<li class="radio_li">
								<input type="radio" id="value5" name="donate_value" value="500">
								<label id="value5" for="value5">₩5,000</label> 
								<div class="check"></div>
							</li>
			
							<li class="radio_li">
								<input type="radio" id="value10" name="donate_value" value="1000">
								<label id="value10" for="value10">₩10,000</label>
								<div class="check"><div class="inside"></div></div>
							</li>
							
						</ul>
					</form>
					
					<input type="button" onclick="pay()" value="후원하기" id="donate_button">
				</div>
			</div>
		</div>
		
		
	</section>
	<!-- footer.jsp -->
	
</body>
	<%@ include file="form/footer.jsp"%>
<!-- donate.js -->
<script src="resources/js/donate.js" type="text/javascript"></script>
</html>






