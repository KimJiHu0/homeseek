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

</head>
<style>
.off-screen {
	display: none;
}

.eval-contents {
	
	height: 50px;
	text-align: center;
}

</style>
<body>
	
	<%@ include file="./form/header.jsp" %>
	
	<section>
	
		<div class="maincontainer" id="products">
			<div class="mydona-menu">
				<div class="mydona-menu-title">
					<span class="mydona-menu-title-span">나의 후원 내역</span>
				</div>
			</div>
			<hr/>
			<div class="mydona-list" >
			
			<form action="" id="setRows">
				<input type="hidden" name="rowPerPage" value="5">
			</form>
			
				<table>
					<col width="180px"> <!-- 도네번호 -->
					<col width="510px"> <!-- 후원금액 -->
					<col width="380px"> <!-- 후원 날짜 -->

					<c:choose>
						<c:when test="${empty donalist }">
							<tr>
								<th colspan="7">현재 회원님께서 후원한 내역이 없습니다.</th>
							</tr>
						</c:when>
						<c:otherwise>
						<tr>
							
							<th>후원번호</th>
							
							<th>후원금액</th>
							
							<th>후원날짜</th>
							
						</tr>
						<tr>
							<th colspan="3">&nbsp;</th>
						</tr>
					
							<c:forEach items="${donalist }" var="donalist">
								
								<tr class="eval-contents">
									
									<td>${donalist.dona_no }</td>
									
									<td><fmt:formatNumber value="${donalist.dona_bill }" pattern="#,###"/>원</td>
									
									<td><fmt:formatDate value="${donalist.dona_date }" pattern="yyyy-MM-dd"/></td>
									
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
<script src="${pageContext.request.contextPath}/resources/js/paging.js"	type="text/javascript"></script>
</html>