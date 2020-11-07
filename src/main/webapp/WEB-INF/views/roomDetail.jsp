<%@page import="com.mvc.homeseek.model.dto.RoomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 매물 상세보기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/roomDetail.css"
	type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>

</head>
<body>
	<!-- header.jsp -->
	<%@ include file="form/header.jsp"%>
	<%
		// 세션 값 가져오기 : 내 아이디
		String wish_id = dto.getMember_id();
	%>
	<section>
		<!-- first container -->
		<div id="firstcontainer">
			<!-- 매물 사진들을 담고있는 div박스 -->
			<div id="imgcontainer">

				<!-- 매물 사진 정보 -->
				<div id="roomimg">
					<a href="javascript:leftimg();">
						<img alt="d" src="resources/img/arrowleft.png" id="leftarrow" class="arrow">
					</a>
					
					<a href="javascript:rightimg();">
						<img alt="d" src="resources/img/arrowright.png" id="rightarrow" class="arrow">
					</a>
				</div>
			</div>

			<!-- 매물 올린 유저 정보를 담는 큰 div -->
			<div id="userinfocontainer">
			<div class="d3DetailBox">
				<div id="userinfodetail">
					<div id="userinfotitle">
						<span id="leftb">사용자 / 매물 정보</span>
						<%
							int wishcheck = (int) request.getAttribute("wishcheck");
							if(wishcheck > 0){
						 %>
							<span id="rightb" class="wish">찜하기♥</span>
						<%
							} else {
						%>
							<span id="rightb" class="wish">찜하기♡</span>
						<%
							}
						%>
					</div>
					<%
						RoomDto room = (RoomDto) request.getAttribute("room");

					// ROOM_TYPE가 매매일 경우에는 매매이기 때문에 ROOM_PRICE만 보여주고
					if (room.getRoom_type().equals("3")) {
					%>
					<div class="roominfocontent">
						<span class="leftb">매물 종류</span> <span class="rightb">매매</span>
					</div>
					<div class="roominfocontent">
						<span class="leftb">매매가</span> <span class="rightb"><fmt:formatNumber value="${room.room_price }" pattern="#,###"/>만원</span>
					</div>
					<%
						// 그게 아니라 전세일 경우에는 ROOM_PRICE와 젠세가로 ROOM_DEPOSIT를 보여준다.
					} else if (room.getRoom_type().equals("2")) {
					%>
					<div class="roominfocontent">
						<span class="leftb">매물</span> <span class="rightb">전세</span>
					</div>
					<div class="roominfocontent">
						<span class="leftb">전세가 </span> <span class="rightb"><fmt:formatNumber value="${room.room_price }" pattern="#,###"/>만원</span>
					</div>
					<%
						// 월세,4,5일 경우에는 둘 다 보여준다.
					} else if (room.getRoom_type().equals("1")) {
					%>
					<div class="roominfocontent">
						<span class="leftb">매물</span> <span class="rightb">월세</span>
					</div>
					<div class="roominfocontent">
						<span class="leftb">보증금</span> <span class="rightb"><fmt:formatNumber value="${room.room_deposit }" pattern="#,###"/>만원</span>
					</div>
					<div class="roominfocontent">
						<span class="leftb">월세가</span> <span class="rightb"><fmt:formatNumber value="${room.room_price }" pattern="#,###"/>만원</span>
					</div>
					<%
						// 반전세인 경우(월세인데 보증금을 더 내고 월세를 줄인다.)
					} else if (room.getRoom_type().equals("4")) {
					%>
					<div class="roominfocontent">
						<span class="leftb">매물</span> <span class="rightb">반전세</span>
					</div>
					<div class="roominfocontent">
						<span class="leftb">보증금</span> <span class="rightb"><fmt:formatNumber value="${room.room_deposit }" pattern="#,###"/>만원</span>
					</div>
					<div class="roominfocontent">
						<span class="leftb">월세가</span> <span class="rightb"><fmt:formatNumber value="${room.room_price }" pattern="#,###"/>만원</span>
					</div>
					<%
						} else {
					%>
					<div class="roominfocontent">
						<span class="leftb">매물</span> <span class="rightb">단기임대</span>
					</div>
					<div class="roominfocontent">
						<span class="leftb">보증금 : </span> <span class="rightb"><fmt:formatNumber value="${room.room_deposit }" pattern="#,###"/>만원</span>
					</div>
					<div class="roominfocontent">
						<span class="leftb">월세가 : </span> <span class="rightb"><fmt:formatNumber value="${room.room_price }" pattern="#,###"/>만원</span>
					</div>
					<%
						}
					%>

					<div class="userinfocontent">
						<span class="leftb">ID / NAME </span><span class="rightb">${member.member_name }(${member.member_id })</span>
					</div>
					<div class="userinfocontent">
						<span class="leftb"><a href="javascript:reportUser()"
							id="reportbtn">신고</a></span><span class="rightb"><a
							href="javascript:messageUser()" id="messagebtn">쪽지</a></span>
					</div>
					<div class="userinfocontent">
						<span class="leftb">Phone </span><span class="rightb">${member.member_phone }</span>
					</div>
					<div class="userinfocontent">
						<span class="leftb"></span><span class="rightb"></span>
					</div>
				</div>
				<div class="d3Content" >
					<p class="pieinfo">&lt;매매가 및 전세금&gt;</p>
					<div id="piechart1" ></div>
					<div id="pieresult1"></div>
					
					<c:choose>
						<c:when test="${room.room_type != 3 }">
							<p class="pieinfo">&lt;월세&gt;</p>
							<div id="piechart2"></div>
							<div id="pieresult2"></div>						
						</c:when>
					</c:choose>
				</div>
				</div>
			</div>
						
		</div>

		<!-- second container -->

		<div id="noticeinfo">
			<span class="leftroom"> 안전한 거래를 위해 필요한 서류를 <b>꼭</b> 참고해주세요. <a href="noticelist.do"> [ 공지사항
					바로가기 ]</a>
			</span>
		</div>
		

		<div id="roommap"></div>
		<!-- kakaoMap을 쓰기위한 스크립트 -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6f2a4b2da3be8e7e22cff8692d2d202&libraries=services,clusterer,drawing"></script>
		<script type="text/javascript">
			//-------------------------지도쓰기-----------------------//
			// roommap이라는 div를 container이라는 변수에 담아주기. [실제로 map이 담길 div]
			var container = document.getElementById("roommap");
			// 지도를 생성할 때 필요한 기본 옵션
			var options = {
				// 지도의 중심좌표
				// LatLng : center에 넣을 위도와 경도를 생성해주는 클래스
				// 위도(latitude) / 경도(longitude)
				center : new kakao.maps.LatLng(33.450701, 126.570667),
				// 지도의 레벨(확대, 축소 정도)
				level : 3
			}

			// 지도 생성 및 객체 리턴
			var map = new kakao.maps.Map(container, options);
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도 타입 컨트롤을 지도에 표시합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 마커가 지도 위에 표기되도록 설정
			var infowindow = new kakao.maps.InfoWindow({
				zindex : 1
			});
			// 주소를 위도와 경도로 변환시켜주는 객체
			var geocoder = new kakao.maps.services.Geocoder();
			// roadname은 주소를 뜻하는데 room_addr은 지번 혹은 도로명주소를 받아오기 때문에 설정
			var roadname = '${room.room_addr}';

			// 주소로 좌표를 검색
			geocoder.addressSearch(roadname, function(result, status) {
				// 정상적으로 검색이 완료되면
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					// 마커에 대한 설정
					var imgSrc = "resources/img/pin.png",
					imgSize = new kakao.maps.Size(64, 69),
					imgOption = {offset : new kakao.maps.Point(27, 69)};
					
					var markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption);

					// 결과값으로 받은 위치를 마커로 표시
					var marker = new kakao.maps.Marker({
						position : coords,
						image : markerImg,
						map : map
					});
									// 지도의 중심을 결과값으로 받은 위치로 이동
					map.setCenter(coords);
				}
			});

			$(function() {
				$("#mapcontent").parent().parent().attr('border-radius', '20px');
			})
		</script>

		<!-- third container -->
		<div id="thirdcontainer">
			<!-- 방 정보 제목을 담을 div -->
			<div class="roominfo-title">
				<h2>매물정보</h2>
			</div>
			<!-- 방 정보 내용들을 담을 div -->
			<div class="roominfo-content">
				<!-- 하나의 제목과 내용을 담을 div -->
				<div class="roominfo-detail">
					<!-- 컬럼div -->
					<div class="roominfo-detail-title">
						매물 이름
					</div>
					<!-- 해당 컬럼의 값 div -->
					<div class="roominfo-detail-content">
						${room.room_name }
					</div>
				</div>
				
				<div class="roominfo-detail">
					<div class="roominfo-detail-title">
						매물 면적(㎡)
					</div>
					<div class="roominfo-detail-content">
						<fmt:formatNumber value="${room.room_extent }" pattern="#,###"/>㎡
					</div>
				</div>
				<div class="roominfo-detail">
					<div class="roominfo-detail-title">
						매물 주소
					</div>
					<div class="roominfo-detail-content">
						${room.room_addr }
					</div>
				</div>
				<div class="roominfo-detail">
					<div class="roominfo-detail-title">
						건물 종류
					</div>
					<div class="roominfo-detail-content">
						<%
							if (room.getRoom_kind().equals("1")) {
						%>
							아파트
						<%
							} else if (room.getRoom_kind().equals("2")) {
						%>
							빌라
						<%
							} else if (room.getRoom_kind().equals("3")) {
						%>
							주택
						<%
							} else if (room.getRoom_kind().equals("4")) {
						%>
							오피스텔
						<%
							} else {
						%>
							상가사무실
						<%
							}
						%>
					</div>
				</div>
				<div class="roominfo-detail">
					<div class="roominfo-detail-title">
						매물 구조
					</div>
					<div class="roominfo-detail-content">
						<%
							if (room.getRoom_structure().equals("1")) {
						%>
							방 1개
						<%
							} else if (room.getRoom_structure().equals("2")) {
						%>
							방 2개
						<%
							} else {
						%>
							방 3개 이상
						<%
							}
						%>
					</div>
				</div>
				<div class="roominfo-detail">
					<div class="roominfo-detail-title">
						매물 층수
					</div>
					<div class="roominfo-detail-content">
						${room.room_floor }층
					</div>
				</div>
				<div class="roominfo-detail">
					<div class="roominfo-detail-title">
						매물 등록 날짜
					</div>
					<div class="roominfo-detail-content">
						${room.room_regdate }
					</div>
				</div>
				<div class="roominfo-detail">
					<div class="roominfo-detail-title">
						매물 준공 날짜
					</div>
					<div class="roominfo-detail-content">
						${room.room_cpdate }
					</div>
				</div>
				<div class="roominfo-detail">
					<div class="roominfo-detail-title">
						입주 가능일
					</div>
					<div class="roominfo-detail-content">
						${room.room_avdate }
					</div>
				</div>
			</div>
				<div class="roominfo-content-detailcontent">
					<div class="roominfo-content-detailcontent-title">
						상세정보
					</div>
				</div>
		</div>
					<div class="roominfo-content-detailcontent-content">
						${room.room_detail }
					</div>

				<%
					// 세션에 로그인되어있는 id를 가지고 수정버튼을 보여줄지 말지 선택

				// 매물올린사람
				String uploadid = room.getRoom_id();

				// 세션에 저장되어있는 사람
				MemberDto user = (MemberDto) request.getSession().getAttribute("login");
				// session에 담겨있는 값. 즉, id를 따로 담아준다.
				String useingid = user.getMember_id();
				if (uploadid.equals(useingid)) {
				%>
				<div class="roominfosubmit">
					<div class="submitbtn">
						<input type="button" value="수정"
							onclick="location.href='updateroom.do?room_no=${room.room_no}'" class="roombtn"/>
						<input type="button" value="삭제"
							onclick="location.href='deleteroom.do?room_no=${room.room_no}'" class="roombtn"/>
					</div>
				</div>
				<%
					}
				%>
	</section>
	<!-- footer.jsp -->
	<%@ include file="form/footer.jsp"%>
