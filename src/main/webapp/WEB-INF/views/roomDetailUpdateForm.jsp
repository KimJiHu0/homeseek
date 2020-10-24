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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<!-- 도로명주소API JS -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/roomDetailUpdateForm.css"
	type="text/css" />
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : 370,
			focus : true,
			lang : 'ko-KR'
		});

		$("#chk").click(function() {
			if ($("#chk").prop("checked")) {
				$("#chk1").val("Y");
				console.log($("#chk1").val());
			} else {
				$("#chk1").val("N");
				console.log($("#chk1").val());
			}
		});
	});

	// 도로주소명API스크립트
	function addrcheck() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                //$("[name=addr1]").val(data.zonecode);
                $("[name=room_addr]").val(fullRoadAddr);
                
                //document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                //document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                //document.getElementById('room_addr').value = data.jibunAddress;
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
					<th>매물사진</th>
					<td><input type="file" name="room_photo"></td>
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
					<th>위도</th>
					<td><input type="text" value="${room.room_longi }"
						name="room_longi"></td>
				</tr>
				<tr>
					<th>경도</th>
					<td><input type="text" value="${room.room_lati }"
						name="room_lati"></td>
				</tr>
				<tr>
					<th>방 상세설명</th>
					<td><textarea rows="10" cols="60" id="summernote"
							name="room_detail">${room.room_detail }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정">
						<input type="button" value="취소"
						onclick="location.href='detailroom.do?room_no=${room.room_no }'">
					</td>
				</tr>
			</table>
		</form>
	</section>

	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
</html>