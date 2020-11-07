// 보낸 쪽지함 누르면 이동하는 함수
function goSenMsgList(){
	location.href='mypagemysenmsglist.do';
}

// 제목 누르면 쪽지 상세보기
function goReMsgDetail(message_no){
	open("mypageremsgdetail.do?message_no="+message_no , "", "width=600px height=700px");
}

// checkbox 전체치크 함수
function allChk(bool){
	var chkbox = document.getElementsByName("chkbox");
	for(var i = 0; i < chkbox.length; i++){
		chkbox[i].checked = bool;
	}
}

// 유효성 해주기.
$(function(){
	// form태그의 submit 이벤트가 실행되면
	$(".checkremsglist").submit(function(){
		// 만일 form태그 하위 태그 중 checked된 input의 길이가 0 이라면 == 아무것도 checked되어있지 않다면
		if($(".checkremsglist input:checked").length == 0){
			alert("삭제를 하시려면 하나 이상 체크하셔야 합니다.");
				return false;
		}
	});
	
	// 하나하나의 checked box를 클릭했을 때 일어나는 함수
	$(".chkbox").click(function(){
		// 만일 체크되어있는 checkedbox와 총 checkedbox의 길이가 같다면
		if($(".chkbox:checked").length == $(".chkbox").length){
			// 전체체크의 box의 checked속성을 true로
			$(".all_check").prop("checked", true);
		} else {
			// 아니면 false로
			$(".all_check").prop("checked", false);
		}
	});
	
	// 삭제버튼을 눌렀을 때
	$(".muldelebtn").click(function(){
		var delcheck = confirm("정말 삭제하시겠습니까?");
		var chklength = $(".chkbox").length;
		
		if(delcheck){
			var message_nos = new Array();
			
			for(var i = 0; i < chklength; i++){
				// name이 chkbox인 input태그의 i번지 중 checked속성이 true라면
				if($("input[name=chkbox]").eq(i).is(":checked") == true){
					// message_nos라는 배열에 그의 val을 넣어준다.
					message_nos.push($("input[name=chkbox]").eq(i).val());
				} else {
					// 아무것도 하지 않는다.
				}
			}
			
			$.ajax({
				url : "muldeleteremsglist.do",
				type : "post",
				data : { message_no : message_nos },
				success : function(del){
					if(del > 0){
						alert("선택하신 쪽지가 받은 쪽지함에서 삭제되었습니다,");
						location.reload(true);
					} else {
						alert("보낸 쪽지함에서 쪽지 삭제가 실패하였습니다.");
					}
				},
				error : function(){
					alert("실패");
				}
			})
		} else {
			alert("쪽지 삭제가 취소되었습니다.");
		}
	})
})