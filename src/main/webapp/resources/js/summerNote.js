$(document).ready(function() {
	 //$('#summernote').val("${board_data.BOARD_CONTENT}");
     $('.summernote').summernote({
           placeholder: '신고 내용을 작성해주세요.',
           minHeight: 370,
           maxHeight: 370,
           focus: true, 
           lang : 'ko-KR',
   });
});