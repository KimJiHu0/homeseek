// 비밀번호 정규식
    var pwJ = /^[a-z0-9]{4,12}$/;
$(function(){
	document.getElementById("pwdsubmit").style.display = "none";
	document.getElementById("new_pwd").style.display = "none";
	document.getElementById("pwd_new").style.display = "none";
	document.getElementById("phone_check").style.display = "none";
	document.getElementById("phoneCheck").style.display = "none";
	// 인증번호 발송 버튼 클릭시
$('#sendSms').click(function(){
		// findpw.do
		$.ajax({
	     type:"POST",
	     url:"findpw.do",
	     data:{// 아래 3개의 값 controller findpw.do로 전달
	            "pwd_name" : $('#pwd_name').val(),
	    	 	"pwd_phone":$('#pwd_phone').val(),
	    	 	"pwd_id":$('#pwd_id').val()
	     },
	     // Jquery 유효성검사 : name,phone,id
	     success:function(data){	
	    	 // 값이 다 입력되있으면....
	    	 if($('#pwd_name').val()!='' && $('#pwd_phone').val()!='' && $('#pwd_id').val()!='' ){
	    		 // data = str 이다. /findpw.do 의 memberBiz.findPw(memberdto)에서
					// 결과에따라 str= YES or NO.
	            if($.trim(data)=="NO"){
	               if($('#pwd_phone').val()!=''){ // 존재하지 않는 계정일때...
	            	   $("#idPhone").text("등록된 회원이 아닙니다 입력정보를 확인해주세요");
	            	   $("#idPhone").css("color", "red");
	            	   $('#pwd_phone').val('');
	            	   $('#pwd_id').val('');
	            	   $('#pwd_name').val('');
	            	   $('#pwd_name').focus();
	               }
	           	}else{// 존재하는 계정일때....
	           		// 인증번호 발송
	               if($('pwd_phone').val()!=''){
	            	   $("#idPhone").text("");
	            	   	document.getElementById("phone_check").style.display = "block";
	            		document.getElementById("phoneCheck").style.display = "block";
	            	   var phoneNumber = $('#pwd_phone').val();
	            	   alert("인증번호 발송")
	            	   // sendsms.do ->인증번호 발송
	            	   $.ajax({
	   					type: "POST",
	   					url: "sendsms.do",
	   					data: {
	   						"phoneNumber" : phoneNumber
	   					},
	   					success: function(res){ // 통신이 성공적으로 이루어졌을 때 이 함수를 타게
												// 된다.
	   						// 인증번호 확인 시작
	   						$('#phoneCheck').click(function(){
	   							// 맞으면.. $.trim(res) == numStr == 인증번호
	   							if($.trim(res) == $('#phone_check').val()){
	   								$('#idCheck').text("인증번호  확인 완료되었습니다.");
	   								alert("인증되었습니다.");
	   								document.getElementById("new_pwd").style.display = "block";
	   								document.getElementById("pwd_new").style.display = "block";
	   								$('#pwd_new').blur(function(){
	   						         if (pwJ.test($('#pwd_new').val())) {
	   						                $("#pwCheck").text('사용 가능');
	   						                $('#pwCheck').css('color', 'blue');
	   						                document.getElementById("pwdsubmit").style.display = "block";
	   						        } else {
	   						            $('#pwCheck').text('숫자 or 문자로만 4~12자리 입력, 대문자 입력 불가');
	   						            $('#pwCheck').css('color', 'red');
	   						            $('#pwd_new').val('');
	   						            $('#pwd_new').focus();
	   						            document.getElementById("pwdsubmit").style.display = "none";

	   						        }
	   						     })
	   								//새 비밀번호 유효성 검사
	   								//<input type="submit"  value="비밀번호 변경하기"> 숨기기
	   							// 틀리면...
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
		    	 alert("이름, 휴대폰 번호, 아이디를 모두 입력해주세요")
	    	 }
	     }
		 });
});
	
	$("#pwdsubmit").on ("click", function(){
		if($('#pwd_name').val()==''){
			alert("비밀번호 재설정 실패!")
		}if($('#pwd_id').val()==''){
			alert("비밀번호 재설정 실패!")
		}if($('#pwd_phone').val()==''){
			alert("비밀번호 재설정 실패!")
		}
		
	})
})		