<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 신고하기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reportMember.css" type="text/css" />
</head>
<body>
	<div id="firstbox">
		<p class="iconbox" id="icon">HOME<span class="iconbox" id="iconcolor">SEE</span>K</p>
	</div>
	<div id="secondbox">
		<table border="1">
			<tr>
				<th>신고하는 사람</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th>신고받는 사람</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</table>
	</div>
</body>
</html>