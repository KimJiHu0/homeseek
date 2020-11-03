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
</head>
<body>
	<div id="firstbox">
		<p class="iconbox" id="icon">HOME<span class="iconbox" id="iconcolor">SEE</span>K</p>
	</div>
	
	<div class="secondbox">
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
					<td class="message_td" id="message_reid">${message_reuser.member_id }</td>
					<td class="message_td">${message_reuser.member_name }</td>
					<td class="message_td" id="message_senid">${message_senuser.member_id }</td>
					<td class="message_td">${message_senuser.member_name }</td>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="message_tr">
					<th class="message_th">제목</th>
					<td colspan="3">
						<input type="text" placeholder="제목을 입력해주세요." class="message_title" name="message_title" id="message_title"/>
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
						<input type="button" value="보내기" class="messagebtn" onclick="javascript:sendMessage();"/>
					</td>
					<td colspan="2">
						<input type="button" value="취소" class="messagebtn" onclick="javascript:messageFormClose()"/>
					</td>
				</tr>
			</table>
	</div>
</body>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">

var socket;

onload=function(){
	connectWs();
}

function connectWs(){
	socket = new WebSocket('ws://localhost:8787/homeseek/message.do');
	
	socket.onopen = function(){
		alert(" 정보 : 연결됌 ");
	}
	
	socket.onmessage = function(evt){
		var data = evt.data;
		alert(" 받은 메세지 : " + data + "\n");
		
		// 모달알림
		var toastTop = app.toast.create({
			text : " 알림 : " + data + "\n",
			postition : 'top',
			closeButton : true
		})
		toastTop.open();
	}
	
	socket.onclose = function(){
		alert(" 연결 끊김 ");
	}
	
	socket.onerror = function(err){
		alert(" 에러 : " + err);
	}
}

</script>
<script type="text/javascript">

// 취소버튼 누르면 창 꺼지기
function messageFormClose(){
	self.close();
}

function sendMessage(){
	var message_senid = '${message_senuser.member_id}';
	var message_reid = '${message_reuser.member_id}';
	var message_title = $("#message_title").val();
	var message_content = $(".summernote").val();
	
	var data = {
			"message_senid" : message_senid,
			"message_reid" : message_reid,
			"message_title" : message_title,
			"message_content" : message_content
	}
	if(message_title == null || message_title == '' || message_content == null || message_content == ''){
		alert("제목 혹은 내용을 전부 입력해주세요.");
	} else {
		$.ajax({
			type : "post",
			dataType : "json",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			url : "messagememberres.do",
			success : function(info){
				if(info.res > 0){
					if(socket){
						var socketMsg = "message," + info.message_senid + "," + info.message_reid;
						alert("socketMsg : " + socketMsg);
						socket.send(socketMsg);
					}
					alert("쪽지보내기가 성공적으로 완료되었습니다.");
					self.close();
				} else {
					alert("쪽지보내기가 실패하였습니다.");
				}
			},
			error : function(){
				alert("실패");
			}
		})
	}
}
</script>
</html>