$(function(){
	document.getElementById("phone_check").style.display = "none";
	document.getElementById("phoneCheck").style.display = "none";
$('#sendSms').click(function(){
		
		$.ajax({
	     type:"POST",
	     url:"findid.do",
	     data:{
	            "id_name" : $('#id_name').val(),
	    	 	"id_phone":$('#id_phone').val() 
	     },
	     success:function(data){	
	    	 if($('#id_name').val()!='' && $('#id_phone').val()!='' ){
	            if($.trim(data)=="YES"){
	               if($('#id_phone').val()!=''){ 
	            	   $("#idPhone").text("등록된 회원이 아닙니다 이름 또는 휴대폰번호를 확인해주세요");
	            	   $("#idPhone").css("color", "red");
	            	   $('#id_phone').val('');
	            	   $('#id_name').val('');
	            	   $('#id_name').focus();
	               }
	           	}else{
	               if($('id_phone').val()!=''){
	            	   $("#idPhone").text("");
	            	   	document.getElementById("phone_check").style.display = "block";
	            		document.getElementById("phoneCheck").style.display = "block";
	            	   var phoneNumber = $('#id_phone').val();
	            	   alert("인증번호 발송")
	            	   $.ajax({
	   					type: "POST",
	   					url: "sendsms.do",
	   					data: {
	   						"phoneNumber" : phoneNumber
	   					},
	   					success: function(res){
	   						//인증번호 확인
	   						$('#phoneCheck').click(function(){
	   							if($.trim(res) == $('#phone_check').val()){
	   								$('#idCheck').text("휴대폰 인증이 정상적으로 완료되었습니다.");
	   								if($('#idCheck').text == ''){
	   									$("#submit").on ("click", function(){
	   										alert("휴대폰 인증이 완료되지 않았습니다.")
	   									})
	   								}else if($('#idCheck').text != ''){
	   								 $("#submit").on ("click", function(){
	   								if($('#id_phone').val() != '' && $('#id_name').val() != '' ){
	   									$.ajax({
	   					   					type: "POST",
	   					   					url: "selectid.do",
	   					   					data: {
	   					   						"id_name" : $('#id_name').val(),
	   					   						"id_phone":$('#id_phone').val() 
	   					   					},
	   					   					success: function(res){
	   					   						
	   					   							$('#selectId').text("아이디는" + res + "입니다.");
	   					   						}
	   					   						
	   					   						
	   					   					
	   									});
	   									
	   								 }
	   								else if($('#id_phone').val() == '' || $('#id_name').val() == '' ){
   										alert("이름 또는 휴대폰번호를 입력해주세요");
   									}
	   									
	   								 })
	   								}
	   								 
	   							}else{
	   								alert("인증번호를 확인해주세요")
	   								$('#phone_check').focus();
	   							}
	   						})
	   					
	   					}
	   				
	            	   });
	               }
	            }
	         }
	    	 else{
		    	 alert("이름, 휴대폰 번호를 입력해주세요")
	    	 }
	     }
	        });
	              		
	});

	$("#submit").on ("click", function(){
		if($('#idCheck').text()==''){
			alert("휴대폰 인증을 진행해주세요")
		}
	})
})