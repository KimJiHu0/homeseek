<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="./form/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomList.css" type="text/css" />

<!-- alert띄우기 위한 스크립트 -->
<script type="text/javascript"> 
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
    
 
   
var cnt = 1;
var word = $('#navsearchtxt').val();
console.log("word : " +word);
/* 엘라스틱서치 할 때 스크롤 페이징 진행 */
window.onscroll = function(e) {
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		showList(cnt);
		cnt++;
    }
};


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function showList(cnt){
	$.ajax({
		url : "appendList.do?cnt="+cnt+"&word="+word,
		dataType :"json",
		contentType : "application/json",
		success : function(resMap){
			if(resMap.msg==true){
				alert("마지막 리스트 입니다.");
				return false;
			}else{
				var list = resMap.roomlist;
				$.each(list, function(index, room){
					console.log(index + " : "+room.room_no);
					
					var comma_price = numberWithCommas(room.room_price);
				
					$(".imgs").prepend(
						"<div class='imgbox'>"								
						+	"<a href='detailroom.do?room_no='"+room.room_no+"'><img src='"+room.room_photo+"' class='img' alt='"+room.room_no+" 사진'/></a>"
						+	"<div class='content'>"
						+		"<div class='room_type'>"
						+			room.room_type
						+		"</div>"
						+		"<div class='room_price'>"
						+			comma_price+"만원"
						+		"</div>"
						+	"</div>"
						+"</div>"
					);
				});
			}
		},
		error:function(){
			alert("통신에러");
		}
		
	});
}; 




	
</script>
</head>
<body>
	
	<section>
		<div class="list">
			<div class="imgs">
				<c:choose>
					<c:when test="${empty list }">
						<div class="no_imgs">검색된 결과가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="list">
							<div class="imgbox" >
								<a href="detailroom.do?room_no=${list.room_no }"><img src="${list.room_photo }" class="img" alt="${list.room_no } 사진"></a>
								<div class="content">
									<div class="room_type">
										<c:choose>
											<c:when test="${list.room_type == 1 }">
												월세
											</c:when>
											<c:when test="${list.room_type == 2 }">
												전세
											</c:when>
											<c:when test="${list.room_type == 3 }">
												매매
											</c:when>
											<c:when test="${list.room_type == 4 }">
												반전세
											</c:when>
											<c:otherwise>
												단기임대
											</c:otherwise>
										</c:choose>
									</div>
									<div class="room_price">
										<fmt:formatNumber value="${list.room_price }" pattern="#,###" />만원
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			
		</div>

 		
 <!-- **************** 페이징 ************  -->
		
		<!-- 첫 페이지로 이동 -->
		<p align="center">
			<a href="listroom.do?page=1">첫 페이지</a>
			
	<!-- 이전 페이지 그룹 처리 -->
		<c:choose>
			<c:when test="${requestScope.pageBean.previousPageGroup }">
				<!-- 이전 페이지 그룹이 있다면 isPreviousPageGroup() 호출 -->
				<a href="listroom.do?page=${requestScope.pageBean.beginPage - 1 }">◀</a>
			</c:when>
			<c:otherwise>
			◀
		</c:otherwise>
		</c:choose>


	<!-- 현재 page가 속한 page, 그룹 내의 페이지들 링크  -->	
		<c:forEach begin="${requestScope.pageBean.beginPage }"
			end="${requestScope.pageBean.endPage }" var="page">
			<c:choose>
				<c:when test="${requestScope.pageBean.page != page }">
					<!-- 현재 페이지가 아니라면 -->
					<a href="listroom.do?page=${page}">${page }&nbsp;&nbsp;</a>
				</c:when>
				<c:otherwise>
				[${page }]&nbsp;&nbsp;  <!-- &nbsp;는 공백을 나타냄 -->
				</c:otherwise>
			</c:choose>
		</c:forEach>
			
			
	<!-- 다음페이지 그룹으로 이동. 만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리 -->
		<c:choose>
			<c:when test="${requestScope.pageBean.nextPageGroup }">
		<!-- 		isNextPageGroup() 호출 -->
				<a href="listroom.do?page=${requestScope.pageBean.endPage + 1 }">▶</a>
				<!-- getEndPage()에서 리턴된 값 넣기 -->
			</c:when>
			<c:otherwise>
			▶
		</c:otherwise>
		</c:choose>		
		
		
	<!-- 마지막 페이지로 이동 -->
		<a href="listroom.do?page=${requestScope.pageBean.totalPage}">마지막 페이지</a>
			
		</p>
		 
	</section>
	
	<%@ include file="./form/footer.jsp" %>
</body>
</html>