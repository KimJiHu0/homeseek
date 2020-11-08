function goDelMessage(message_no){
	$.ajax({
		type : "post",
		url : "deletesenmsg.do",
		data : { "message_no" : message_no },
		success : function(del){
			if(del > 0){
				alert("보낸 쪽지가 삭제되었습니다.");
				self.close();
				opener.location.reload(true);
			} else {
				alert("보낸 쪽지 삭제가 실패하였습니다.");
			}
		},
		error : function(){
			alert("실패");
		}
	})
}

