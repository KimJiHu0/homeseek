<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	MemberDto dto = (MemberDto) request.getSession().getAttribute("login");
%>
<%
	response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMESEEK</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/section.css">

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="resources/js/login.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"
	type="text/javascript"></script>
</head>
<style>
@charset "UTF-8";

.modal_wrap {
	display: none;
	width: 500px;
	height: 500px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #eee;
	z-index: 2;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

a {
	text-decoration: none;
}

.snslogin {
	position: absolute;
	left: 23px;
	top: 350px;
}

.loginlogo {
	font-size: 50px;
	position: absolute;
	width: 326px;
	height: 75px;
	left: 105px;
	top: 75px;
}

.loginlogo>a {
	color: black;
	font-style: italic;
}

.loginlogo>a>span {
	color: green;
	font-style: italic;
}

.memberid1 {
	position: absolute;
	width: 300px;
	height: 54px;
	left: 55px;
	top: 199px;
	background: #C4C4C4;
}

.memberpw1 {
	position: absolute;
	width: 300px;
	height: 54px;
	left: 55px;
	top: 264px;
	background: #C4C4C4;
}

#loginbtn {
	position: absolute;
	width: 80px;
	height: 125px;
	left: 370px;
	top: 199px;
	background: #C4C4C4;
}

.idpwlink {
	position: absolute;
	top: 400px;
	left: 70px;
}

.idpwlink li {
	display: inline-block;
	margin-right: 5px;
}

/* 모달 */
.modal_login {
	width: 500px;
	height: 500px;
	position: fixed;
	top: 50px;
	left: calc(50% - 250px);
	opacity: 0;
	z-index: -1;
	background-color: white;
	border-radius: 30px;
	transition: 0.6s;
}

