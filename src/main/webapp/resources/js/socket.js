/*var socket = null;

onload=function(){
	connectWs();
}

function connectWs(){
	sock = new SockJS("ws://localhost:8787/homeseek/message.do");
	
	socket = sock;
	
	sock.onopen = function(){
		alert(" 정보 : 연결됌 ");
	}
	
	sock.onmessage = function(evt){
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
	
	sock.onclose = function(){
		alert(" 연결 끊김 ");
	}
	
	sock.onerror = function(err){
		alert(" 에러 : " + err);
	}
}*/