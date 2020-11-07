// checkbox 전체체크 함수
	function allChk(bool){
		var chkbox = document.getElementsByName("chkbox");
		for(var i = 0; i < chkbox.length; i++){
			chkbox[i].checked = bool;
		}
	}
	
	// 유효성
	$(function(){
		$(".checksenmsglist").submit(function(){
			if($(".checksenmsglist input:checked").length == 0){
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
				var message_nos = new Array();
				
				for(var i = 0; i < chklength; i++){
					if($("input[name=chkbox]").eq(i).is(":checked") == true ){ 
						message_nos.push($("input[name=chkbox]").eq(i).val());
					} else {
						// 아무것도 안함
					}
				}
				
				$.ajax({
					url : "muldeletesenmsglist.do",
					type : "post",
					data : { message_no : message_nos },
					success : function(del){
						if(del > 0){
							alert("선택하신 쪽지가 보낸 쪽지함에서 삭제되었습니다.");
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
		});
	})
	
	// 받은 쪽지함 가기
	function goRemsgList(){
		location.href='mypagemyremsglist.do';
	}
	
	// 보낸 쪽지 상세보기
	function goSenMsgDetail(message_no){
		open('mypagesenmsgdetail.do?message_no='+message_no,"", "width=600px height=700px");
	}