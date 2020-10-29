function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data: form_data,
		type : "post",
		url:'summer_image.do',
		cache :false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(img_name) {
			$(el).summernote('editor.insertImage',img_name);
			console.log("이미지 처리중");
		}
	});
}

$(function() {
	$('#summernote').summernote({
		 	placeholder: '최대 500자 작성 가능합니다.',
	        height: 300,
	        minHeight: 300,             
	    	maxHeight: 300,             
	        focus: true,
	        lang: 'ko-KR',
	        callbacks: {
	        	onImageUpload: function(files, editor, welEditable) {
	        		for(var i = files.length -1; i>=0; i--) {
	        			console.log("이미지 저장중");
	        			sendFile(files[i], this);
	        		}
	        	}
	        }
	 });
});

//--------------------------------------------------------------------------------------------------------

