<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminReport.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp" %>

	<section>
	<h1>전체 회원 관리</h1>
	
	<table border="1">
		<colgroup>
			<col width="50"/>
			<col width="100"/>
			<col width="300"/>
			<col width="100"/>
			<col width="100"/>
		</colgroup>
		<tr>
			<th>신고번호</th>
			<th>신고한 사용자</th>
			<th>신고당한 사용자</th>
			<th>신고 제목</th>
			<th>신고 날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="5">----------------작성된 글 없어------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.report_no }</td>
						<td>${dto.report_senid }</td>
						<td>${dto.report_reid }</td>
						<td><a href="enableupdate.do?report_no=${dto.report_no}">${dto.report_title }</a>
						</td>
						<td>${dto.report_date }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	</section>

</body>
</html>