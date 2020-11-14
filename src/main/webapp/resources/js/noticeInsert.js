
$(function() {
	$('#summernote').summernote( {
		placeholder: '공지사항 내용을 입력해주세요.',
		height: 300,
		minHeight: 700,             
		maxHeight: 700,             
		lang: 'ko-KR',
		toolbar: [
			  ['style', ['style']],
			  ['font', ['bold', 'underline', 'clear']],
			  ['fontname', ['fontname']],
			  ['color', ['color']],
			  ['para', ['ul', 'ol', 'paragraph']],
			  ['insert', ['resizedDataImage', 'picture']],
			  ['view', [ 'codeview']],
			]
	});
});