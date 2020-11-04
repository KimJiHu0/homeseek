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
			<div class="myinfo-menu-title">내가 찜한 매물</div>
			<div class="myinfo-menu-title">내가 올린 매물</div>
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
		var member_id = '${member.member_id}';
		
		var data = {
				"member_id" : member_id
		}
		
		$.ajax({
			type : 'post',
			dataType : 'json',
			data : JSON.stringify(data),
			contentType : "application/json",
			url : 'dropmember.do',
			success : function(data){
				alert("성공");
			},
			error : function(){
				alert("실패");
			}
		})
	}

</script>
</html>