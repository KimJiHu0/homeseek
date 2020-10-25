<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 매물 수정하기</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
     $('#summernote').summernote({
           placeholder: '신고 내용을 작성해주세요.',
           minHeight: 370,
           maxHeight: 370,
           focus: true, 
           lang : 'ko-KR'
     });
   });
</script>

<!-- 도로명주소API JS -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/roomDetailUpdateForm.css"
	type="text/css" />
<script>
	// 도로주소명API스크립트
	function addrcheck() {
		new daum.Postcode({
			oncomplete : function(data) {

				// 주소 변수
				var addr = '';

				// 사용자가 선택한 주소가 도로명주소일 때
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					// 사용자가 선택한 주소가 지번주소일 때 
					addr = data.jibunAddress;
				}
			$("[name=room_addr]").val(addr);
			}
		
		}).open();
	}
</script>

<script type="text/javascript">
	// 매물 거래 종류를 선언 => 전세,월세,매매,반전세,단기임대
	var room_type = "${room.room_type}";
	// 매물 종류 => 아파트, 빌라, 주택, 오피스텔, 상가사무실
	var room_kind = "${room.room_kind}";
	// 매물 방 구조 => 방1개, 방2개, 방3개 이상
	var room_structure = "${room.room_structure}";

	$(
			function() {

				// 매물 종류 selected 조건문
				// room_type가 1 = 월세 / 2 = 전세 / 3 = 매매 / 4 = 반전세 / 5 = 단기임대 
				if (room_type == 1) {
					$("#room_type option[value=1]")
							.prop('selected', 'selected').change();
				} else if (room_type == 2) {
					$("#room_type option[value=2]")
							.prop('selected', 'selected').change();
				} else if (room_type == 3) {
					$("#room_type option[value=3]")
							.prop('selected', 'selected').change();
				} else if (room_type == 4) {
					$("#room_type option[value=4]")
							.prop('selected', 'selected').change();
				} else if (room_type == 5) {
					$("#room_type option[value=5]")
							.prop('selected', 'selected').change();
				}
				// 매물 종류 selected 조건문

				if (room_kind == 1) {
					$("#room_kind option[value=1]")
							.prop('selected', 'selected').change();
				} else if (room_kind == 2) {
					$("#room_kind option[value=2]")
							.prop('selected', 'selected').change();
				} else if (room_kind == 3) {
					$("#room_kind option[value=3]")
							.prop('selected', 'selected').change();
				} else if (room_kind == 4) {
					$("#room_kind option[value=4]")
							.prop('selected', 'selected').change();
				} else if (room_kind == 5) {
					$("#room_kind option[value=5]")
							.prop('selected', 'selected').change();
				}
				// 매물 방 구조 selected 조건문
				if (room_structure == 1) {
					$("#room_structure option[value=1]").prop('selected',
							'selected').change();
				} else if (room_structure == 2) {
					$("#room_structure option[value=2]").prop('selected',
							'selected').change();
				} else if (room_structure == 3) {
					$("#room_structure option[value=3]").prop('selected',
							'selected').change();
				}
			})
</script>

</head>
<body>
	<!-- header.jsp include -->
	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<section>
		<h1>수정</h1>
		<form action="updateroomres.do" method="POST" id="typechange">
			<input type="hidden" value="${room.room_no }" name="room_no" />
			<table border="1">
				<tr>
					<th>매물이름</th>
					<td><input type="text" value="${room.room_name }"
						name="room_name"></td>
				</tr>
				<tr>
					<th>매물종류</th>
					<td><select id="room_type" name="room_type">
							<option value="1">월세</option>
							<option value="2">전세</option>
							<option value="3">매매</option>
							<option value="4">반전세</option>
							<option value="5">단기임대</option>
					</select></td>
				</tr>
				<tr>
					<th>보증금</th>
					<td><input type="text" value="${room.room_deposit }"
						name="room_deposit"></td>
				</tr>
				<tr>
					<th>매물가격</th>
					<td><input type="text" value="${room.room_price }"
						name="room_price"></td>
				</tr>
				<tr>
					<th>매물면적</th>
					<td><input type="text" value="${room.room_extent }"
						name="room_extent" placeholder="단위 : 제곱미터"></td>
				</tr>
				<tr>
					<th>매물주소</th>
					<td><input type="text" value="${room.room_addr }"
						name="room_addr" placeholder="도로명주소로 입력해주세요"
						onclick="addrcheck();"></td>
				</tr>
				<tr>
					<th>건물종류</th>
					<td><select id="room_kind" name="room_kind">
							<option value="1">아파트</option>
							<option value="2">빌라</option>
							<option value="3">주택</option>
							<option value="4">오피스텔</option>
							<option value="5">상가사무실</option>
					</select></td>
				</tr>
				<tr>
					<th>방 구조</th>
					<td><select id="room_structure" name="room_structure">
							<option value="1">방 1개</option>
							<option value="2">방 2개</option>
							<option value="3">방 3개이상</option>
					</select></td>
				</tr>
				<tr>
					<th>방 층수</th>
					<td><input type="text" value="${room.room_floor }"
						name="room_floor"></td>
				</tr>
				<tr>
					<th>매물 등록날짜</th>
					<td><input type="date" value="${room.room_regdate}"
						id="room_regdate" readonly="readonly" name="room_regdate"></td>
				</tr>
				<tr>
					<th>준공 날짜</th>
					<td><input type="date" value="${room.room_cpdate}"
						id="room_cpdate" name="room_cpdate"></td>
				</tr>
				<tr>
					<th>입주 가능일</th>
					<td><input type="date" value="${room.room_avdate}"
						id="room_avdate" name="room_avdate"></td>
				</tr>
				<tr>
					<th>방 상세설명</th>
					<td>
						<textarea rows="10" cols="60" id="summernote" name="room_detail">${room.room_detail }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="location.href='detailroom.do?room_no=${room.room_no }'">
					</td>
				</tr>
			</table>
		</form>
	</section>

	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>