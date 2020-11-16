
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice 등록</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticeInsert.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/noticeInsert.js"
	type="text/javascript"></script>
</head>
<body>
	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>
	<section>

		<h1>N O T I C E 등 록</h1>

		<form action="noticeinsert.do" method="post" id="notice_form">

			<h3>제목</h3>
			<input id="insert_noticetitle" name='notice_title' placeholder="제목을 입력해주세요.">
			
			<br>
			
			<div id="insert_content">
				<!-- <h3>업로드된 파일</h3>
				<textarea id="photo_list" readonly="readonly"></textarea> -->
				
				<h3>공지사항 내용</h3>
				<textarea rows="10" cols="60" name="notice_content" id="notice_content"></textarea>
			</div>


			<button type="submit" class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">초기화</button>
			<button type="button" onclick="location.href='noticelist.do'" class="btn btn-default">취소</button>
		</form>

	</section>

	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>

</body>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script
	src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>

<!-- summerNote.js -->
<script
	src="${pageContext.request.contextPath}/resources/js/noticeInsert.js"
	type="text/javascript"></script>




</html>



