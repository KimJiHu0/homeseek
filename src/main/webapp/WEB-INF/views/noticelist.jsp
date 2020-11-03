<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N O T I C E</title>
	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticeList.css"
	type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/noticeList.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/paging.js"
	type="text/javascript"></script>		

</head>
<style>
	.off-screen{
		display:none;
	}
</style>	
<body>
	<section>
	<div id="products">

		<h1>N O T I C E 리 스 트</h1>

		<form action="" id="setRows">
			<input type="hidden" name="rowPerPage" value="5">
		</form>

		<table border="1">
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
				<th>조회수</th>

			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<th colspan="4">--작성된 글이 존재하지 않습니다--</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr class="eval-contents">
							<th>${dto.notice_no}</th>
							<th>${dto.notice_id }</th>
							<th><a class='move'
								href='noticedetail.do?notice_no=<c:out value="${dto.notice_no}"/>'>${dto.notice_title }</a></th>
							<th><fmt:formatDate pattern="yyyy-MM-dd"
									value="${dto.notice_regdate}"/></th>
							<th>${dto.notice_hit}</th>

						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5" align="right"><input type="button" value="글작성"
					onclick="location.href='noticeinsertform.do'" /></td>
			</tr>
		</table>
		</div>

</section>

	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>