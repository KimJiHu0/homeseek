window.onload = function() { 
	$('.searchtxt').keydown(function(e){ /*엔터누르면 검색되도록*/
		if(e.keyCode == 13){
			$('.searchform').submit();
		}
	});
}