</body>
<!-- d3 스크립트 -->
<!-- <script src="https://d3js.org/d3.v3.min.js"></script>     
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script> -->

<!-- Load d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>

<!-- Color scale -->
<script src="https://d3js.org/d3-scale-chromatic.v1.min.js"></script>

<script type="text/javascript">

var jsonAddr ;

if(${room.room_kind == 1} && (${room.room_type == 1} || ${room.room_type == 2} || ${room.room_type == 4})){ 		/* 아파트 : 월세,전세,반전세 일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/apartment(1,2).json";
}else if(${room.room_kind == 1} && ${room.room_type == 3}){															/* 아파트 : 매매일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/apartment(3).json"; 
}else if(${room.room_kind == 2} && (${room.room_type == 1} || ${room.room_type == 2} || ${room.room_type == 4})){	 /* 빌라 : 월세,전세,반전세 일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/villa(1,2).json";
}else if(${room.room_kind == 2} && ${room.room_type == 3}){	 														/* 빌라 : 매매 일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/villa(3).json";
}else if(${room.room_kind == 3} && (${room.room_type == 1} || ${room.room_type == 2} || ${room.room_type == 4})){	 /* 주택 : 월세,전세,반전세 일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/dwellingHouse(1,2).json";
}else if(${room.room_kind == 3} && ${room.room_type == 3}){	 														/* 주택 : 매매 일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/dwellingHouse(3).json";
}else if(${room.room_kind == 4} && (${room.room_type == 1} || ${room.room_type == 2} || ${room.room_type == 4})){	 /* 오피스텔 : 월세,전세,반전세 일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/officetels(1,2).json";
}else if(${room.room_kind == 4} && ${room.room_type == 3}){	 														/* 오피스텔 : 매매 일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/dwellingHouse(3).json";
}else if(${room.room_kind == 5}){																					 /* 상가 일때 */
	jsonAddr = "${pageContext.request.contextPath}/resources/json/commercialBuilding.json";
}



