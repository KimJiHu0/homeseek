<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : <spring:message code="roominsert" text="매물 올리기"/></title>
</head>
<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
<section>
	<!-- header.jsp include -->
	<%
		MemberDto insert_dto = (MemberDto) request.getSession().getAttribute("login");
		String room_id = insert_dto.getMember_id();
	%> 
	
	<!-- 제목 -->
	<div id="top_title">
	
	</div>
	
	<hr id="top_line">
	
	<!-- <section> -->
	<div id="main_content">
		<!-- 입력폼 -->
		<div class="form_div">
			<form action="insertres.do" class="insert_form" method="POST" onsubmit="return chkForm();" id="main_form">         
			<input type="hidden" value="<%=room_id %>" name="room_id">
			
		<%
			
			
		%>
			
			<input type="hidden" value="" id="insert_photo" name="room_photo">
			
					<div id="insert_div1">
						<label for="insert_name" id="name_label">
						<spring:message code="roominsert.roomname" text="매물이름"/>
						</label>
							<input type="text" name="room_name" id="insert_name">
					
						<label for="insert_roomtype" id="type_label">
						<spring:message code="roominsert.roomtype" text="매물종류"/>
						</label>
							<select name="room_type" id="insert_roomtype" >
								<option value="1"><spring:message code="roominsert.roomtype1" text="월세"/></option>
								<option value="2"><spring:message code="roominsert.roomtype2" text="전세"/></option>
								<option value="3"><spring:message code="roominsert.roomtype3" text="매매"/></option>
								<option value="4"><spring:message code="roominsert.roomtype4" text="반전세"/></option>
								<option value="5"><spring:message code="roominsert.roomtype5" text="단기임대"/></option>
							</select>				
					</div>
					
					<div id="insert_div2">
						<label for="insert_deposit" id="deposit_label"><spring:message code="roominsert.deposit" text="보증금"/></label>
							<input type="text" name="room_deposit" id="insert_deposit" value="">
					
						
						<label for="insert_price" id="price_label"><spring:message code="roominsert.price" text="매물가격"/></label>
							<input type="text" name="room_price" id="insert_price">
						
					
						<label for="insert_ext" id="ext_label"><spring:message code="roominsert.extent" text="매물면적"/></label>
							<input type="text" name="room_extent" placeholder="<spring:message code='roominsert.m2' text='단위 : 제곱미터'/>" id="insert_ext">
					
					</div>
					
					<div id="insert_div3">
						<p id="addr_notice">※ <spring:message code="roominsert.notice1" text="띄어쓰기를 포함한 정확한 도로명 주소로 입력해주세요."/></p>
						<p id="addr_notice">※ <spring:message code="roominsert.notice2" text="정확한 주소가 아닐경우 위치확인이 어렵습니다."/></p>			
						
						<label for="room_addr" id="addr_label"><spring:message code="roominsert.addr" text="매물주소"/></label>
						<input type="text" id="room_addr" name="room_addr" onclick="goPopup()" placeholder="<spring:message code='roominsert.addrpopup' text='입력창 클릭시 도로명주소 팝업창으로 이동합니다.'/>" readonly="readonly"/>
						
						<!-- 지도 출력 영역 -->
						<div id="map_bg">
							<div id="show_map">
								<p id="map_notice"><spring:message code="roominsert.mapnotice" text="주소 검색을 하시면 해당 위치가 지도에 표시됩니다."/></p>
							</div>
						</div>
						
						
					</div>
					
					<div id="insert_div4">
						<label for="insert_kind" id="kind_label"><spring:message code="roominsert.roomkind" text="건물 종류"/></label>
							<select name="room_kind" id="insert_kind">
								<option value="1"><spring:message code="roominsert.roomkind1" text="아파트"/></option>
								<option value="2"><spring:message code="roominsert.roomkind2" text="빌라"/></option>
								<option value="3"><spring:message code="roominsert.roomkind3" text="주택"/></option>
								<option value="4"><spring:message code="roominsert.roomkind4" text="오피스텔"/></option>
								<option value="5"><spring:message code="roominsert.roomkind5" text="상가사무실"/></option>
							</select>
						
					
						<label for="insert_structure" id="strc_label"><spring:message code="roominsert.roomstrc" text="방 구조"/></label>
							<select name="room_structure" id="insert_structure">
								<option value="1"><spring:message code="roominsert.roomstrc1" text="방 1개"/></option>
								<option value="2"><spring:message code="roominsert.roomstrc2" text="방 2개"/></option>
								<option value="3"><spring:message code="roominsert.roomstrc3" text="방 3개 이상"/></option>
							</select>
						
					
						<label for="insert_floor" id="floor_label"><spring:message code="roominsert.roomfloor" text="방 층수"/></label>
						<input type="text" name="room_floor" id="insert_floor" value="${room_floor }"  placeholder="<spring:message code='roominsert.roomfloorplaceholder' text='숫자만 입력가능'/>">
					</div>	
					
					<div id="insert_div5">
						<label for="insert_cpdate" class="div5_label"><spring:message code="roominsert.cpdate" text="준공 날짜"/></label>
						<input type="date" name="room_cpdate" id="insert_cpdate">
						
					
						<label for="insert_avdate"  class="div5_label"><spring:message code="roominsert.avdate" text="입주 가능일"/></label>
						<input type="date" name="room_avdate" id="insert_avdate">
						<br>
						
						<h4 id="summernote_title"><spring:message code="roominsert.detail" text="상세설명"/></h4>
						
						<div id="insert_detail">
							<textarea rows="10" cols="60" id="summernote" name="room_detail" ></textarea>
						</div>
						
						<h4><spring:message code="roominsert.uploadedfile" text="업로드 된 파일"/></h4>
						<div id="insert_list">
							<textarea rows="" cols="" id="list_area" readonly="readonly"></textarea>
						</div>
						
						<h4><spring:message code="roominsert.imagePreview" text="이미지 미리보기"/></h4>
						<div id="insert_imglist" >
							<textarea rows="5" cols="60" id="summernote_img" ></textarea>
						</div>
						
						
						
						<div class="control">
								<input type="submit" value="<spring:message code='roominsert.submit' text='작성'/>" id="submit_button">
								<input type="button" value="<spring:message code='roominsert.cancel' text='취소'/>" id="cancel_button" onclick="location.href='main.do'">
						</div>
					</div>
					
				
			</form>
		</div>
		<!-- </section> -->
	</div>
	
</section>	

	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>


<!-- include libraries(jQuery, bootstrap) -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>

<!-- summerNote.js -->
<script src="${pageContext.request.contextPath}/resources/js/summerNote-roomInsert.js" type="text/javascript"></script>

<!-- 카카오맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7f1fa385bb585b9a8e3d5219e5bf533&libraries=services"></script>
<!-- 카카오맵 services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7f1fa385bb585b9a8e3d5219e5bf533&libraries=services"></script><%-- 

<!-- 도로명주소API js -->
<script src="${pageContext.request.contextPath}/resources/js/roadAddress.js" type="text/javascript"></script> --%>

<!-- page 설정 -->

<!-- roomInsert.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomInsert.css" type="text/css" />
<!-- roomInsert.js -->
<script src="resources/js/roomInsert.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
    $("img").addClass("img-responsive");
    $("img").css("max-width", "100%");
});
</script>

</html>



