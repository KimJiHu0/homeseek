$(document).ready(function() {
	 //$('#summernote').val("${board_data.BOARD_CONTENT}");
     $('.summernote').summernote({
           placeholder: '방의 상세설명을 적어주세요.',
           minwidth: 350,
           maxWidth:350,
           minHeight: 300,
           maxHeight: 300,
           focus: true, 
           lang : 'ko-KR',
   });
});