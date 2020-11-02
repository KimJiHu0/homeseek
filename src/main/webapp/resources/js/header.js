window.onload = function() {
	
	
	if($("li").hasClass("searchbox")){/* 로그인되거나, 검색창이 나올때 크기 update되게*/
		$(".nav").width("830px");
		$(".nav2").width("940px");
	}
	
	$('#navsearchtxt').keydown(function(e){ /*엔터누르면 검색되도록*/
		if(e.keyCode == 13){
			$('.navsearchform').submit();
		}
	});
	    
	
	$('#chat').click(function(){
	
		window.open("chat.do", "a", "width=400, height=300, left=100, top=50");
		
	});
	

	
	
	
}