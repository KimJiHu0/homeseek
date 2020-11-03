<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto" %>
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

	<form  action="noticeinsert.do" method="post">
		<table border="1">
		
		<tr>
					<th>제목</th>
					<td><input class="form-control" name='notice_title'></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="form-control" rows="3" name='notice_content'></textarea></td>
				</tr>

			</table>
			
		
		<button type="submit" class="btn btn-default">등록</button>
		<button type="reset" class="btn btn-default">초기화</button>
		<button type="button" onclick="location.href='noticelist.do'" class="btn btn-default">취소</button>
	</form>
	
	</section>
	
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>

</body>
</html>