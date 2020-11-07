<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek: 받은 쪽지 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMyremsgDetail.css" type="text/css" />
</head>
<body>
	<div id="firstbox">
		<p class="iconbox" id="icon">HOME<span class="iconbox" id="iconcolor">SEE</span>K</p>
	</div>
	<div class="msginfo">
		<div class="msg-remember">
			<div class="msg-remember-title">쪽지 보낸 아이디</div>
			<div class="msg-remember-title">쪽지 보낸 사람 이름</div>
		</div>
		<div class="msg-remember-info">
			<div class="msg-remember-content">${messagedto.message_senid }</div>
			<div class="msg-remember-content">${memberdto.member_name }</div>
		</div>
		<div class="msg-message-title">
			<div class="">쪽지 제목</div>
			<div class="">${messagedto.message_title }</div>
		</div>
		<div class="msg-message-content">
			<div class="">쪽지 내용</div>
			<div class="">${messagedto.message_content }</div>
		</div>
		<div class="msg-message-regdate">
			<div class="">쪽지 작성일</div>
			<div class="">${messagedto.message_date }</div>
		</div>
	</div>
	<!-- 쪽지 보낸 사람 아이디, 쪽지 보낸 사람 이름, 쪽지 제목, 쪽지 내용, 쪽지 작성일, -->
	<!-- 600 / 700임 -->
	<%-- ${messagedto.message_senid } / ${memberdto.member_name } / ${messagedto.message_title } / ${messagedto.message_content } / ${messagedto.message_date } --%>
</body>
</html>