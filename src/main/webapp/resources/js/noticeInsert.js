
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
			],
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
			 		for (var i=0; i<files.length; i++) {
			            	sendFile(files[i], this); 
			            }
				}
			}
			
			
	});
});



//--------------------------------------------------------------------------------------------------------

var totalPhoto = "";
var newList = "";
var photoList = $('#photo_list');


function sendFile(file) {
	var imgname;
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data: form_data,
		type : "post",
		url:'noticeimage.do',
		cache :false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(img) {
				
				var img_db = 'resources/' + img;
				totalPhoto += img_db;
				
				newList += img + '\n'; 
				
				//파일 이름만 자르기
				console.log("img : " + img);
				var fileName = img.split("/");
				console.log("파일이름 : " + fileName[1]);
				
				//문자열 자르는 파트 ------------------------------- 
				//마지막에 콤마를 붙여줘서 항상 마지막 인덱스는 공백.
				
				var photoArr = totalPhoto.split(",");
				for(var i in photoArr){
					console.log("["+i+"]"+ " 번째파일 : " + photoArr[i]);
				}
				
				photoList.val(newList);
				console.log("이미지 처리중");
			}
			
	});
		
}













