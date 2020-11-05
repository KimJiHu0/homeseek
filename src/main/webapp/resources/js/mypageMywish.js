// checkbox 전체체크 함수
	function allChk(bool){
		var chkbox = document.getElementsByName("chkbox");
		for(var i = 0; i < chkbox.length; i++){
			chkbox[i].checked = bool;
		}
	}
	// 유효성
	$(function(){
		$(".checkwishlist").submit(function(){
			if($(".checkwishlist input:checked").length == 0){
				alert("하나 이상 체크하셔야 합니다.");
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
				var wish_nos = new Array();
				
				for(var i = 0; i < chklength; i++){
					if($("input[name=chkbox]").eq(i).is(":checked") == true ){ 
						wish_nos.push($("input[name=chkbox]").eq(i).val());
					} else {
					}
				}
				
				$.ajax({
					url : "muldeletewishlist.do",
					type : "post",
					data : { wish_no : wish_nos },
					success : function(del){
						if(del > 0){
							alert("찜 목록에서 삭제되었습니다.");
							location.reload(true);
						} else {
							alert("찜 목록에서 삭제가 실패하였습니다.");
						}
					},
					error : function(){
						alert("실패");
					}
				})
			} else {
				alert("찜 목록 삭제가 취소되었습니다.");
			}
		});
	})
	function goRoomList(){
		location.href='mypageroomlist.do';
	}
	