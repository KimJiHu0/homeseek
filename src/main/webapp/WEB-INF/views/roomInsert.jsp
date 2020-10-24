<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomInsert.css" type="text/css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
			/* minHeight: 370,             // 최소 높이
			maxHeight: 370,  */            // 최대 높이
			height: 500,
			width: 800,
			focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",					// 한글 설정
			placeholder: '내용을 입력해주세요.',	//placeholder 설정
			
			toolbar: [
	             // [groupName, [list of button]]
	             ['fontname', ['fontname']],
	             ['fontsize', ['fontsize']],
	             ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	             ['color', ['forecolor','color']],
	             ['table', ['table']],
	             ['para', ['ul', 'ol', 'paragraph']],
	             ['height', ['height']],
	             ['insert',['picture']],
	             ['view', ['fullscreen', 'help']]
	           ],
	         fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	         fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],

	         callbacks: {	
	        	 onImageUpload: function(files, editor, welEditable) {
	                 for (var i = files.length - 1; i >= 0; i--) {
	                   sendFile(files[i], this);
	                 }
				}
	         }
		});
	});
     
     

	/**
	* 이미지 파일 업로드
	
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
         	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
	*/
</script>


<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	<%
		MemberDto memberDto = (MemberDto) (session.getAttribute("login"));
	%>
	<section>
	
	<div id="title">
		<h3>방 올리기</h3>
	</div>
	
	<hr id="top_line">
	
	<form action="insertres.do" class="insert_form" method="POST">
	<%-- <input type="hidden" name="room_id" value="${memberDto.getMember_id }"> --%>
		
	
			
				<label for="insert_roomname">매물이름</label>
					<input type="text" name="room_name" id="insert_name">
			

			
				<label for="insert_type">매물종류</label>
					<select name="room_type" id="insert_roomtype">
						<option value="1">월세</option>
						<option value="2">전세</option>
						<option value="3">매매</option>
						<option value="4">반전세</option>
						<option value="5">단기임대</option>
					</select>				
				
			
				<label for="insert_deposit">보증금</label>
					<input type="text" name="room_deposit" id="insert_deposit">
			
				
				<label for="insert_price">매물가격</label>
					<input type="text" name="room_price" id="insert_price">
				
			
				<label for="insert_ext">매물면정</label>
					<input type="text" name="room_extent" placeholder="단위 : 제곱미터" id="insert_ext">
			
		
				<label for="insert_addr">매물주소</label>
					<input type="text" name="room_addr" placeholder="도로명주소로 입력해주세요" id="insert_addr">
			
			
				<label for="insert_kind">매물 종류</label>
					<select name="room_kind" id="insert_kind">
						<option value="1">아파트</option>
						<option value="2">빌라</option>
						<option value="3">주택</option>
						<option value="4">오피스텔</option>
						<option value="5">상가사무실</option>
					</select>
				
			
				<label for="insert_structure">방 구조</label>
					<select name="room_structure" id="insert_structure">
						<option value="1">방 1개</option>
						<option value="2">방 2개</option>
						<option value="3">방 3개이상</option>
					</select>
				
			
				<label for="insert_floor">방 층수</label>
				<input type="text" name="room_floor" id="insert_floor">
				
			
				<label for="insert_cpdate">준공 날짜</label>
				<input type="date" name="room_cpdate" id="insert_cpdate">
				
			
				<label>입주 가능일</label>
				<input type="date" name="room_avdate" id="insert_avdate">
				
			
				<div id="insert_detail">
					<textarea rows="10" cols="60" id="summernote" name="room_detail"></textarea>
				</div>
			
				<div class="control">
					<input type="submit" value="작성">
					<input type="button" value="취소" onclick="location.href='main.do'">
				</div>
		
	</form>
	</section>
	
	<hr id="botton_line">
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
	
</body>
</html>