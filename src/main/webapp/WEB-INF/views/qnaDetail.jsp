<%@page import="com.mvc.homeseek.model.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna 상세 글보기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qnaDetail.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/qnaDetail.js"
	type="text/javascript"></script>
</head>
<body>

	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>

	<section>
		<h1>Q N A 상 세 보 기</h1>


		<table border="1">
			<tr>
				<th>글번호</th>
				<td><input type="hidden" name="qna_no" value="${dto.qna_no }">
					<c:out value="${dto.qna_no}" /></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="hidden" name="qna_id" value="${dto.qna_id }">
					<c:out value="${dto.qna_id}" /></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><input type="hidden" name="qna_regdate"
					value="${dto.qna_regdate }"> <c:out
						value="${dto.qna_regdate}" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="hidden" name="qna_title"
					value="${dto.qna_title }"> <c:out value="${dto.qna_title}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="hidden" name="qna_content"
					value="${dto.qna_content }"> <c:out
						value="${dto.qna_content}" /></td>
			</tr>

		</table>

		<!-- 추가 : 수정,리스트로 버튼 -->

		<a href='qnaupdateform.do?qna_no=<c:out value="${dto.qna_no}"/>'>Update</a>

		<a href="qnalist.do">List</a> <a
			href='qnadelete.do?qna_no=<c:out value="${dto.qna_no}"/>'>Delete</a>



		</div>
		<!--  end panel-body -->
		</div>
		<!--  end panel-body -->
		</div>
		<!-- end panel -->
		</div>
		<!-- /.row -->
	</section>



	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>

</body>
</html>