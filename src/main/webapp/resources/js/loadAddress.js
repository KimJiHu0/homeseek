//아래 코드처럼 테마 객체를 생성합니다.(color값은 #F00, #FF0000 형식으로 입력하세요.)
//변경되지 않는 색상의 경우 주석 또는 제거하시거나 값을 공백으로 하시면 됩니다.
var themeObj = {
   //bgColor: "", //바탕 배경색
   searchBgColor: "#0B65C8", //검색창 배경색
   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
   //pageBgColor: "", //페이지 배경색
   //textColor: "", //기본 글자색
   queryTextColor: "#FFFFFF" //검색창 글자색
   //postcodeTextColor: "", //우편번호 글자색
   //emphTextColor: "", //강조 글자색
   //outlineColor: "", //테두리
};

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
		},
	
	theme : themeObj
	}).open({
		popupName : 'homeseek : SearchAddress'
	});
}