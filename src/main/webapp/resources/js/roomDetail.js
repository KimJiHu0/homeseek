/*var num=1;

function prevRoom(){
   num--;
   if(num < 1){
      num=5;
   }
   document.getElementById("gallery").src="resources/img/img0" +num+ ".jpg";
   return false;  => 이벤트 전파 막기  => naver로 가는 것을 막는다. 
}


function nextRoom(){
   num++;
   if(num > 5){
      num=1;
   }
   document.getElementById("gallery").src = "resources/img/img0" +num+ ".jpg";
   return false;
}*/
window.onload=function(){
	document.getElementById("reportbtn").onclick = function(){
		$("#reportbody").append(
				"<h1>안녕<h1>" +
				"<h1>${id}</h1>"
		);
	}
}
