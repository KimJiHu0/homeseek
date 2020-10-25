<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 신고하기</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reportMember.css" type="text/css" />
<!-- summernote -->
<script>
$(document).ready(function() {
     $('#summernote').summernote({
           placeholder: '신고 내용을 작성해주세요.',
           minHeight: 370,
           maxHeight: 370,
           focus: true, 
           lang : 'ko-KR'
     });
   });
</script>
</head>
<body>
	<div id="firstbox">
		<p class="iconbox" id="icon">HOME<span class="iconbox" id="iconcolor">SEE</span>K</p>
	</div>
	<h1>신고하기</h1>
	<form action="reportmemberres.do" method="post">
		<table border="1">
			<tr>
				<th class="title">신고하는이름</th>
				<td>${report_senuser.member_name }</td>
			</tr>
			<tr>
				<th class="title">신고하는아이디</th>
				<td><input type="text" value="${report_senuser.member_id }" readonly="readonly" name="report_senid"></td>
			</tr>
			<tr>
				<th class="title">신고받는이름</th>
				<td>${report_reuser.member_name }</td>
			</tr>
			<tr>
				<th class="title">신고받는아이디</th>
				<td><input type="text" value="${report_reuser.member_id }" readonly="readonly" name="report_reid"></td>
			</tr>
			<tr>
				<th class="title">신고사유</th>
				<td><input type="text" name="report_title" placeholder="신고 사유을 작성해주세요."/></td>
			</tr>
			<tr>
				<th class="title">신고내용</th>
				<td><textarea rows="10" cols="60" id="summernote" name="report_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="신고하기"/>
					<input type="button" value="취소하기" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>