//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 비밀번호 정규식
	var pwJ = /^[a-z0-9]{4,12}$/; 
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

$(function(){
	document.getElementById("phone_check").style.display = "none";
	document.getElementById("phoneCheck").style.display = "none";
	//아이디 관련
    $('#member_id').blur(function(){
    	if (idJ.test($('#member_id').val())) {
		 $.ajax({
	     type:"POST",
	     url:"checkid.do",
	     data:{
	            "member_id":$('#member_id').val()
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
    	} else {
    		$('#id_check').text('e-mail형식으로 입력해주세요');
    		$('#id_check').css('color', 'red');
    		$('#member_id').val('');
    		$('#member_id').focus();
    	}
     })
     //비밀번호 관련
     $('#member_pw').blur(function(){
    	 if (pwJ.test($('#member_pw').val())) {
				$("#memberPw").text('사용 가능');
				$('#memberPw').css('color', 'blue');
		} else {
			$('#memberPw').text('숫자 or 문자로만 4~12자리 입력');
			$('#memberPw').css('color', 'red');
			$('#member_pw').val('');
			$('#member_pw').focus()
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
		if (phoneJ.test($(this).val())) {
			if($('#member_phone').val() != ""){
				document.getElementById("phone_check").style.display = "block";
				document.getElementById("phoneCheck").style.display = "block";
				var phoneNumber = $('#member_phone').val();
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
							
								alert("휴대폰 인증이 정상적으로 완료되었습니다.");
							}else if($.trim(res) != $('#phone_check').val() || $('#phone_check').val('')){
								alert("인증 실패!");
								$('#phone_check').val('');
								$('#phone_check').focus();
							}
					
						})
				
	        
					}
			
				})
			}
	}else{
			$('#memberPhone').text('올바른 번호를 입력해주세요');
			$('#memberPhone').css('color', 'red');
			$('#memberPhone').val('');
			$('#memberPhone').focus();
		}
	});

	
    //회원 등록 버튼
    $("#submit").on ("click", function(){
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
	});

	
		
	
})









