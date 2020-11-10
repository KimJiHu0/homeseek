$(function() {
	$('#summernote').summernote({
		placeholder: 
					'방의 세부 사항을 입력해주세요. 허위내용 기재시 게시물이 무통보 삭제 될수 있습니다. ',
		height: 300,
		minHeight: 300,             
		maxHeight: 300,             
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
//이미지 보기만은 위한 써머노트

$("#summernote_img").summernote({
	height: 182,
	maxHeight: 182,             
    toolbar: false
//    focus: true,
//    onInit : function(){
//        $('.note-editor [data-name="ul"]').tooltip('disable'); 
//    }
});



//--------------------------------------------------------------------------------------------------------

var totalPhoto = "";
var photo = $('#insert_photo');
var photoList = $('#list_area');

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
				totalPhoto += img_db + ',';
				
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
				
				$('#summernote_img').summernote('editor.insertImage', img_db);
				console.log("이미지 처리중");
				
				//-------------------------------
				
				//console.log("업로드한 사진의총 리스트" + totalPhoto);
				//파일이 하나하나 처리가 안되고 있어서 파일 A,B 를 보내면 
				// 업로드한 파일 : A
				// 업로드한 파일 : A,B
				// 업로드한 파일 : A,B,C .... 
				// 식으로 찍히는중
				photo.val(totalPhoto);
				photoList.val(totalPhoto);
				
				
			}
			
	});
		
}

