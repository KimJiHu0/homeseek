<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 나의 찜목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMywish.css" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/mypageMywish.js" type="text/javascript"></script>


</head>
<style>
.off-screen {
	display: none;
}

.eval-contents {
	cursor: pointer;
	height: 50px;
	text-align: center;
	border-bottom : 1px black solid;
	
}

</style>
<body>
	<%@ include file="./form/header.jsp" %>
	
	<section>
		
		<div class="maincontainer" id="products">
		
			<form action="" id="setRows" class="paging_bar">
				<input type="hidden" name="rowPerPage" value="5">
			</form>
			
			<div class="mywish-menu">
				<div class="mywish-menu-title"><a class="gowishlist" href="#">내가 찜한 매물</a></div>
				<div class="mywish-menu-title"><a class="goroomlist" href="javascript:goRoomList();">내가 올린 매물</a></div>
			</div>
			<hr/>
			<div class="mywish-list" >
			
			
				<form action = "muldeletewishlist.do" method="post" class="checkwishlist">
				<table>
					<col width="80px">
					<col width="180px">
					
					<col width="380px">
					
					<col width="330px">
					
					<col width="280px">
					
						<tr>
							<th colspan="5">&nbsp;</th>
						</tr>
						<c:choose>
							<c:when test="${empty wishlist }">
								<tr>
									<th colspan="5">현재 회원님께서 찜한 매물이 없습니다.</th>
								</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<th><input type="checkbox" class="all_check" name="all_check" onclick="allChk(this.checked)"/></th>
								<th>찜번호</th>
							
								<th>매물제목</th>
							
								<th>파는사람아이디</th>
								
								<th>매물작성날짜</th>
							
							</tr>
							<tr>
								<td class="a" colspan="9">&nbsp;</td>
							</tr>
								<c:forEach items="${wishlist }" var="wishlist">
									<tr class="eval-contents">
										<td><input type="checkbox" name="chkbox" class="chkbox" value="${wishlist.wish_no }"/></td>
										<td>${wishlist.wish_no }</td>
									
										<td><a class="wishtitle" href="javascript:goRoomDetail(${wishlist.roomdto.room_no });">${wishlist.roomdto.room_name }</a></td>
									
										<td>${wishlist.roomdto.room_id }</td>
										
										<td>${wishlist.roomdto.room_regdate }</td>
										
									</tr>
									
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty wishlist }">
								
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
		</div>
	
	</section>
	
	<%@ include file="./form/footer.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/resources/js/paging.js" type="text/javascript"></script>
</html>