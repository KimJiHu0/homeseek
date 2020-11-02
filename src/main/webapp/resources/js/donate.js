

function requestPay() {
	
	//후원할 금액
	let value = $('input[name=donate_value]:checked').val();
	
	
	const member_id = '<%=member_id%>';
	const member_name = '<%=member_name%>';
	const member_phone='<%=member_phone%>';
	
	console.log("후원하는 아이디 : " + member_id);
	console.log("후원하는 이름 : " + member_name);
	console.log("후원하는 사람 번호" + member_phone);
	
	
    // IMP.request_pay(param, callback) 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",
        name: "homeseek"+ value +"원후원",
        amount: value,
        buyer_email: member_id,
        buyer_name: member_name,
        buyer_tel: member_phone,
    }, function (rsp) { // callback
  	  if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
  	      // jQuery로 HTTP 요청
  	      jQuery.ajax({
  	          url: "https://www.myservice.com/payments/complete", // 가맹점 서버
  	          method: "POST",
  	          headers: { "Content-Type": "application/json" },
  	          data: {
  	              imp_uid: rsp.imp_uid,
  	              merchant_uid: rsp.merchant_uid
  	          }
  	      }).done(function (data) {
  	        // 가맹점 서버 결제 API 성공시 로직
  	      })
        } else {
      	  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
    });
  }

