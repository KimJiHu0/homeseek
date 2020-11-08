// checkbox 전체체크 함수	
function allChk(bool){
	var chkbox = document.getElementsByName("chkbox");
	for(var i = 0; i < chkbox.length; i++){
		chkbox[i].checked = bool;
	}
}

//유효성
$(function(){
	$(".checkroomlist").submit(function(){
		if($(".checkroomlist input:checked").length == 0){
			alert("삭제를 하시려면 하나 이상 체크하셔야 합니다.");
			return false;
		}
	});
	
	$(".chkbox").click(function(){
		if($(".chkbox:checked").length == $(".chkbox").length){
			$(".all_check").prop("checked", true);
		} else {
			$(".all_check").prop("checked", false);
		}
	});
	
	$(".muldelebtn").click(function(){
		var delcheck = confirm("정말 삭제하시겠습니까?");
		var chklength = $(".chkbox").length;
		
		if(delcheck){
			var room_nos = new Array();
			
			for(var i = 0; i < chklength; i++){
				if($("input[name=chkbox]").eq(i).is(":checked") == true){
					room_nos.push($("input[name=chkbox]").eq(i).val());
				} else {
					// 아무것도 안함
				}
			}
			
			$.ajax({
				url : "muldeleteroomlist.do",
				type : "post",
				data : { room_no : room_nos },
				success : function(del){
					if(del > 0){
						alert("선택하신 매물이 삭제되었습니다.");
						location.reload(true);
					} else {
						alert("매물 목록에서 삭제가 실패하였습니다.");
					}
				},
				error : function(){
					alert("실패");
				}
			})
		} else {
			alert("삭제가 취소되었습니다.");
		}
	});
})

// 글 제목 눌렀을 때에 넘어가는 함수
function goRoomDetail(room_no){
	location.href='detailroom.do?room_no='+room_no;
}

//내가 쓴 글 누르면 넘어가는 함수
function goWishList(){
	location.href = 'mypagewishlist.do';
}
