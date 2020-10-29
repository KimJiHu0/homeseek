function goPopup(){
	//경로는 시스템에 맞게 수정하여 사용
	//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 //호출하게 됩니다.

	var pop = window.open("insertpopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.getElementById("room_addr").value = roadFullAddr;  
	
	
	var mapContainer = document.getElementById('show_map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var user_addr = document.getElementById("room_addr").value;

// 주소로 좌표를 검색합니다
geocoder.addressSearch(user_addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">매물 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
}


//------------------------- select box속성변화

$(function(){
	$('#insert_roomtype').change(function(){
		if(this.value == "3"){
			$("#insert_deposit").hide();
			$("#deposit_label").hide();
			
			$(".insert_form").attr("action", "insertres2.do");
			
		} else{
			$("#insert_deposit").show();
			$("#deposit_label").show();
			$(".form_div").attr("action", "insertres.do");
		}
	})
})




















