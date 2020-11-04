$(function() {
	$('#summernote').summernote({
		placeholder: '최대 500자 작성 가능합니다.',
		height: 300,
		minHeight: 300,             
		maxHeight: 300,             
		lang: 'ko-KR',
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
		 		for (var i=0; i<files.length; i++) {
		            	sendFile(files[i], this); 
		            }
			}
		}
	});
});

var photoValue = "";
var photo = $('#insert_photo');
function sendFile(file) {
	var imgname;
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
				
				var img_db = 'resources/' + img;
				photoValue += img_db + ',';
				
				console.log(photoValue);
				photo.val(photoValue);
			}
			
	});
	
	
	
	
}


//--------------------------------------------------------------------------------------------------------

