var socket;

onload=function(){
	connectWs();
}

function connectWs(){
	socket = new WebSocket('ws://localhost:8787/homeseek/message.do');
	
	socket.onopen = function(){
		console.log(" 정보 : 연결됨 ");
	}
	
	socket.onmessage = function(evt){
		var data = evt.data;
		console.log("알랏데이터 : "+data);
		var options = {
				icon : "resources/img/mainicon.png"
		}
		var notification = new Notification(" [ homeseek ]\n" + data + "\n", options);
		console.log("alert.js노티 : "+notification);
		
		// 알림을 클릭했을 때
		notification.onclick = function(event){
			event.preventDefault();
			location.href="mypagemyremsglist.do";
		}
		
	}
	
	/*socket.onclose = function(){
		console.log(" 연결 끊김 ");
	}*/
	
	socket.onerror = function(err){
		console.log(" 에러 : " + err);
	}
}