///////////////// 거래금액 및 보증금 
// 거래금액 : A=1억미만, B=1억이상 3억미만, C=3억이상 10억미만, D=10억이상 20억미만, E=20억이상 40억미만, F=40억이상 
// 보증금 : A=3천미만, B=3천이상 6천미만, C=6천이상 1억미만, D=1억이상 3억미만, E=3억이상 6억미만, F=6억이상
var A=0; var B=0; var C=0; var D=0; var E=0; var F=0;
///////////////// 월세 a=25미만, b=25이상 50미만, c=50이상 80미만, d=80이상 150미만, e=150이상 200미만, f=200이상
var a = 0; var b = 0; var c = 0; var d = 0; var e = 0; var f = 0;	

$.ajax({
    async: false, //비동기에서 동기로
    url: jsonAddr,
    success: function(data) {
    	$.each(data,function(index,info){
    		if(${room.room_type == 3}){ // 매매일때
	    		if(info.거래금액 < 10000){
	    			A++;
	    		}else if(10000<= info.거래금액 && info.거래금액<30000){
	    			B++;
	    		}else if(30000<=info.거래금액 && info.거래금액<100000){
	    			C++;
	    		}else if(100000<=info.거래금액 && info.거래금액<200000){
	    			D++;
	    		}else if(200000<=info.거래금액 && info.거래금액<400000){
	    			E++;
	    		}else if(400000<=info.거래금액){
	    			F++;
	    		}
    		}else{ 						// 전세, 월세 일때
	    		if(info.보증금 < 3000){
	    			A++;
	    		}else if(3000<= info.보증금 && info.보증금<6000){
	    			B++;
	    		}else if(6000<=info.보증금 && info.보증금<10000){
	    			C++;
	    		}else if(10000<=info.보증금 && info.보증금<30000){
	    			D++;
	    		}else if(30000<=info.보증금 && info.보증금<60000){
	    			E++;
	    		}else if(60000<=info.보증금){
	    			F++;
	    		}
    			
    			if(info.월세 < 25){
    				a++;
    			}else if(25<= info.월세 && info.월세<50){
    				b++;
    			}else if(50<=info.월세 && info.월세<80){
    				c++;
    			}else if(80<=info.월세 && info.월세<150){
    				d++;
    			}else if(150<=info.월세 && info.월세<200){
    				e++;
    			}else if(200<=info.월세){
    				f++;
    			}
    		}
    	});
    }
});



