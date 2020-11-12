function loginPrc(){
   var member_id= $("#member_id_modal").val().trim();
   var member_pw= $("#member_pw_modal").val().trim();
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
        	 console.log(msg);
            if(msg.check == "success"){//정상로그인
            	
            	//location.href="redirect:/main.do";
            	location.href=location.href;
            	alert("로그인 되었습니다.Homeseek을 이용하실수 있습니다~")
               //$("#loginchk").show();-->
               //$("#loginchk").html("ID ,PW가 입력되었습니다");
            }else if(msg.check == "ban_D"){
            	$("#loginchk").show();
                $("#loginchk").html("탈퇴한 회원입니다. 다시 회원가입해주세요.");
            }else if(msg.check == "ban_B"){
            	$("#loginchk").show();
                $("#loginchk").html("차단된 회원입니다. 고객센터에 문의 바랍니다.");	    
            }else if(msg.check == "idpwfail"){
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

/*
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
*/