<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findPwd.css">
<script src="resources/js/findPwd.js" type="text/javascript"></script>
</head>
<body>	
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	<h1>비밀번호 찾기</h1>
	<hr/>
<!-- 
				<form>활용 팁!!
				
상황에 따라 action값은 action=""으로 놓고 동적으로 처리할수있다.
 제이쿼리 등으로 처리하면 된다.
예를들어, id값으로 form 구분 해주면서..이렇게 처리하면 되겠다!

$('#form_value').attr("action", "/homeseek/selectpw.do");

 -->
 		<section>
 		<div id="outter">
		<form  method="post" action="selectpw.do" >
			<div>
			<h3>
				<label for="member_id">아이디</label>
			</h3>
				<input type="text" name="pwd_id" id="pwd_id">
			</div>
			
			<div>
			<h3>
				<label for="id_name">이름</label>
			</h3>	
				<input type="text" name="pwd_name" id="pwd_name" size="30" placeholder="NAME"/>
			</div>
			
			<div>
			<h3>
				<label for="id_phone">Phone</label>
			</h3>	
					<input type="text" name="pwd_phone" id="pwd_phone" size="30" placeholder="01012345555"/>
					<!--  <button onclick="sendSms();">휴대폰 인증</button>-->
					<input type="button" name = "sendSms" id="sendSms" value="인증번호 발송">
					<!--  -->
					<div class="check_font" id="idPhone"></div>
			</div>
			<div>
					<input type="text" name="phone_check" id="phone_check" placeholder="인증 번호 입력"/>
					<input type="button" name = "phoneCheck" id="phoneCheck" value="인증번호 확인">
					<!-- 인증번호 유효성 jquery -->
					<div class="check_font" id="idCheck"></div>
			</div>		
					
			<div>	
			<h3><!-- 새 비밀번호 입력 -->
					<label for="pwd_new" id="new_pwd">새 비밀번호</label>
			</h3>	
					<input type="password" name="pwd_new" id="pwd_new" placeholder="2조화이팅"/>
					<div class="check_font" id="pwCheck"></div>
			</div>
				
			
			<div>
					<!-- <input type="button" value="메인으로" onclick="location.href='main.do'"/>
					<input type="button" value="로그인하러 가기" onclick="location.href='loginform.do'"/> -->
					
					<input  type="submit" id="pwdsubmit" value ="비밀번호 변경하기">

			</div>
			
		</form>
		</div>
		</section>
			<div id="footer">
			<%@ include file="./form/footer.jsp" %>
			</div>
</body>
</html>