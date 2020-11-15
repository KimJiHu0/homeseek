var socket;

onload=function(){
	connectWs();
}

function connectWs(){
	// WebSocket를 열어줄 주소를 입력해줍니다.
	socket = new WebSocket('wss://homeseek.ml/message.do');
	// Socket이 열렸을 때에 실행되는 함수
	socket.onopen = function(){
		console.log(" 정보 : 연결됨 ");
	}
	// 메세지를 받았을 때에 실행되는 함수
	socket.onmessage = function(evt){
		// 받은 메세지를 evt라는 변수로 받아온다.
		// data라는 변수는 evt의 data 값을 담아준다.
		var data = evt.data;
		// Web Notification 설정
		var options = {
				// 아이콘을 설정
				icon : "resources/img/mainicon.png"
		}
		// 알림이 울리게 하는 notification이라는 변수에 Notification을 실행해준다,
		// data(받은 메세지) 와 icon 설정을 해준다.
		var notification = new Notification(" [ homeseek ]\n" + data + "\n", options);
		
		// 알림을 클릭했을 때
		notification.onclick = function(event){
			event.preventDefault();
			// 내가 받은 쪽지함으로 이동할 수 있게 location을 걸어준다.
			location.href="mypagemyremsglist.do";
		}
		
	}
	// 에러가 났을 때 실행하는 함수
	socket.onerror = function(err){
		console.log(" 에러 : " + err);
	}
}