var socket;

onload=function(){
	connectWs();
}

function connectWs(){
	socket = new WebSocket('ws://localhost:8787/homeseek/message.do');
	
	socket.onopen = function(){
		console.log(" 정보 : 연결됌 ");
	}
	
	socket.onmessage = function(){
		console.log(" 메세지 보내기 ");
	}
	
	socket.onclose = function(){
		console.log(" 연결 끊김 ");
	}
	
	socket.onerror = function(err){
		console.log(" 에러 : " + err);
	}
}