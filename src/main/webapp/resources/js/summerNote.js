$(document).ready(function() {
	 //$('#summernote').val("${board_data.BOARD_CONTENT}");
     $('.summernote').summernote({
           placeholder: '???',
           minHeight: 370,
           maxHeight: 370,
           focus: true, 
           lang : 'ko-KR',
           fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
           callbacks : {
        	   onImageUpload : function(files, editor, welEditable){
        		   for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
        		   }
        	   }
           }
   });
});

function sendFile(file, el){
	var data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "fileupload.do",
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(img_name){
			$(el).summernote('editor.insertImage', img_name);
			/*var image =$("<img>").attr("src",img_name);
			$('.summernote').summernote('insertNode', image[0]);
			document.getElementById("room_photo").value = img_name;*/
		},
		error : function(){
			alert("실패");
		}
	});
}