console.log(A,B,C,D,E,F);
console.log(a,b,c,d,e,f);

var data1 ;
var data2 = [
	{name : "25미만", count : a},
	{name : "25이상 50미만", count : b},
	{name : "50이상 80미만", count : c},
	{name : "80이상 150미만", count : d},
	{name : "150이상 200미만", count : e},
	{name : "200이상", count : f}	
];

if(${room.room_type == 3}){
	data1 = [
		{name : "1억미만", count : A},
		{name : "1억이상 3억미만", count : B},
		{name : "3억이상 10억미만", count : C},
		{name : "10억이상 20억미만", count : D},
		{name : "20억이상 40억미만", count : E},
		{name : "40억이상", count : F}
	]
}else{
	data1 = [
		{name : "3천미만", count : A},
		{name : "3천이상 6천미만", count : B},
		{name : "3천이상 1억미만", count : C},
		{name : "1억이상 3억미만", count : D},
		{name : "3억이상 6억미만", count : E},
		{name : "6억이상", count : F}
	]
}

var resdata1 = data1.sort(function(a,b){return b.count - a.count});
console.log(resdata1[0]);
document.getElementById("pieresult1").innerHTML="ㅇㅇ동에서 가장 많이 이용하는 금액은 "+resdata1[0].name+" 입니다.";

