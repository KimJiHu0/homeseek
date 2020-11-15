//아래 코드처럼 테마 객체를 생성합니다.(color값은 #F00, #FF0000 형식으로 입력하세요.)
//변경되지 않는 색상의 경우 주석 또는 제거하시거나 값을 공백으로 하시면 됩니다.
var themeObj = {
   searchBgColor: "#0B65C8", //검색창 배경색
   queryTextColor: "#FFFFFF" //검색창 글자색
};

// roomDetail.jsp에서 주소입력 input태그를 클릭했을 때 실행하는 함수.
function addrcheck() {
	new daum.Postcode({
		oncomplete : function(data) {

			// 주소 변수
			var addr = '';
			// ()안의 주소 넣어주기
			var extraAddr = '';
			
			// 사용자가 선택한 주소가 도로명주소일 때
			if (data.userSelectedType === 'R') {
				// addr이라는 변수에 가져온 값(data)에 roadAddress(도로명주소) 담기
				addr = data.roadAddress;
				// extraAddr이라는 변수에 가져온 값(data)에 bulidingName(건물 이름) 담기
				extraAddr = data.buildingName;
				// addrBname이라는 변수에 가져온 값(data)에 bname(동 이름) 담기
				addrBname = data.bname;
				// 만일 빌딩 이름이 없다면
				if(data.buildingName === ''){
					// 주소 입력하는 input 태그의 value를 [ 도로명주소(ㅇㅇ동) ] 형식으로 변경
					$("[name=room_addr]").val(addr + "(" + addrBname + ")");
				} else {
					// 빌딩 이름이 있다면 주소 입력하는 input 태그의 value를 [ 도로명주소 (ㅇㅇ동, ㅇㅇ빌딩) ] 형식으로 변경
					$("[name=room_addr]").val(addr + "(" + addrBname + "," + extraAddr + ")");
				}
			} else {
				// 사용자가 선택한 주소가 지번주소일 때
				// addr이라는 변수에 가져온 값 (data)에 jibunAddress(지번수소) 담기
				addr = data.jibunAddress;
				// 주소 입력하는 input 태그의 value를 [ ㅇㅇ시 ㅇㅇ구 ㅇㅇ동 ㅇㅇㅇ-ㅇ ] 형식으로 담기
				$("[name=room_addr]").val(addr);
			}
		},
		// 테마 적용하기
		theme : themeObj
	}).open({
		// 팦업의 이름 지정하기
		popupName : 'homeseek : SearchAddress'
	});
}