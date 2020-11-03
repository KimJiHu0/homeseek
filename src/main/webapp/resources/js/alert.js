var socket;

onload=function(){
	connectWs();
}

function connectWs(){
	socket = new WebSocket('wss://homeseek.ml/homeseek/message.do');
	
	socket.onopen = function(){
		console.log(" 정보 : 연결됌 ");
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
		console.log(" 연결 끊김 ");
	}
	
	socket.onerror = function(err){
		console.log(" 에러 : " + err);
	}
}