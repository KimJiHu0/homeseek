<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 내 후원 내역</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMydona.css" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/mypageMydona.js" type="text/javascript"></script>
</head>
<body>
	
	<%@ include file="./form/header.jsp" %>
	
	<section>
	
		<div class="maincontainer">
			<div class="mydona-menu">
				<div class="mydona-menu-title">
					<span class="mydona-menu-title-span">나의 후원 내역</span>
				</div>
			</div>
			<hr/>
			<div class="mydona-list">
				<table>
					<col width="80px">
					<col width="100px"> <!-- 도네번호 -->
					<col width="80px">
					<col width="430px"> <!-- 후원금액 -->
					<col width="80px">
					<col width="300px"> <!-- 후원 날짜 -->
					<col width="80px">
					<tr>
						<th colspan="9">&nbsp;</th>
					</tr>
					<c:choose>
						<c:when test="${empty donalist }">
							<tr>
								<th colspan="7">현재 회원님께서 후원한 내역이 없습니다.</th>
							</tr>
						</c:when>
						<c:otherwise>
						<tr>
							<th></th>
							<th>후원번호</th>
							<th></th>
							<th>후원금액</th>
							<th></th>
							<th>후원날짜</th>
							<th></th>
						</tr>
						<tr>
							<td class="a" colspan="7">&nbsp;</td>
						</tr>
							<c:forEach items="${donalist }" var="donalist">
								<tr>
									<td colspan="7"></td>
								</tr>
								<tr>
									<th></th>
									<th>${donalist.dona_no }</th>
									<th></th>
									<th><fmt:formatNumber value="${donalist.dona_bill }" pattern="#,###"/>원</th>
									<th></th>
									<th><fmt:formatDate value="${donalist.dona_date }" pattern="yyyy-MM-dd"/></th>
									<th></th>
								</tr>
								<tr>
									<td colspan="7"></td>
								</tr>
								<tr>
									<td class="a" colspan="7"></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	
	</section>	
	
	<%@ include file="./form/footer.jsp" %>

</body>
</html>