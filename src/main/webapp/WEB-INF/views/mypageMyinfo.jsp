<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 내 정보 보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageMyinfo.css" type="text/css" />
</head>
<body>

	<div class="headercontainer">
		<p class="iconbox" id="icon">HOME<span class="iconbox" id="iconcolor">SEE</span>K</p>
	</div>
	
	<!-- 모든걸 감싸는 div -->
<div class="a">
	<div class="bodycontainer">
		<div class="myinfo-menu">
			<div class="myinfo-menu-title" id="wishlist">내가 찜한 매물</div>
			<div class="myinfo-menu-title" id="uploadroomlist">내가 올린 매물</div>
		</div>
		<div class="myinfo-content">
			<div class="myinfo-detail">
				<div class="myinfo-detail-title">아이디</div>
				<div class="myinfo-detail-content">${member.member_id }</div>
			</div>
			<div class="myinfo-detail">
				<div class="myinfo-detail-title">이름</div>
				<div class="myinfo-detail-content">${member.member_name }</div>
			</div>
			<div class="myinfo-detail">
				<div class="myinfo-detail-title">전화번호</div>
				<div class="myinfo-detail-content">${member.member_phone }</div>
			</div>
			<div class="dropout">
				<input class="dropoutbtn" type="button" value="탈퇴하기" onclick="dropoutMember();"/>
			</div>
		</div>
	</div>
</div>
</body>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	function dropoutMember(){
		var dropcheck = confirm("정말 탈퇴하시겠습니까?");
		var member_id = '${member.member_id}';
		
		if(dropcheck == true){
			$.ajax({
				type : 'post',
				dataType : 'json',
				data : {"member_id" : member_id},
				url : 'dropmember.do',
				success : function(data){
					if(data.res > 0){
						alert("탈퇴성공");
						self.close();
					} else {
						alert("탈퇴실패");
					}
				},
				error : function(){
					alert("실패");
				}
			})
		} else {
			alert("탈퇴가 취소되었습니다.");
		}
	}
	
	
		$("#uploadroomlist").click(function(){
			var wish_id = '${member.member_id}';
			self.close();
			window.opener.location.href="mypageroomlist.do?room_id="+wish_id;
		});
		$("#wishlist").click(function(){
			var wish_id = '${member.member_id}';
			self.close();
			window.opener.location.href="mypagewishlist.do?wish_id="+wish_id;
		});
		
		

	

</script>
</html>