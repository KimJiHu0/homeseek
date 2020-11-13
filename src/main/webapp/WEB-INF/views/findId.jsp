<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findId.css">
<script src="resources/js/findId.js" type="text/javascript"></script>
</head>
<body>
			<%@ include file="/WEB-INF/views/form/header.jsp" %>
			
			<h1>아이디 찾기</h1>
			<hr/>

			<section>
			<div id="outter">
			<div>
				<h3>
				<label for="id_name">이름</label>
				</h3>
					<input type="text" name="id_name" id="id_name" size="30" placeholder="NAME"/>
			</div>
			
			<div>
				<h3>
				<label for="id_phone">Phone</label>
				</h3>
					<input type="text" name="id_phone" id="id_phone" size="30" placeholder="01012345555"/>
					<!--  <button onclick="sendSms();">휴대폰 인증</button>-->
					<input type="button" name = "sendSms" id="sendSms" value="휴대폰 인증">
					<div class="check_font" id="idPhone"></div>
			</div>
			<div>
					<div class="phone_check">
					<input type="text" name="phone_check" id="phone_check" placeholder="인증 번호 입력"/>
					<input type="button" name = "phoneCheck" id="phoneCheck" value="인증확인">
					<div class="check_font" id="idCheck"></div>
					</div>
			</div>
			<div>
					<button class="btn btn-success" type="submit" id="submit">아이디 찾기</button>
					<div class="check_font" id="selectId"></div>
			</div>
			</div>
			<!-- <div>
			<input type="button" id="main" value="메인으로" onclick="location.href='main.do'"/>
			<input type="button" id="login" value="로그인하기" onclick="location.href='loginform.do'"/>
			</div>-->
			
			
	
			</section>
		<div id = "footer">
		<%@ include file="./form/footer.jsp" %>
		</div>
</body>
</html>