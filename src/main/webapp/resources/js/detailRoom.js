var num=1;

function prevGallery(){
   num--;
   if(num < 1){
      num=5;
   }
   document.getElementById("gallery").src="resources/img/img0" +num+ ".jpg";
   return false; /* => 이벤트 전파 막기  => naver로 가는 것을 막는다. */
}

function nextGallery(){
   num++;
   if(num > 5){
      num=1;
   }
   document.getElementById("gallery").src = "resources/img/img0" +num+ ".jpg";
   return false;
}