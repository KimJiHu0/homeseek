<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 수정</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qnaUpdate.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/qnaUpdate.js"
	type="text/javascript"></script>
</head>
<body>

	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>
	

	<section>
	<h1>Q N A 수 정</h1>
		<form action="qnaupdate.do" method="post">
		<input type="hidden" name="qna_no" value="${dto.qna_no }">
			<table border="1">
			
				<tr>
					<th>글번호</th>
					<td><c:out value="${dto.qna_no}"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" readonly="readonly" name="qna_id" value="dto.qna_id"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="qna_title"
						value="${dto.qna_title }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="60" name="qna_content">${dto.qna_content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정하기">
						<input type="button" value="취소" onclick="location.href='qnadetail.do?qna_no=${dto.qna_no}'">
					</td>
				</tr>
			</table>
		</form>	
			
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>

</body>
</html>