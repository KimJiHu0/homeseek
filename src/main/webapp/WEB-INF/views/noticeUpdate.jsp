<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N O T I C E 수정</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticeUpdate.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/noticeUpdate.js"
	type="text/javascript"></script>
</head>
<body>

	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>
	

	<section>
	<h1>Q N A 수 정</h1>
		<form action="noticeupdate.do" method="post">
		<input type="hidden" name="notice_no" value="${dto.notice_no }">
			<table border="1">
			
				<tr>
					<th>글번호</th>
					<td><c:out value="${dto.notice_no}"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" readonly="readonly" name="notice_id" value="관리자"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="notice_title"
						value="${dto.notice_title }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="60" name="notice_content">${dto.notice_content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정하기">
						<input type="button" value="취소" onclick="location.href='noticedetail.do?notice_no=${dto.notice_no}'">
					</td>
				</tr>
			</table>
		</form>	
			
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>

</body>
</html>