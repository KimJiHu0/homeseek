<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.mvc.homeseek.model.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="resources/js/multiChat.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/multiChat.css">
</head>
<body>

	<%
		MemberDto insert_dto = (MemberDto) request.getSession().getAttribute("login");
		String name = insert_dto.getMember_name();
	%>
	

	<input type="text" id="nickname" value="<%= name%>"  readonly>
    <input type="button" id="enterBtn" value="입장">
    <input type="button" id="exitBtn" value="나가기">
    
    <div id="text">
    <div id="chatArea">
    	<div id="chatMessageArea">
    	</div>
    </div>
    <br/>
    <div id="textMessage">
    
   
    </div>
    </div>
 
    <div class="mes">
    <div class="input-div">
        <textarea id="message" placeholder="Press Enter for send message."></textarea>
    </div>
    
    </div>
    <footer>
    <input type="button" id="sendBtn" value="전송">
    </footer>
</body>
</html>