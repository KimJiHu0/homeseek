function addrcheck() {
	new daum.Postcode({
		oncomplete : function(data) {

			// 주소 변수
			var addr = '';

			// 사용자가 선택한 주소가 도로명주소일 때
			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				// 사용자가 선택한 주소가 지번주소일 때 
				addr = data.jibunAddress;
			}
		$("[name=room_addr]").val(addr);
		}
	
	}).open();
}