<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek: 받은 쪽지 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMyremsgDetail.css" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypageMyremsgDetail.js" type="text/javascript"></script>
</head>
<body>
	<div id="firstbox">
		<p class="iconbox" id="icon">HOME<span class="iconbox" id="iconcolor">SEE</span>K</p>
	</div>
	<div class="msginfo">
		<table class="msg-info-detail">
			<col width="150px"/>
			<col width="150px"/>
			<col width="150px"/>
			<col width="150px"/>
			<tr>
				<td colspan="4" class="a"></td>
			</tr>
			<tr class="tr-height">
				<th colspan="2" class="msg-info-title">쪽지 보낸 ID</th>
				<th colspan="2" class="msg-info-title">쪽지 보낸 사람</th>
			</tr>
			<tr>
				<td colspan="4" class="a"></td>
			</tr>
			<tr class="tr-height">
				<td colspan="2" class="msg-info-content">${messagedto.message_senid }</td>
				<td colspan="2" class="msg-info-content">${memberdto.member_name }</td>
			</tr>
			<tr>
				<td colspan="4" class="a"></td>
			</tr>
			<tr class="tr-height">
				<th class="msg-info-title">쪽지 제목</th>
				<td colspan="3">${messagedto.message_title }</td>
			</tr>
			<tr>
				<td colspan="4" class="a"></td>
			</tr>
			<tr class="tr-content-height">
				<th class="msg-info-title">쪽지 내용</th>
				<td colspan="3">
					<div class="">${messagedto.message_content }</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="a"></td>
			</tr>
			<tr class="tr-height">
				<th colspan="2" class="msg-info-title">쪽지 보낸 날짜</th>
				<td colspan="2" class="msg-info-content"><fmt:formatDate value="${messagedto.message_date }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td colspan="4" class="a"></td>
			</tr>
			<tr>
				<td align="right" colspan="4">
					<input type="button" value="답장" onclick="javascript:goSendMessage('${messagedto.message_senid}')"/>
					<input type="button" value="삭제" onclick="javascript:goDelMessage(${messagedto.message_no})"/>
				</td>
			</tr>
		</table>
	</div>
	<!-- 쪽지 보낸 사람 아이디, 쪽지 보낸 사람 이름, 쪽지 제목, 쪽지 내용, 쪽지 작성일, -->
	<!-- 600 / 700임 -->
	<%-- ${messagedto.message_senid } / ${memberdto.member_name } / ${messagedto.message_title } / ${messagedto.message_content } / ${messagedto.message_date } --%>
</body>
</html>