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
        			   sendFile(files[0], this);
        	   }
          }
   });
});

function sendFile(file, editor){
	var data = new FormData();
	data.append("file", file);
	alert(data);
	$.ajax({
		data : data,
		type : "POST",
		url : "fileupload.do",
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(img_name){
			alert(img_name);
			var image =$("<img>").attr("src",img_name.fname);
			$('.summernote').summernote('insertNode', image[0]);
			console.log("fname : " + data.fname);
			document.getElementById("room_photo").value = img_name;
		},
		error : function(){
			alert("실패");
		}
	});
}