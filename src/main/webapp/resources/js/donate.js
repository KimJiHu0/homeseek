
function pay() {
	
		var member_id = document.getElementById("member_id").value;
		var member_phone = document.getElementById("member_phone").value;
		var member_name = document.getElementById("member_name").value;
		let value = $('input[name=donate_value]:checked').val();
		
		console.log(member_id);
		console.log(member_phone);
		console.log(member_name);
		
		BootPay.request({
			price: value,
			application_id: "5f9fefc418e1ae002e4f4834",
			name: value + ' 원 후원',
			pg: '',
			method: 'card',
			show_agree_window: 0,
			items: [
				{
					item_name:'Donate ' + value + ' to homeseek',
					qty: 1,
					unique: '123',
					price: value,
				}
			],
			user_info: {
				username: member_name,
				email: member_id,
				//addr: '사용자 주소',
				phone: member_phone
			},
			order_id: '고유order_id_1234',
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			account_expire_at: '2018-05-25',
			extra: {
			    start_at: '2019-05-10',
				end_at: '2022-05-10',
		        vbank_result: 1,
		        quota: '0,2,3',
				theme: 'purple',
				custom_background: '#00a086',
				custom_font_color: '#ffffff'
			}
		}).error(function (data) {
			console.log(data);
		}).cancel(function (data) {
			console.log(data);
		}).ready(function (data) {
			console.log(data);
			/* .confirm 코드는 기본제공.
			 * 결제값이 Bootpay 공식홈페이지의 결제내역으로 넘어가도록 함.*/
		}).confirm(function (data) {
			console.log(data);
			var enable = true;
			if (enable) {
				BootPay.transactionConfirm(data);
				console.log("confirm 함수 실행중");
			} else {
				BootPay.removePaymentWindow();
				console.log("confirm 함수 미실행");
			}
		}).close(function (data) {
		    console.log(data);
		}).done(function (data) {
				
				console.log("시작 :" +data);
				console.log("컨트롤러 넘어가기전 아이디" + member_id)
				
				
				
			$.ajax({
			url: "donateres.do",
			method: "post",
			data: {"obj" : JSON.stringify(data), member_id : member_id},
			success: function(msg){
				alert("후원이 완료되었습니다.");
			},
			error:function(){
				alert("통신 실패");
			}
		});				
				console.log("끝 : "+data);
				
			});
		}