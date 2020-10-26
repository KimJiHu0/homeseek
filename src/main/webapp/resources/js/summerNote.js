$(document).ready(function() {
	 //$('#summernote').val("${board_data.BOARD_CONTENT}");
     $('.summernote').summernote({
           placeholder: '???',
           minHeight: 370,
           maxHeight: 370,
           focus: true, 
           lang : 'ko-KR',
   });
});