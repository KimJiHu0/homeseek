function loginPrc(){
   var member_id= $("#member_id").val().trim();
   var member_pw= $("#member_pw").val().trim();
   var loginVal = {
         "member_id" : member_id,
         "member_pw" : member_pw
         
   }
   if(member_id == null || member_id == "" || member_pw == null || member_pw == ""){
      alert("id와pw 모두 작성해주세요");
   }else{
      $.ajax({
         type : "post",
         url : "ajaxlogin.do",
         data : JSON.stringify(loginVal),
         contentType : "application/json",
         dataType : "json",
         success : function(msg){
            if(msg.check == true){
               location.href="main.do";
               //$("#loginchk").show();-->
               //$("#loginchk").html("ID ,PW가 입력되었습니다");
            }else{
               $("#loginchk").show();
               $("#loginchk").html("ID 혹은 PW가 잘못 입력되었습니다");
            }
            
         },
         error : function(){
            alert("통신실패");
         }
      })
   }
   
}

window.onload = function() {
    
   document.getElementById("loginchk").style.display = "none"; 
   
   document.querySelector('.modal_wrap').style.display ='block';
    document.querySelector('.black_bg').style.display ='block';
    
   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    //document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
   
 
};