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

	<%
	if (request.getAttribute("naveremail") != null) {		
	%>
	<h1>NAVER 연동 회원가입</h1>
	<%
	} else if (request.getAttribute("kakaoemail") != null) {
	%>
	<h1>KAKAO 연동 회원가입</h1>
	<%
	} else {
	%>
	<h1>회원가입</h1>
	<%
	}
	%>
	
	<form action="registres.do" method="post">
	
			<div> 
			<label for="member_id">아이디</label>
			<input type="text" name="member_id" id="member_id"> @ <input name="email" id="email" type="text"> 
			<%
				if (request.getAttribute("naveremail") != null) {
			%>
			<input type="text" id="member_id" name="member_id" value="${ naveremail }" size="30" readonly/>
			<%
				}else if (request.getAttribute("kakaoemail") != null) {
			%>
			<input type="text" id="member_id" name="member_id" value="${ kakaoemail }" size="30" readonly/>	
			<%
				} else {
			%>
			<select name="select_email" id="select_email"> 
				  <option value="" selected>선택하세요</option> 
				  <option value="naver.com">naver.com</option> 
				  <option value="gmail.com">gmail.com</option>   
			</select> 
			<%
				}
			%>
				  
				  <div class="check_font" id="id_check"></div>
			</div>
			<div>
				<label for="member_pw">비밀번호</label>
					<input type="password" id="member_pw" name="member_pw" size="30" placeholder="소문자,숫자 조합(4~12)"/>
					<div class="check_font" id="memberPw"></div>
			</div>
			<div>
				<label for="member_pw">비밀번호 확인</label>
					<input type="password" id="pw_check" name="pw_check" size="30" placeholder="소문자,숫자 조합(4~12)"/>
					<div class="check_font" id="pwCheck"></div>
			</div>
			<div>
				<label for="member_name">이름</label>
				<%
				if (request.getAttribute("kakaoemail") != null) {
				%>
					<input type="text" name="member_name" id="member_name" value="${ kakaoemail }" size="30" readonly/>
				<%
				}else{ 
				%>
					<input type="text" name="member_name" id="member_name" size="30" placeholder="NAME"/>
				<%
				}
				%>
			</div>
			
			<div>
				<label for="member_phone">Phone</label>
					<input type="text" name="member_phone" id="member_phone" size="30" placeholder="010-0000-0000"/>
					<!--  <button onclick="sendSms();">휴대폰 인증</button>-->
					<input type="button" name = "sendSms" id="sendSms" value="휴대폰 인증">
					<div class="check_font" id="memberPhone"></div>
			</div>
			<div>
					<input type="text" name="phone_check" id="phone_check" placeholder="인증 번호 입력"/>
					<input type="button" name = "phoneCheck" id="phoneCheck" value="인증확인">
			</div>
			<div>
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<input type="button" value="취소" onclick="location.href='main.do'"/>
			</div>
			
	</form>
</body>
</html>