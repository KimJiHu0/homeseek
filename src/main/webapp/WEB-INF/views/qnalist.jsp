<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q n A</title>
	<%@ include file="form/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qnaList.css"
	type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/qnaList.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/paging.js"
	type="text/javascript"></script>	

</head>
<style>
	.off-screen{
		display:none;
	}
	.eval-contents{
		cursor:pointer;
	}
</style>
<body>
	<!-- header.jsp -->
	<section>
	<div id="products">
		<h1>Q N A 리 스 트</h1>

		<div class="panel-heading">
			<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
				New QNA</button>
		</div>
		
		<form action="" id="setRows">
			<input type="hidden" name="rowPerPage" value="5">
		</form>
		
		<table  border="1">
			<colgroup>
				<col width="50" />
				<col width="100" />
				<col width="500" />
				<col width="100" />

			</colgroup>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>비밀글여부</th>

			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<th colspan="4">--작성된 글이 존재하지 않습니다--</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr class="eval-contents" onclick="location.href='qnadetail.do?qna_no=${dto.qna_no}'">
							<td>${dto.qna_no}</td>
							<td>${dto.qna_id }</td>
							<td>${dto.qna_title }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${dto.qna_regdate}" /></td>
							<td>${dto.qna_secretflag}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
		<table>
			<tr>
				<td colspan="4" align="right"><input type="button" value="글작성"
					onclick="location.href='qnainsertform.do'" /></td>
			</tr>
		</table>
	</section>

	<script type="text/javascript">
		$(document).ready(function() {

			$("#regBtn").on("click", function() {
				self.location = "qnainsertform.do";
			});
			/* 목록에서 버튼으로 이동하기 jquery */

		});
	</script>

	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>