if(${room.room_type != 3}){
	var resdata2 = data2.sort(function(a,b){return b.count - a.count});
	document.getElementById("pieresult2").innerHTML="ㅇㅇ동에서 가장 많이 이용하는 금액은 "+resdata2[0].name+" 입니다.";	
}

///////////////////////////////////// 거래금액 및 보증금 chart
var pie = d3.pie()
  .value(function(d) { return d.count })

var slices = pie(data1);

var arc = d3.arc()
  .innerRadius(0)
  .outerRadius(60);

// helper that returns a color based on an ID
var color = d3.scaleOrdinal(d3.schemeCategory10);

var svg = d3.select('#piechart1')
.append('svg')
.attr("class","pie");
var g = svg.append('g')
  .attr('transform', 'translate(200, 75)');

var arcGraph =g.selectAll('path.slice')
  .data(slices)
    .enter();
arcGraph.append('path')
        .attr('class', 'slice')
        .attr('d', arc)
        .attr('fill', function(d) {
          return color(d.data.name);
        });

svg.append('g')
  .attr('class', 'legend')
    .selectAll('text')
    .data(slices)
      .enter()
        .append('text')
          .text(function(d) { return '• ' + d.data.name; })
          .attr('fill', function(d) { return color(d.data.name); })
          .attr('y', function(d, i) { return 20 * (i + 1); })


///////////////////////////// 월세 chart
var pie = d3.pie()
  .value(function(d) { return d.count })

var slices = pie(data2);

var arc = d3.arc()
  .innerRadius(0)
  .outerRadius(60);

// helper that returns a color based on an ID
var color = d3.scaleOrdinal(d3.schemeCategory10);

var svg = d3.select('#piechart2')
.append('svg')
.attr("class","pie");
var g = svg.append('g')
  .attr('transform', 'translate(200, 75)');

var arcGraph =g.selectAll('path.slice')
  .data(slices)
    .enter();
arcGraph.append('path')
        .attr('class', 'slice')
        .attr('d', arc)
        .attr('fill', function(d) {
          return color(d.data.name);
        });

