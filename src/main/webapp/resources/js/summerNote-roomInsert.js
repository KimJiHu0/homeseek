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
           callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
		        }
			}
   });
       
});

function sendFile(file, el) {
	var form_data = new FormData();
  	form_data.append('file', file);
  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: './profileImage.mpf',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/form-data',
    	processData: false,
    	success: function(img_name) {
      		$(el).summernote('editor.insertImage', img_name);
    	}
  	});
}