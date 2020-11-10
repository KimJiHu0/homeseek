<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 내가 올린 매물</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMyroomlist.css" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/mypageMyroomlist.js" type="text/javascript"></script>

</head>
<style>
.off-screen {
	display: none;
}

.eval-contents {
	cursor: pointer;
	height: 50px;
	text-align: center;
}
</style>
<body>
		
	<%@ include file="./form/header.jsp" %>
	
	<section>
		<div class="maincontainer" id="products">
			<form action="" id="setRows">
				<input type="hidden" name="rowPerPage" value="10">
			</form>
			
			<div class="myroom-menu">
				<div class="myroom-menu-title"><a class="gowishlist" href="javascript:goWishList();">내가 찜한 매물</a></div>
				<div class="myroom-menu-title"><a class="goroomlist" href="#">내가 올린 매물</a></div>
			</div>
			<hr/>
			<div class="myroom-list">
			
			
				<form action = "muldeleteroomlist.do" method ="post" class = "checkroomlist">
					<table>
						
						<col width="50px"> <!-- CHECK -->
						<col width="180px"> <!-- room_no -->
						<col width="330px"> <!-- room_name -->
						<col width="550px"> <!-- room_addr -->
						<col width="280px"> <!-- room_redate -->
						
						<tr>
							<th colspan="5">&nbsp;</th>
						</tr>
						<c:choose>
							<c:when test="${empty roomlist }">
								<tr>
									<th colspan="5">현재 회원님께서 올린 매물이 없습니다.</th>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th><input type="checkbox" class="all_check" name="all_check" onclick="allChk(this.checked)"/></th>
									<th>매물번호</th>
									<th>매물제목</th>
									<th>매물주소</th>
									<th>매물작성날짜</th>
								</tr>
								<tr>
										<td class="a" colspan="5"></td>
								</tr>

								<c:forEach items="${roomlist }" var="roomlist">
									<tr class="eval-contents">
										<td><input type="checkbox" name="chkbox" class="chkbox" value="${roomlist.room_no }"/></td>
										<td>${roomlist.room_no}</td>
										<td><a class="roomtitle" href="javascript:goRoomDetail(${roomlist.room_no });">${roomlist.room_name }</a></td>
										<td>${roomlist.room_addr }</td>
										<td>${roomlist.room_regdate }</td>
									</tr>
							
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty roomlist }">
								
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
			<!-- room_no, room_name, room_addr, room_regdate,  -->
		</div>
	

	</section>
	
	<%@ include file="./form/footer.jsp" %>

</body>
<script src="${pageContext.request.contextPath}/resources/js/paging.js"
	type="text/javascript"></script>
</html>