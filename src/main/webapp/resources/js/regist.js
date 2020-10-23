$(function(){
//아이디 중복체크
    $('#member_id').blur(function(){
        $.ajax({
	     type:"POST",
	     url:"checkid.do",
	     data:{
	            "member_id":$('#member_id').val()
	     },
	     success:function(data){	//data : checkSignup에서 넘겨준 결과값
	            if($.trim(data)=="YES"){
	               if($('#member_id').val()!=''){ 
	               	alert("사용가능한 아이디입니다.");
	               }
	           	}else{
	               if($('#member_id').val()!=''){
	                  alert("중복된 아이디입니다.");
	                  $('#member_id').val('');
	                  $('#member_id').focus();
	               }
	            }
	         }
	    }) 
     })
     $('#pw_check').blur(function(){
	   if($('#member_pw').val() != $('#pw_check').val()){
	    	if($('#pw_check').val()!=''){
		    alert("비밀번호가 일치하지 않습니다.");
	    	    $('#pw_check').val('');
	          $('#member_pw').focus();
	       }
	    }
	})  
	$('#sendSms').click(function(){
	    var phoneNumber = $('#member_phone').val();
		alert("인증번호 발송")


	    $.ajax({
	        type: "POST",
	        url: "sendsms.do",
	        data: {
	            "phoneNumber" : phoneNumber
	        },
	        success: function(res){
	            $('#phoneCheck').click(function(){
	                if($.trim(res) == $('#phone_check').val()){
	                    /*Swal.fire(
	                        '인증성공!',
	                        '휴대폰 인증이 정상적으로 완료되었습니다.',
	                        'success'
	                    )*/
	                	alert("휴대폰 인증이 정상적으로 완료되었습니다.");

	                   /* $.ajax({
	                        type: "GET",
	                        url: "/update/phone",
	                        data: {
	                            "phoneNumber" : $('#inputPhoneNumber').val()
	                        }
	                    })
	                    document.location.href="/home";*/
	                }else{
	                    /*Swal.fire({
	                        icon: 'error',
	                        title: '인증오류',
	                        text: '인증번호가 올바르지 않습니다!',
	                        footer: '<a href="/home">다음에 인증하기</a>'
	                    })*/
	                	alert("인증 실패!");
	                	$('#phone_check').val('');
		                  $('#phone_check').focus();
	                }
	            })

	        
	        }
	    })
	});



});






