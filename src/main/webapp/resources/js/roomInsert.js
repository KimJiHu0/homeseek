function goPopup(){
	//경로는 시스템에 맞게 수정하여 사용
	//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 //호출하게 됩니다.

	var pop = window.open("insertpopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	
}

//------------------------- select box속성변화

$(function(){
	$('#insert_roomtype').change(function(){
		if(this.value == "3"){
			$("#insert_deposit").hide();
			$("#deposit_label").hide();
			$("#insert_deposit").attr( 'value', '0' );
			
			
			$(".insert_form").attr("action", "insertres2.do");
			
		} else{
			$("#insert_deposit").show();
			$("#deposit_label").show();
			$("#insert_deposit").attr( 'value', '' );
			
			$(".insert_form").attr("action", "insertres.do");
		}
	});
	
	
});

 
function chkForm(){

		if($("#insert_name").val() == ""){
			alert("매물 이름을 입력해주세요");
			$("#insert_name").focus();
			return false;
		}else if($("#insert_deposit").val()=="" && $("#insert_price").val()==""){
			alert("가격을 입력해주세요");
			return false;
		}else if($("#insert_ext").val()==""){
			alert("매물면적을 입력해주세요");
			$("#insert_ext").focus();
			return false;
		}else if($("#room_addr").val()==""){
			alert("매물주소를 입력해주세요");
			$("#room_addr").focus();
			return false;
		}else if($("#insert_floor").val()==""){
			alert("방층 수를 입력해주세요");
			$("#insert_floor").focus();
			return false;
		}else if($("#summernote").val()==""){
			alert("상세내용을 입력해주세요");
			$("#room_detail").focus();
			return false;
		}else if($("#insert_photo").val()==""){
			alert("사진을 한장 이상 올려주세요");
			return false;
		}
		
		return true;
}








