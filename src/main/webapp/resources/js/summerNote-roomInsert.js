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
					console.log("현재 올린 파일의 길이 : " +  files.length);
					console.log(" 1111111111 : " + i);
					sendFile(files[i], this);
					console.log(" 2222222222 : " + i);
				}
			}
		}
	});
});

function sendFile(file) {
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
		success : function(img) {
//			$(el).summernote('editor.insertImage',img_name);
			$('#summernote').summernote('editor.insertImage', img);
			console.log("3333333333");
			
			
			
		}
	});
}


//--------------------------------------------------------------------------------------------------------

