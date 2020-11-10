<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 보낸 쪽지함</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMySenmsg.css" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/mypageMySenmsg.js" type="text/javascript"></script>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="mypagemysenmsglist.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}

</script>
</head>
<body>
	<%@ include file="./form/header.jsp" %>

	<section>
	
		<div class="maincontainer">
			<div class="mysenmsg-menu">
				<div class="mysenmsg-menu-title"><a class="goremsglist" href="javascript:goRemsgList();">받은 쪽지함</a></div>
				<div class="mysenmsg-menu-title"><a class="gosenmsglist" href="#">보낸 쪽지함</a></div>
			</div>
			<hr/>
			<div id="select" style="float: right;">
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
			<div class="mysenmsg-list">
				<form action="" method="post" class="checksenmsglist">
					<table>
						<!-- 쪽지번호, 받는사람, 제목, 날짜 -->
						<col width="80px">
						<col width="100px">
						<col width="80px">
						<col width="300px">
						<col width="80px">
						<col width="250px">
						<col width="80px">
						<col width="100px">
						<col width="80px">
						<tr>
							<th colspan="9">&nbsp;</th>
						</tr>
						<c:choose>
							<c:when test="${empty senmsglist }">
								<tr>
									<th colspan="9">현재 회원님께서 보낸 쪽지가 없습니다.</th>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th><input type="checkbox" class="all_check" name="all_check" onclick="allChk(this.checked)"/></th>
									<th>쪽지번호</th>
									<td></td>
									<th>쪽지제목</th>
									<td></td>
									<th>쪽지받은아이디</th>
									<td></td>
									<th>쪽지작성날짜</th>
									<td></td>
								</tr>
								<tr>
									<td class="a" colspan="9">&nbsp;</td>
								</tr>
								<c:forEach items="${senmsglist }" var="senmsglist">
									<tr>
										<th><input type="checkbox" name="chkbox" class="chkbox" value="${senmsglist.message_no }"/></th>
										<th>${senmsglist.message_no }</th>
										<td></td>
										<th><a class="senmsgtitle" href="javascript:goSenMsgDetail(${senmsglist.message_no })">${senmsglist.message_title }</a></th>
										<td></td>
										<th>${senmsglist.message_reid }</th>
										<td></td>
										<th><fmt:formatDate value="${senmsglist.message_date }" pattern="yyyy-MM-dd"/></th>
										<td></td>
									</tr>
									<tr>
										<td class="a" colspan="9"></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty senmsglist }">
								
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="9" align="right">
										<input type="button" class="muldelebtn" value="삭제하기"/>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</form>
			</div>
			<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="mypagemysenmsglist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="mypagemysenmsglist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="mypagemysenmsglist.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
		</div>
		
	</section>
	
	<%@ include file="./form/footer.jsp" %>
</body>
</html>