<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 방 올리기</title>
</head>
<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	<%
		MemberDto insert_dto = (MemberDto) request.getSession().getAttribute("login");
		String room_id = insert_dto.getMember_id();
	%> 
	
	<!-- 제목 -->
	<div id="top_title">
		<h3>방 올리기</h3>
	</div>
	
	<hr id="top_line">
	
	<section>
	
	
	<!-- 입력폼 -->
	<div class="form_div">
		<form action="insertres.do" class="insert_form" method="POST">
		<input type="hidden" value="<%=room_id %>" name="room_id">
		<input type="hidden" value="" id="insert_photo" name="room_photo">
				<div id="insert_div1">
					<label for="insert_name" id="name_label">매물이름</label>
						<input type="text" name="room_name" id="insert_name">
				
					<label for="insert_roomtype" id="type_label">매물종류</label>
						<select name="room_type" id="insert_roomtype" >
							<option value="1">월세</option>
							<option value="2">전세</option>
							<option value="3">매매</option>
							<option value="4">반전세</option>
							<option value="5">단기임대</option>
						</select>				
				</div>
				
				<div id="insert_div2">
					<label for="insert_deposit" id="deposit_label">보증금</label>
						<input type="text" name="room_deposit" id="insert_deposit" value="">
				
					
					<label for="insert_price" id="price_label">매물가격</label>
						<input type="text" name="room_price" id="insert_price">
					
				
					<label for="insert_ext" id="ext_label">매물면적</label>
						<input type="text" name="room_extent" placeholder="단위 : 제곱미터" id="insert_ext">
				
				</div>
				
				<div id="insert_div3">
					<p id="addr_notice">※ 띄어쓰기를 포함한 정확한 도로명 주소로 입력해주세요.</p>
					<p id="addr_notice">※ 정확한 주소가 아닐경우 위치확인이 어렵습니다.</p>			
					
					<label for="room_addr" id="addr_label">매물주소</label>
					<input type="text" id="room_addr" name="room_addr" onclick="goPopup()" placeholder="  입력창 클릭시 도로명주소 팝업창으로 이동합니다." readonly="readonly"/>
					
					<!-- 지도 출력 영역 -->
					<div id="show_map"></div>
				</div>
				
				<div id="insert_div4">
					<label for="insert_kind" id="kind_label">건물 종류</label>
						<select name="room_kind" id="insert_kind">
							<option value="1">아파트</option>
							<option value="2">빌라</option>
							<option value="3">주택</option>
							<option value="4">오피스텔</option>
							<option value="5">상가사무실</option>
						</select>
					
				
					<label for="insert_structure" id="strc_label">방 구조</label>
						<select name="room_structure" id="insert_structure">
							<option value="1">방 1개</option>
							<option value="2">방 2개</option>
							<option value="3">방 3개이상</option>
						</select>
					
				
					<label for="insert_floor" id="floor_label">방 층수</label>
					<input type="text" name="room_floor" id="insert_floor" value="${room_floor }"  placeholder="숫자만 입력해주세요.">
				</div>	
				
				<div id="insert_div5">
					<label for="insert_cpdate" class="div5_label">준공 날짜</label>
					<input type="date" name="room_cpdate" id="insert_cpdate">
					
				
					<label for="insert_avdate"  class="div5_label">입주 가능일</label>
					<input type="date" name="room_avdate" id="insert_avdate">
					<br>
					
					<!-- <label for="summernote" id="div5_label">상세설명</label> -->
					<h4 id="summernote_title">상세설명</h4>
					
					
					
					<div id="insert_detail">
						<textarea rows="10" cols="60" id="summernote" name="room_detail"></textarea>
					</div>
					
					<div id="insert_imgist">
						<!-- <input type="hidden" id="room_photo"> -->						
					</div>
					
				</div>
				
				<div class="control">
						<input type="submit" value="작성" id="submit_button">
						<input type="button" value="취소" id="cancel_button" onclick="location.href='main.do'">
				</div>
			
		</form>
	</div>
	</section>
	
	<hr id="botton_line">
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
	
</body>



<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<!-- summerNote.js -->
<script src="${pageContext.request.contextPath}/resources/js/summerNote-roomInsert.js" type="text/javascript"></script>

<!-- 카카오맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7f1fa385bb585b9a8e3d5219e5bf533&libraries=services"></script>
<!-- 카카오맵 services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7f1fa385bb585b9a8e3d5219e5bf533&libraries=services"></script>

<!-- 도로명주소API js -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/loadAddress.js" type="text/javascript"></script>

<!-- page 설정 -->

<!-- roomInsert.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomInsert.css" type="text/css" />
<!-- roomInsert.js -->
<script src="resources/js/roomInsert.js" type="text/javascript"></script>


<script>




</script>
</html>











