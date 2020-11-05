<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 나의 찜목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMywish.css" type="text/css" />

<script type="text/javascript">

	// checkbox 전체체크 함수
	function allChk(bool){
		var chkbox = document.getElementsByName("chkbox");
		for(var i = 0; i < chkbox.length; i++){
			chkbox[i].checked = bool;
		}
	}
	// 유효성
	$(function(){
		$(".checkwishlist").submit(function(){
			if($(".checkwishlist input:checked").length == 0){
				alert("하나 이상 체크하셔야 합니다.");
				return false;
			}
		});
		
		$(".chkbox").click(function(){
			if($(".chkbox:checked").length == $(".chkbox").length){
				$(".all_check").prop("checked", true);
			} else {
				$(".all_check").prop("checked", false);
			}
		});
		
		$(".muldelebtn").click(function(){
			var delcheck = confirm("정말 삭제하시겠습니까?");
			var chklength = $(".chkbox").length;
			
			if(delcheck){
				var wish_nos = new Array();
				
				for(var i = 0; i < chklength; i++){
					if($("input[name=chkbox]").eq(i).is(":checked") == true ){ 
						wish_nos.push($("input[name=chkbox]").eq(i).val());
					} else {
					}
				}
				
				$.ajax({
					url : "muldeletewishlist.do",
					type : "post",
					data : { wish_no : wish_nos },
					success : function(del){
						if(del > 0){
							alert("찜 목록에서 삭제되었습니다.");
							location.reload(true);
						} else {
							alert("찜 목록에서 삭제가 실패하였습니다.");
						}
					},
					error : function(){
						alert("ㅅㅍ");
					}
				})
			} else {
				alert("찜 목록 삭제가 취소되었습니다.");
			}
		});
	})

</script>

</head>
<body>
	<%@ include file="./form/header.jsp" %>
	
	<section>
		
		<div class="maincontainer">
			<div class="mywish-menu">
				<div class="mywish-menu-title"><a class="gowishlist" href="#">내가 찜한 매물</a></div>
				<div class="mywish-menu-title"><a class="goroomlist" href="#">내가 올린 매물</a></div>
			</div>
			<hr/>
			<div class="mywish-list">
				<form action = "muldeletewishlist.do" method="post" class="checkwishlist">
				<table>
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
							<c:when test="${empty wishlist }">
								<tr>
									<th colspan="9">현재 회원님께서 찜한 매물이 없습니다.</th>
								</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<th><input type="checkbox" class="all_check" name="all_check" onclick="allChk(this.checked)"/></th>
								<th>찜번호</th>
								<td></td>
								<th>글제목</th>
								<td></td>
								<th>파는사람아이디</th>
								<td></td>
								<th>글작성날짜</th>
								<td></td>
							</tr>
							<tr>
								<td class="a" colspan="9">&nbsp;</td>
							</tr>
								<c:forEach items="${wishlist }" var="wishlist">
									<tr>
										<th><input type="checkbox" name="chkbox" class="chkbox" value="${wishlist.wish_no }"/></th>
										<th>${wishlist.wish_no }</th>
										<td></td>
										<th><a class="wishtitle" href="#">${wishlist.roomdto.room_name }</a></th>
										<td></td>
										<th>${wishlist.roomdto.room_id }</th>
										<td></td>
										<th>${wishlist.roomdto.room_regdate }</th>
										<td></td>
									</tr>
									<tr>
										<td class="a" colspan="9"></td>
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
</html>