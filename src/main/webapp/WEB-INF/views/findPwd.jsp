<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
		<form action="#">
			<div>
				<label for="member_id">아이디</label>
				<input type="text" name="pwd_id" id="pwd_id">
			</div>
			
			<div>
				<label for="id_name">이름</label>
				<input type="text" name="pwd_name" id="pwd_name" size="30" placeholder="NAME"/>
			</div>
			
			<div>
				<label for="id_phone">Phone</label>
					<input type="text" name="pwd_phone" id="pwd_phone" size="30" placeholder="01012345555"/>
					<!--  <button onclick="sendSms();">휴대폰 인증</button>-->
					<input type="button" name = "sendSms" id="sendSms" value="휴대폰 인증">
					<div class="check_font" id="idPhone"></div>
			</div>
			<div>
					<input type="text" name="phone_check" id="phone_check" placeholder="인증 번호 입력"/>
					<input type="button" name = "phoneCheck" id="phoneCheck" value="인증확인">
			</div>
			<div>
					<button class="btn btn-success" type="submit" id="submit">비밀번호 찾기</button>
					<div class="check_font" id="selectPwd"></div>
			</div>
			<div>
			<input type="button" value="메인으로" onclick="location.href='main.do'"/>
			<input type="button" value="로그인하기" onclick="location.href='loginform.do'"/>
			</div>
			
		</form>
</body>
</html>