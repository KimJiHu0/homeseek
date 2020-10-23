<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/regist.js" type="text/javascript"></script>

</head>
<body>

	<h1>회원가입</h1>
	
	<form action="registres.do" method="post">
			<div>
				<label for="member_id">아이디</label>
					<input type="text" id= "member_id" name="member_id" placeholder="ID"/>
				<div class="check_font" id="name_check"></div>
			</div>
			<div>
				<label for="member_pw">비밀번호</label>
					<input type="password" id="member_pw" name="member_pw" placeholder="PWD"/>
			</div>
			<div>
				<label for="member_pw">비밀번호 확인</label>
					<input type="password" id="pw_check" name="pw_check" placeholder="PWD"/>
			</div>
			<div>
				<label for="member_name">이름</label>
					<input type="text" name="member_name" placeholder="NAME"/>
			</div>
			<div>
				<label for="member_email">E-mail</label>
					<input type="text" name="member_email" placeholder="E-MAIL"/>
			</div>
			<div>
				<label for="member_phone">Phone</label>
					<input type="text" name="member_phone" id="member_phone" placeholder="휴대폰 번호 입력"/>
					<!--  <button onclick="sendSms();">휴대폰 인증</button>-->
					<input type="button" name = "sendSms" id="sendSms" value="휴대폰 인증">
			</div>
			<div>
					<input type="text" name="phone_check" id="phone_check" placeholder="인증 번호 입력"/>
					<input type="button" name = "phoneCheck" id="phoneCheck" value="인증확인">
			</div>
			<div>
					<input type="submit" value="회원등록"/>
					<input type="button" value="취소" onclick="location.href='main.do'"/>
			</div>
			
	</form>
</body>
</html>