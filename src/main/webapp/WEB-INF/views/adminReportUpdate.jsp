<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/adminReportUpdate.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminReportUpdate.css">
</head>
<body>

	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>
	<section>
	<h1>신고 관리</h1>
	<hr/>

	
	<form action="acceptreport.do" method="post" name="success">
	 <input type="hidden" id="report_reid" name="report_reid" value="${dto.report_reid }">
	 <input type="hidden" id="report_no" name="report_no" value="${dto.report_no }">
	 

		
	
		<table>
			<tr>
				<th>신고번호</th>
				<td>${dto.report_no }</td>
			</tr>
			<tr>
				<td class="a" colspan="9"></td>
			</tr>
			<tr>
				<th>신고한 사용자</th>
				<td>${dto.report_senid }</td>
			</tr>
			<tr>
				<td class="a" colspan="9"></td>
			</tr>
			<tr>
				<td class="a" colspan="9"></td>
			</tr>
			<tr>
				<th>신고 당한 사용자</th>
				<td>${dto.report_reid }</td>
			</tr>
			<tr>
				<td class="a" colspan="9"></td>
			</tr>
			<tr>
				<th>신고제목</th>
				<td>${dto.report_title }</td>
			</tr>
			<tr>
				<td class="a" colspan="9"></td>
			</tr>
			<tr>
				<th>신고 내용</th>
				<td><textarea cols=50 rows=10 readonly>${dto.report_content }</textarea></td>
			</tr>
			
		
		

		</table>
		
		
		<span class="buttonn">
			<button id="accept" onclick="accept();">신고 승인</button>
			<input type="button" id="cancel" onclick="location.href='rejectreport.do?report_no=<c:out value="${dto.report_no }"/>'" value="신고 반려">
		</span>

		
		
</form>
</section>
		<%@ include file="./form/footer.jsp" %>

</body>
</html>