svg.append('g')
  .attr('class', 'legend')
    .selectAll('text')
    .data(slices)
      .enter()
        .append('text')
          .text(function(d) { return '• ' + d.data.name; })
          .attr('fill', function(d) { return color(d.data.name); })
          .attr('y', function(d, i) { return 20 * (i + 1); })


</script>
<!-- alert띄우기 위한 스크립트 -->
<script type="text/javascript">
	var msg = '${msg}';
	if (msg != '') {
		alert(msg);
	}
	
	/* roomDetail에서 신고버튼을 누르면 실행되는 함수 */
	function reportUser() {
		var room_id = "${member.member_id}";
		open("reportmember.do?room_id=" + room_id, "", "width=750, height=800");
	}

	// roomDetail에서 쪽지 버튼을 누르면 실행하는 함수
	function messageUser() {
		var room_id = "${member.member_id}";
		open("messagemember.do?room_id=" + room_id, "", "width=750, height=800");
	}
	
	// 찜하기 버튼을 클릭했을 때
	// 그러기 위해서는 room_no와, session에 저장되어있는 id의 값이랑, room_id을 가지고 와야함.
	$(".wish").click(function(){
		// 해당 글의 room_no
		var room_no = "${room.room_no}";
		// 내 아이디
		var wish_id = "<%=dto.getMember_id()%>";
		// 판매자 아이디
		var wish_sell_id = "${member.member_id}"; 
		
		var wish_data = {
				"room_no" : room_no,
				"wish_id" : wish_id,
				"wish_sell_id" : wish_sell_id
		}
		if(wish_id != wish_sell_id){
			$.ajax({
				url : "wish.do",
				type : "post",
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(wish_data),
				success : function(wish){
					if(wish.insertwish == 'insert'){
						alert("찜하기가 완료되었습니다.");
						$(".wish").html("찜하기♥");
					} else {
						alert("찜하기가 취소되었습니다.");
						$(".wish").html("찜하기♡");
					}
				},
				
				error : function(){
					alert("연결실패");
				}
			})
		} else {
			return false;
		}
	});
	
	// 시작하자마자 room_photo의 값을 가져와서 잘라주기 위해
	$(function(){
		
		// 디테일을 보여줄 때 넘어오는 room_photo의 값을 변수에 담아주고
		var room_photo_src = '${room.room_photo}';
		
		// 그 변수를 ,를 기준으로 split해서 배열에 담아준다.
		var room_photo_src_split = room_photo_src.split(',');
		// roomimg라는 id를 지닌 태그 안에 img태그를 만들어준다.
		$('#roomimg').append(
			"<img alt='DB에서 가져온 사진' class='room_photo'/>"	
		);
		// 만들어준 img태그에 src를 위에서 받아온 room_photo_src_split의 0번지를 넣어 하나만 넣어준다.
		$('.room_photo').attr("src", room_photo_src_split[0]);
	})	
	
	// "파일이름, 파일이름"
	var room_photo_src = '${room.room_photo}';
	
	// room_photo_src_split[0] = 파일이름
	// room_photo_src_split[1] = 파일이름
	var room_photo_src_split = room_photo_src.split(',');
	
	// insert할 때에 마지막에 , 가 들어가서 detail에서 마지막번지가 null인 상태로 사진들이 보여지게 되서 그 배열을 제거하고 출력해주기 위해.
	if(room_photo_src_split[room_photo_src_split.length-1] == '' || room_photo_src_split[room_photo_src_split.length-1] == null){
		room_photo_src_split.pop();
	}
	
	// 2개의 파일을 올렸으면 2
	var i = room_photo_src_split.length - 1;
	var j = 0;
	
	// 왼쪽 화살표 누르면 넘어가는 함수
	function leftimg(){
		
		--j;
		if(j < 0){
			j = 0;
		} else {
			$('.room_photo').attr("src", room_photo_src_split[j]);
		}
	}
	
	// 오른쪽 화살표 눌면 넘어가는 함수
	function rightimg(){
		++j;
		if(j > i){
			j = room_photo_src_split.length - 1;
		} else {
			$('.room_photo').attr("src", room_photo_src_split[j]);
		}
		
	
	}
	
</script>
</html>