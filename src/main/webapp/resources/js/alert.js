var socket;

onload=function(){
	connectWs();
}

function connectWs(){
	socket = new WebSocket('ws://localhost:8787/homeseek/message.do');
	
	socket.onopen = function(){
		console.log(" 정보 : 연결됌 ");
	}
	
	socket.onmessage = function(evt){
		var data = evt.data;
		var options = {
				icon : "resources/img/mainicon.png"
		}
		var notification = new Notification(" [ homeseek ]\n" + data + "\n", options);
		
		// 알림을 클릭했을 때
		notification.onclick = function(event){
			event.preventDefault();
			window.open('http://www.naver.com', '_blank');
		}
		
	}
	
	socket.onclose = function(){
		console.log(" 연결 끊김 ");
	}
	
	socket.onerror = function(err){
		console.log(" 에러 : " + err);
	}
}