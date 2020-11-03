window.onload = function() {
	
	
	if($("li").hasClass("searchbox")){/* 로그인되거나, 검색창이 나올때 크기 update되게*/
		$(".nav").width("830px");
		$(".nav2").width("940px");
	}
	
	$('#navsearchtxt').keydown(function(e){ /*엔터누르면 검색되도록*/
		if(e.keyCode == 13){
			$('.navsearchform').submit();
		}
	});
	    
	
	$('#chat').click(function(){
	
		window.open("chat.do", "a", "width=400, height=300, left=100, top=50");
		
	});
}
var socket;

onload=function(){
	
	Notification.requestPermission(function(result){
		// 요청을 거절하면,
		if(result === 'denied'){
			return;
		} else {
			// 요청을 허용하면
			return;
		}
	})
	
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