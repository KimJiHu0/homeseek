function goSendMessage(message_senid){
		self.close();
		open('messagemember.do?room_id='+message_senid, "", "width=750, height=800");
	}
	
	function goDelMessage(message_no){
		$.ajax({
			type : "post",
			url : "deleteremsg.do",
			data : { "message_no" : message_no },
			success : function(del){
				if(del > 0){
					alert("받은 쪽지가 삭제되었습니다.");
					self.close();
					opener.location.reload(true);
				} else {
					alert("받은 쪽찌 삭제가 실패하였습니다.");
				}
			},
			error : function(){
				alert("실패");
			}
		})
	}