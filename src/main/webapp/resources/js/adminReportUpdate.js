	function accept() {
		if (confirm("신고를 승인하시겠습니까??") == true){    //확인
			document.success.submit();

		}else{   //취소
			return false;
		}
	}


