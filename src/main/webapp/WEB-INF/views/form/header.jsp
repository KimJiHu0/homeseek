<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMESEEK</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
</head>
<body>
	<header> 
		<div class="header">
			<span class="logo">
				<a href="#">HOME<span>SEE</span>K</a>
			</span>
			
			<span class="nav">

				<a href="#">전체 방 조회</a> 
				<a href="insertRoom.do">방 올리기</a> 
				
				<div class="dropdown">
 					 <button class="dropbtn">게시판</button>
  						<div class="dropdown-content">
    						<a href="#">공지사항</a>
    						<a href="#">Q & A</a>
  						</div>
				</div>
								
				<a href="#">채팅</a> 
				<a href="#">후원하기</a> 
				<a href="#">Kr | En</a> 
				<span class="login">
					<a href="#">LOGIN | REGIST</a>
				</span>
			</span>
		</div>
	</header>
</body>
</html>