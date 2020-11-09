var socket;

window.onload = function() {
   
   // 데스크탑 알림 권한 요청
   Notification.requestPermission(function(result){
      // 요청 거절
      if(result === 'denied'){
         return;
      } else {
         return;
      }
   })
   connectWs();
   
/*   
   if($("li").hasClass("searchbox")){ //로그인되거나, 검색창이 나올때 크기 update되게
      $(".nav").width("900px");
      $(".nav2").width("1000px");
   }
*/   
   $('#navsearchtxt').keydown(function(e){ /*엔터누르면 검색되도록*/
      if(e.keyCode == 13){
         $('.navsearchform').submit();
      }
   });
       

};

function chat(){
   window.open("chat.do", "a", "width=400, height=600, left=100, top=50");
}

function connectWs(){
	socket = new WebSocket('ws://homeseek.ml/homeseek/message.do');
	
	socket.onopen = function(){
		
		console.log(" 정보 : 연결됌 ");
	}
	
	socket.onmessage = function(evt){
		var data = evt.data;
		var options = {
				icon : "resources/img/mainicon.png"
		}
		var notification = new Notification(" [ homeseek ]\n" + data + "\n", options);
		
		// 알림을 클릭했을 때 원하는 곳으로 이동
		notification.onclick = function(event){
			event.preventDefault();
			location.href="mypagemyremsglist.do";
		}
	}
	
	socket.onclose = function(){
		console.log(" 연결 끊김 ");
	}
	
	socket.onerror = function(err){
		console.log(" 에러 : " + err);
	}
}

function myPage(){
   
   open("mypagemyinfo.do", "", "width=600, height=700");
}

function myDona(){
   location.href='mypagedonalist.do';
}

function myMsg(){
   location.href='mypagemyremsglist.do';
}