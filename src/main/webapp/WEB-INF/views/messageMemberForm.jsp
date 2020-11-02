<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 쪽지보내기</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<!-- SummerNote.js -->
<script src="${pageContext.request.contextPath}/resources/js/summerNote.js" type="text/javascript"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/messageMemberForm.css" type="text/css" />

<script type="text/javascript">
// 취소버튼 누르면 창 꺼지기
function messageFormClose(){
	self.close();
}
</script>

</head>
<body>
	<div id="firstbox">
		<p class="iconbox" id="icon">HOME<span class="iconbox" id="iconcolor">SEE</span>K</p>
	</div>
	
	<div class="secondbox">
		<form action="messagememberres.do" method="post" onsubmit="messgae();">
			<input type="hidden" value="${message_senuser.member_id }" name="message_senid"/>
			<input type="hidden" value="${message_reuser.member_id }" name="message_reid"/>
			<table class="message-content">
				<col width="180">
				<col width="180">
				<col width="180">
				<col width="180">
				<tr class="message_tr">
					<th class="message_th">쪽지받는 아이디</th>
					<th class="message_th">쪽지받는 이름</th>
					<th class="message_th">쪽지보내는 아이디</th>
					<th class="message_th">쪽지보내는 이름</th>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="message_tr">
					<td class="message_td">${message_reuser.member_id }</td>
					<td class="message_td">${message_reuser.member_name }</td>
					<td class="message_td">${message_senuser.member_id }</td>
					<td class="message_td">${message_senuser.member_name }</td>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="message_tr">
					<th class="message_th">제목</th>
					<td colspan="3">
						<input type="text" placeholder="제목을 입력해주세요." class="message_title" name="message_title"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="message_tr">
					<th class="message_th">내용</th>
					<td colspan="4">
						<textarea class="summernote" name="message_content"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="messagebtntwo">
					<td colspan="2">
						<input type="submit" value="보내기" class="messagebtn"/>
					</td>
					<td colspan="2">
						<input type="button" value="취소" class="messagebtn" onclick="javascript:messageFormClose()"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>