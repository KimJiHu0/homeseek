
	var empJ = /\s/g;
	//아이디 정규식
	///^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var idJ = /^[a-z0-9]{2,12}$/; 
	// 비밀번호 정규식
	var pwJ = /^[a-z0-9]{4,12}$/; 
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;

$(function(){
	document.getElementById("phone_check").style.display = "none";
	document.getElementById("phoneCheck").style.display = "none";
	$('#select_email').change(function(){ 
		$("#select_email option:selected").each(function () {
			if($(this).val()== '1'){ //직접입력일 경우
				$("#email").val(''); //값 초기화 
				$("#email").attr("disabled",false); //활성화 
				}else{ //직접입력이 아닐경우 
					$("#email").val($(this).val()); //선택값 입력 
					document.getElementById('email').readOnly = true;

					} 
			}); 
		});

	
	$('#member_id').blur(function(){
   	 if (idJ.test($('#member_id').val())) {
   		 	$('#id_check').text('');
		} else {
			$('#id_check').text('아이디 입력하세요(소문자,숫자)');
			$('#id_check').css('color', 'red');
			$('#id_check').val('');
			$('#member_id').focus();
			
		}
    })
   /*  $('#member_id').blur(function(){
    	
		 $.ajax({
	     type:"POST",
	     url:"/homeseek/checkid.do",
	     data:{
	            "member_id":$('#member_id')
	     },
	     success:function(data){	//data : checkSignup에서 넘겨준 결과값
	            if($.trim(data)=="YES"){
	               if($('#member_id').val()!=''){ 
	            	   $("#id_check").text("사용가능한 아이디입니다");
	            	   $("#id_check").css("color", "blue");
	        
	               }
	           	}else{
	               if($('#member_id').val()!=''){
	            	   $("#id_check").text("사용중인 아이디입니다");
	            	   $("#id_check").css("color", "red");
	            	   $("#reg_submit").attr("disabled", true);
	                   $('#member_id').val('');
	                   $('#member_id').focus();
	               }
	            }
	         }
	    })
    	
    	
    	
    	
     })
	*/

		
	

	
	//아이디 관련
    $('#select_email').blur(function(){
    	
		 $.ajax({
	     type:"post",
	     url:"checkid.do",
	     data:{
	            "member_id":$('#member_id').val() +'@'+ $('#email').val()
	     },
	     success:function(data){	//data : checkSignup에서 넘겨준 결과값
	            if($.trim(data)=="YES"){
	               if($('#member_id').val()!=''){ 
	            	   $("#id_check").text("사용가능한 아이디입니다");
	            	   $("#id_check").css("color", "blue");
	        
	               }
	           	}else{
	               if($('#member_id').val()!=''){
	            	   $("#id_check").text("사용중인 아이디입니다");
	            	   $("#id_check").css("color", "red");
	            	   $("#reg_submit").attr("disabled", true);
	                   $('#member_id').val('');
	                   $('#member_id').focus();
	               }
	            }
	         }
	    })
    	
    	
    	
    	
     })
	
     //비밀번호 관련
     $('#member_pw').blur(function(){
    	 if (pwJ.test($('#member_pw').val())) {
				$("#memberPw").text('사용 가능');
				$('#memberPw').css('color', 'blue');
		} else {
			$('#memberPw').text('숫자 or 문자로만 4~12자리 입력, 대문자 입력 불가');
			$('#memberPw').css('color', 'red');
			$('#member_pw').val('');
			
		}
     })
     //비밀번호 확인 관련
     $('#pw_check').blur(function(){
    	
	   if($('#member_pw').val() != $('#pw_check').val()){
	    	if($('#pw_check').val()!=''){
	    		$("#pwCheck").text("비밀번호가 일치하지 않습니다");
	    		$("#pwCheck").css("color", "red");
	    	    $('#pw_check').val('');
	          $('#member_pw').focus();
	       }
	    }else{
	    	$("#pwCheck").text("비밀번호가 일치합니다");
    		$("#pwCheck").css("color", "blue");
	    }
	})
		/*$("#member_email").blur(function() {
		if (mailJ.test($(this).val())) {
				$("#emailCheck").text('사용 가능');
				$('#emailCheck').css('color', 'blue');
		} else {
			$('#emailCheck').text('이메일 양식에 맞춰주세요');
			$('#emailCheck').css('color', 'red');
		}
	});*/
  
	
	//본인인증 번호 보내기
	$('#sendSms').click(function(){
			 $.ajax({
		     type:"post",
		     url:"checkphone.do",
		     data:{
		            "member_phone":$('#member_phone').val(),
		            "member_name":$('#member_name').val()
		     },
		     success:function(data){	//data : checkSignup에서 넘겨준 결과값
		            if($.trim(data)=="YES"){
		               if($('#member_phone').val()!=''){ 
		            	   if (phoneJ.test($('#member_phone').val())) {
		           			if($('#member_phone').val() != "" && $('#member_name').val() != "" ){
		           				document.getElementById("phone_check").style.display = "block";
		           				document.getElementById("phoneCheck").style.display = "block";
		           				var phoneNumber = $('#member_phone').val();
		           				alert("인증번호 발송")
		           				 $("#memberPhone").text("");


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
		           								$("#pCheck").text("본인 인증 완료!");
		           								 $("#submit").on ("click", function(){
		           									 if($('#member_pw').val() != $('#pw_check').val()){
		           										 $("#pwCheck").text("비밀번호가 일치하지 않습니다");
		           										 $("#pwCheck").css("color", "red");
		           								    	 $('#pw_check').val('');
		           								         $('#member_pw').focus();
		           								         return false;
		           									 }
		           								    	
		           										if($("#member_id").val()==""){
		           											alert("아이디를 입력해주세요.");
		           											$("#userId").focus();
		           											return false;
		           										}
		           										else if($("#member_pw").val()==""){
		           											alert("비밀번호를 입력해주세요.");
		           											$("#member_pw").focus();
		           											return false;
		           										}
		           										else if($("#pw_check").val()==""){
		           											alert("비밀번호를 한번 더 입력해주세요.");
		           											$("#pw_check").focus();
		           											return false;
		           										}
		           										else if($("#member_name").val()==""){
		           											alert("성명을 입력해주세요.");
		           											$("#member_name").focus();
		           											return false;
		           										}
		           										else if($("#member_email").val()==""){
		           											alert("이메일을 입력해주세요.");
		           											$("#member_email").focus();
		           											return false;
		           										}
		           										else if($("#member_phone").val()==""){
		           											alert("휴대폰 번호를 입력해주세요");
		           											$("#member_phone").focus();
		           											return false;
		           										}
		           										else if($("#phone_check").val()==""){
		           											alert("휴대폰 인증번호를 입력해주세요.");
		           											$("#phone_check").focus();
		           											return false;
		           										}
		           										//alert("회원가입이 완료되었습니다. 다시 로그인 해주세요 !")
		           									});

		           								

		           							}else if($.trim(res) != $('#phone_check').val() || $('#phone_check').val('')){
		           								alert("인증 실패!");
		           								$('#phone_check').val('');
		           								$('#phone_check').focus();
		           							}
		           					
		           						})
		           						 $("#submit").on ("click", function(){
		           							 if($('#member_pw').val() != $('#pw_check').val()){
		           								 $("#pwCheck").text("비밀번호가 일치하지 않습니다");
		           								 $("#pwCheck").css("color", "red");
		           						    	 $('#pw_check').val('');
		           						         $('#member_pw').focus();
		           						         return false;
		           							 }
		           							 else if($.trim(res) != $('#phone_check').val()){
		           								 if($('#pCheck').text()==''){
		           									 return false
		           								 }else{
		           									 alert("본인 인증을 확인해주세요");
		           							 	 	$("#phone_check").focus();
		           							 	 	return false;
		           								 }
		           							 }
		           						 })
		           				
		           	        
		           					}
		           			
		           				})
		           			}else if($('#member_name').val('')){
		           				$('#memberPhone').text('이름을  입력해주세요');
			           			$('#memberPhone').css('color', 'red');
			           			$('#memberPhone').val('');
			           			$('#member_name').focus();
		
		           			}
		           	}else{
		           			$('#memberPhone').text('올바른 번호를 입력해주세요');
		           			$('#memberPhone').css('color', 'red');
		           			$('#memberPhone').val('');
		           			$('#memberPhone').focus();
		           		}
		        
		               }
		               else {
	           				$('#memberPhone').text('번호를  입력해주세요');
		           			$('#memberPhone').css('color', 'red');
		           			$('#memberPhone').val('');
		           			$('#member_phone').focus();
	
	           			}
		           	}else{
		               if($('#member_phone').val()!=''){
		            	   $("#memberPhone").text("이미 등록된 번호입니다");
		            	   $("#memberPhone").css("color", "red");
		                   $('#member_phone').val('');
		                   $('#member_phone').focus();
		               }
		            }
		         }
		    })
	    	
	  

		
	});
    $("#submit").on ("click", function(){
    	if($('#pCheck').text() == ''){
    		alert("휴대폰 인증을 진행해주세요");
    		 $('#member_phone').focus();
    		 return false;
    	}else{
    		alert("회원가입 완료!");
    	}
    })
    
   

	
		
	
})