.modal-back {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	display: none;
	z-index: 20;
	background-color: black;
	opacity: 0.8;
}
</style>
<body>

	<header>
		<c:choose>
			<c:when test="${pageContext.request.requestURI eq '/'}">
				<div class="mainheader">
			</c:when>
			<c:when test="${pageContext.request.requestURI eq '/homeseek/'}">
				<div class="mainheader">
			</c:when>
			<c:when test="${main eq 'main'}">
				<div class="mainheader">
			</c:when>
			<c:otherwise>
				<div class="header">
			</c:otherwise>
		</c:choose>
		<div class="logo">
			<a class="headeratag" href="main.do">HOME<span>SEE</span>K
			</a>
		</div>

		<%
			if (dto == null) {
		%>
		<ul class="nav">
			<%
				} else {
			%>
			<ul class="nav2">
				<%
					}
				%>
				<c:choose>
					<c:when test="${pageContext.request.requestURI eq '/'}">

					</c:when>
					<c:when test="${pageContext.request.requestURI eq '/homeseek/'}">

					</c:when>
					<c:when test="${main eq 'main'}">

					</c:when>
					<c:otherwise>
						<li class="searchbox">
							<div class="search">
								<!--  엘라스틱 시현시 search.do 로 변경 -->
								<form action="listroom.do" class="navsearchform">
									<input type="text" id="navsearchtxt" name="word"
										value="${word }" placeholder="지역,지하철명,대학교">
								</form>
							</div>
						</li>
					</c:otherwise>
				</c:choose>


				<!-- 엘라스틱서치로 변경시 search.do 로 변경 -->
				<li><a class="headeratag" href="listroom.do"><spring:message
							code="h.list" text="전체 방 보기" /></a></li>
				<%
					if (dto == null) {
				%>
				<li><a class="headeratag login2"><spring:message
							code="h.insert" text="방 올리기" /></a></li>
				<%
					} else {
				%>
				<li><a class="headeratag" href="insertroom.do"><spring:message
							code="h.insert" text="방 올리기" /></a></li>
				<%
					}
				%>
				<li><div class="dropdown">
						<button class="dropbtn">
							<spring:message code="h.board" text="게시판" />
						</button>
						<div class="dropdown-content">
							<a class="headeratag" href="noticelist.do"><spring:message
									code="h.notice" text="공지사항" /></a> <a class="headeratag"
								href="qnalist.do">Q & A</a>
						</div>
					</div></li>

				<%
					if (dto == null) {
				%>
				<li><a class="headeratag login2"><spring:message
							code="h.chat" text="채팅" /></a></li>
				<%
					} else {
				%>
				<li><a class="headeratag" href="javascript:chat();"><spring:message
							code="h.chat" text="채팅" /></a></li>
				<%
					}
				%>
				<li><a class="headeratag" href="donateform.do"><spring:message
							code="h.donate" text="후원하기" /></a></li>
				<li><a class="headeratag" href="?lang=en">ENG</a></li>
				<li><a class="headeratag" href="?lang=ko">KOR</a></li>
				<!-- <li><p class="headeratag" id="translate">Kr | En</p></li> -->
				<%
					if (dto == null) {
				%>


				<li><span class="login2" > <a class="headeratag">LOGIN
							| REGIST</a>
				</span></li>

				<%
					} else if (dto.getMember_role() == 'A') {
				%>

				<li><div class="dropdown">
						<button class="dropbtn">
							<strong><%=dto.getMember_name()%><spring:message
									code="h.welcome" text="님 환영합니다" /></strong>
						</button>
						<div class="dropdown-content">
							<a class="headeratag" href="admin.do"><spring:message
									code="h.admin" text="전체 회원 관리" /></a> <a class="headeratag"
								href="admindona.do"><spring:message code="h.admindona"
									text="전체 후원 내원" /></a>
						</div>
					</div></li>
				<li><span class="logout"> <a class="headeratag"
						href="logout.do"><strong>| LOGOUT</strong></a>
				</span></li>
				<%
					} else if (dto.getMember_role() == 'N') {
				%>
				<li><div class="dropdown">
						<button class="dropbtn">
							<strong><%=dto.getMember_name()%><spring:message
									code="h.welcome" text="님 환영합니다" /></strong>
						</button>
						<div class="dropdown-content">
							<a class="headeratag" href="javascript:myPage();"><spring:message
									code="h.mypage" text="내 정보 보기" /></a> <a class="headeratag"
								href="javascript:myDona();"><spring:message code="h.mydona"
									text="나의 후원 내역" /></a> <a class="headeratag"
								href="javascript:myMsg();"><spring:message code="h.mymsg"
									text="쪽지함" /></a>
						</div>
					</div></li>
				<li><span class="logout"> <a class="headeratag"
						href="logout.do"><strong>| LOGOUT</strong></a>
				</span></li>
				<%
					}
				%>

			</ul>

			</div>
			<div class="modal-back"></div>
			<div class="modal_login">
				<div class="modal_close">
					<a href="main.do">close</a>
				</div>
				<div>

					<div class="loginlogo">
						<a href="#">HOME<span>SEE</span>K
						</a>
					</div>

					<table>
						<tr>
							<td><input type="text" placeholder="I D" id="member_id"
								class="memberid1" /></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="P W" id="member_pw"
								class="memberpw1" /></td>
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
						<a id="naver_url"
							href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=QAAvdWTo1o2T1xyFFbev&redirect_uri=http%3A%2F%2Flocalhost%3A8787%2Fhomeseek%2Fnavercallback.do&scope=profile">
							<img width="150"
							src="${pageContext.request.contextPath}/resources/img/naver-login.png"
							alt="Naver Login" />
						</a> <a
							href="https://accounts.google.com/o/oauth2/auth?client_id=511979566115-7kh42le5dh3pmhfvgehvjrak74k4r251.apps.googleusercontent.com&response_type=code&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.login&redirect_uri=http%3A%2F%2Flocalhost%3A8787%2Fhomeseek%2Fgooglecallback.do">
							<img width="150"
							src="${pageContext.request.contextPath}/resources/img/google-login.png"
							alt="Google Login" />
						</a> <a
							href="https://kauth.kakao.com/oauth/authorize?client_id=2dc56fd515158890d47575ddc651d7e8&redirect_uri=http://localhost:8787/homeseek/kakaocallback.do&response_type=code">
							<img width="150"
							src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png"
							alt="Kakao Login" />
						</a>
					</div>

					<ul class="idpwlink">
						<li><a href="findidform.do"><spring:message code="h.id"
									text="아이디 찾기" /></a></li>
						<li><a> | </a></li>
						<li><a href="findpwdform.do"><spring:message code="h.pw"
									text="비밀번호 찾기" /></a></li>
						<li><a> | </a></li>
						<li><a href="registform.do"><spring:message
									code="h.regist" text="회원가입" /></a></li>
					</ul>
				</div>
			</div>
	</header>
</body>

<script type="text/javascript">
	$(".login2").click(function() {
		$(".modal-back").show();
		$(".modal_login").css("z-index", "20");
		$(".modal_login").css("top", "100px");
		$(".modal_login").css("opacity", "1");
	});
	$(".modal-back").click(function() {
		$(this).hide();
		$(".modal_login").css("top", "50px");
		$(".modal_login").css("opacity", "0");
		$(".modal_login").css("z-index", "-1");
	});

	/* 	
	 function translate(){
	 var userLang = navigator.language || navigator.userLanguage;
	 if(userLang==ko){
	 FacesContext.getCurrentInstance().getViewRoot().setLocale(new Locale("en"));
	 }else{
	 FacesContext.getCurrentInstance().getViewRoot().setLocale(new Locale("ko"));
	 }
	 } */
</script>


</html>