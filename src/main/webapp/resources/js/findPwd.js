$(function(){
	document.getElementById("phone_check").style.display = "none";
	document.getElementById("phoneCheck").style.display = "none";
	//임시비밀번호 발송 버튼 클릭시
$('#sendSms').click(function(){
		
		$.ajax({
	     type:"POST",
	     url:"findpw.do",
	     data:{//아래 3개의 값 controller findpw.do로 전달
	            "pwd_name" : $('#pwd_name').val(),
	    	 	"pwd_phone":$('#pwd_phone').val(),
	    	 	"pwd_id":$('#pwd_id').val()
	     },
	     //유효성검사 : name,phone,id
	     success:function(data){	
	    	 //값이 비었으면....
	    	 if($('#pwd_name').val()!='' && $('#pwd_phone').val()!='' && $('#pwd_id').val()!='' ){
	            if($.trim(data)=="YES"){
	               if($('#pwd_phone').val()!=''){ 
	            	   $("#idPhone").text("등록된 회원이 아닙니다 이름 또는 휴대폰번호를 확인해주세요");
	            	   $("#idPhone").css("color", "red");
	            	   $('#pwd_phone').val('');
	            	   $('#pwd_name').val('');
	            	   $('#pwd_name').focus();
	               }
	           	}else{
	           		//임시비밀번호 발송
	               if($('pwd_phone').val()!=''){
	            	   $("#idPhone").text("");
	            	   	document.getElementById("phone_check").style.display = "block";
	            		document.getElementById("phoneCheck").style.display = "block";
	            	   var phoneNumber = $('#pwd_phone').val();
	            	   alert("임시비밀번호 발송")
	            	   $.ajax({
	   					type: "POST",
	   					url: "sendsms.do",
	   					data: {
	   						"phoneNumber" : phoneNumber
	   					},
	   					success: function(res){
	   						//임시비밀번호  확인
	   						$('#phoneCheck').click(function(){
	   							if($.trim(res) == $('#phone_check').val()){
	   								$('#idCheck').text("임시비밀번호  확인이 완료되었습니다. 회원님의 비밀번호는 임시비밀번호로 대체되었습니다.");
	   								if($('#idCheck').text == ''){
	   									$("#submit").on ("click", function(){
	   										alert("임시비밀번호가 정확히 입력해 주세요.")
	   									})
	   								}else if($('#idCheck').text != ''){
	   								 $("#submit").on ("click", function(){
	   								//만약  전화번호,이름,id(이메일)이 빈칸이 아니라면...	 
	   								if($('#pwd_phone').val() != '' && $('#pwd_name').val() != '' && $('#pwd_id').val() != ''){
	   									$.ajax({
	   					   					type: "POST",
	   					   					url: "selectpw.do",
	   					   					data: {
	   					   						"pwd_name" : $('#pwd_name').val(),
	   					   						"pwd_phone":$('#pwd_phone').val(),
	   					   						"pwd_id":$('#pwd_id').val() 
	   					   					}
	   					   					//success: function(res){
	   					   						//체크
	   					   							//$('#selectId').text("아이디는" + res + "입니다.");
	   					   						//}
	   					   						
	   					   						
	   					   					
	   									});
	   									
	   								 }
	   								//만약  전화번호,이름,id(이메일)이 빈칸이 있다면....
	   								else if($('#pwd_phone').val() == '' || $('#pwd_name').val() == ''|| $('#pwd_id').val() == '' ){
   										alert("이름 또는 휴대폰번호 또는 아이디를 입력해주세요");
   									}
	   									
	   								 })
	   								}
	   								 
	   							}else{
	   								alert("임시비밀번호를 확인해주세요")
	   								$('#phone_check').focus();
	   							}
	   						})
	   					
	   					}
	   				
	            	   });
	               }
	            }
	         }
	    	 else{
		    	 alert("이름, 휴대폰 번호, 아이디를 입력해주세요")
	    	 }
	     }
	        });
	              		
	});

	$("#submit").on ("click", function(){
		if($('#idCheck').text()==''){
			alert("회원님의 휴대폰으로 임시비밀번호를 전송했습니다.임시비밀번호 확인을 진행해주세요")
		}
	})
})