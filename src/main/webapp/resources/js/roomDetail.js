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

// 신고버튼을 클릭했을 때 함수를 호출
function userReport(){
	open("reportMember.jsp", "", "width=300, height=400");
}
