

function requestPay() {
	
	let value = $('input[name=donate_value]:checked').val();
	
    // IMP.request_pay(param, callback) 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",
        name: "homeseek"+ value +"원후원",
        amount: value,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
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

