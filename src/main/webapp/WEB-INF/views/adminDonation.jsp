<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminDonation.css">
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="admindona.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	

	<section>
	<h1>전체 후원 관리</h1>
	<hr/>
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	
	<div id="outter">
	<table>
		<colgroup>
			<col width="50"/>
			<col width="100"/>
			<col width="100"/>
			<col width="300"/>
		</colgroup>
		<tr>
			<th>후원 번호</th>
			<th>후원 아이디</th>
			<th>후원 금액</th>
			<th>후원 날짜</th>
		</tr>
		<tr>
			<td class="a" colspan="9">&nbsp;</td>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="4">----------------후원 내역 없음------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.dona_no }</td>
						<td>${dto.dona_id }</td>
						<td>${dto.dona_bill }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
							value="${dto.dona_date}" /></td>
					</tr>
					<tr>
						<td class="a" colspan="9">&nbsp;</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	
	
		
	</table>
	
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="admindona.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="admindona.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="admindona.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	</div>
	</section>
	<%@ include file="./form/footer.jsp" %>
	
</body>
</html>