function normal(){
	 $.ajax({
	     type:"post",
	     url:"normal.do",
	     data:{
	            "member_enabled":$('#member_enabled').val()
	     },
	     success:function(data){	//data : checkSignup에서 넘겨준 결과값
	            if($.trim(data)=="YES"){
	               if($('#memberId').val()!=''){ 
	            	   $("#id_check").text("사용가능한 아이디입니다");
	            	   $("#id_check").css("color", "blue");
	        
	               }
	           	}else{
	               if($('#memberId').val()!=''){
	            	   $("#id_check").text("사용중인 아이디입니다");
	            	   $("#id_check").css("color", "red");
	            	   $("#reg_submit").attr("disabled", true);
	                   $('#member_id').val('');
	                   $('#member_id').focus();
	               }
	            }
	         }
	    })
    	
    
}