<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modifyPage.css">
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="admin.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}

</script>
</head>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	<section>
	<h1>차단 회원 관리</h1>
	<hr/>
	<div id="outter">
		
	


	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange(this.value);">
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
	
	<table>
		<colgroup>
			<col width="50"/>
			<col width="100"/>
			<col width="300"/>
			<col width="100"/>
			<col width="100"/>
		</colgroup>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰</th>
			<th>활성화 여부</th>
			<th>멤버 등급</th>
		</tr>
		<tr>
			<td class="a" colspan="9"></td>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="5">----------------회원 없음------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr id="tr">
						<td>${dto.member_id }</td>
						<td>${dto.member_name }</td>
						<td>${dto.member_phone }</td>
						<td><input type="button" id="modify" value="일반회원 수정" onclick="location.href='enable.do?member_id=${dto.member_id}'" /></td>
						<td>${dto.member_role }</td>
					</tr>
					<tr>
						<td class="a" colspan="9"></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	
	
		
	</table>
	<span class="buttonn">
			<input type="button" id="main" onclick="location.href='admin.do'" value="전체 회원 관리">
	</span>

	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="admin.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="admin.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="admin.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

	
	
</div>	
</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>