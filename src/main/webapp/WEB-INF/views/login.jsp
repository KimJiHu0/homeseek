<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 만들어서 아래와 같이 href 경로 지정해주세요. -->
<link rel="stylesheet" href="resources/css/login.css" type="text/css" />
<!-- js 파일 만들어서 아래와 같이 src 경로 지정해주세요. -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/login.js" type="text/javascript"></script>
<script type="text/javascript">
		//자바스크립트로 새로고침 1회만실행 코드 <-정답	
		if (self.name != 'reload') {
			self.name = 'reload';
			self.location.reload(true);
		} else
			
			self.name = '';
	</script>

</head>
<body>

	<%
		MemberDto dto = (MemberDto) request.getSession().getAttribute("login");
	%>
	<%
		System.out.println("★ : " + dto);
	if (dto != null) {
	%>
	<script type="text/javascript">
			history.back();
			alert("로그인이 된 상태입니다.")
			
	</script>
	<%
		}
	%>
	<section>

		<!--  <button type='button' id="modal_btn">로그인</button>-->

		<div class="black_bg"></div>
		<div class="modal_wrap">
			<div class="modal_close">
				<a href="main.do">close</a>
			</div>
			<div>

				<div class="logo">
					<a href="#">HOME<span>SEE</span>K
					</a>
				</div>

				<table>
					<tr>
						<td><input type="text" placeholder="I D" id="member_id" /></td>
					</tr>
					<tr>
						<td><input type="password" placeholder="P W" id="member_pw" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="login"
							id="loginbtn" onclick="loginPrc();" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center" id="loginchk"></td>
					</tr>
				</table>

				<div class="snslogin">
					<a href="${ naver_url }"><img width="150"
						src="${pageContext.request.contextPath}/resources/img/naver-login.png"
						alt="Naver Login" /></a> <a href="${ google_url }"><img
						width="150"
						src="${pageContext.request.contextPath}/resources/img/google-login.png"
						alt="Google Login" /></a> <a href="${ kakao_url }"><img
						width="150"
						src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png"
						alt="Kakao Login" /></a>
				</div>

				<ul class="idpwlink">
					<li><a href="findidform.do">아이디 찾기</a></li>
					<li><a> | </a></li>
					<li><a href="findpwdform.do">비밀번호 찾기</a></li>
					<li><a> | </a></li>
					<li><a href="registform.do">회원가입</a></li>
				</ul>

			</div>
		</div>
	</section>

</body>
</html>