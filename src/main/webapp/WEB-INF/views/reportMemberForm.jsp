<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeseek : 신고하기</title>
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

<!-- reportMemberForm.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reportMemberForm.css" type="text/css" />

<!-- summernote.js 사용 -->
<script src="${pageContext.request.contextPath}/resources/js/summerNote.js" type="text/javascript"></script>

<!-- 취소누르면 창닫기 -->
<script type="text/javascript">
	function reportFormClose(){
		self.close();
	}
	
	function sendReport(){
		var report_senid = '${report_senuser.member_id}';
		var report_reid = '${report_reuser.member_id}';
		var report_title = $("#report_title").val();
		var report_content = $(".summernote").val();

		var data = {
				"report_senid" : report_senid,
				"report_reid" : report_reid,
				"report_title" : report_title,
				"report_content" : report_content
		}
		if(report_title == null || report_title == '' || report_content == null || report_content == ''){
			alert("신고 사유와 신고 내용을 모두 작성해주세요.");
		} else {
			$.ajax({
				type : "post",
				dataType : "json",
				data : JSON.stringify(data),
				contentType : "application/json",
				url : "reportmemberres.do",
				success : function(info){
					if(info.res > 0){
						alert("신고처리가 접수되었습니다.");
						self.close();
					} else {
						alert("신고처리가 실패되었습니다.");
					}
				},
				error : function(){
					alert("실패");
				}
			})
		}
	}
</script>
</head>
<body>
	<div id="firstbox">
		<p class="iconbox" id="icon">HOME<span class="iconbox" id="iconcolor">SEE</span>K</p>
	</div>
	<div class="secondbox">
		<input type="hidden" value="${report_senuser.member_id }" name="report_senid">
		<input type="hidden" value="${report_reuser.member_id }" name="report_reid">
			<table class="report-content">
				<col width="180">
				<col width="180">
				<col width="180">
				<col width="180">
				<tr class="report_tr">
					<th class="report_th">신고받는 아이디</th>
					<th class="report_th">신고받는 이름</th>
					<th class="report_th">신고보내는 아이디</th>
					<th class="report_th">신고보내는 이름</th>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="report_tr">
					<td class="report_td">${report_reuser.member_id }</td>
					<td class="report_td">${report_reuser.member_name }</td>
					<td class="report_td">${report_senuser.member_id }</td>
					<td class="report_td">${report_senuser.member_name }</td>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="report_tr">
					<th class="report_th">신고사유</th>
					<td colspan="3" class="report_td">
						<input type="text" class="report_title" id="report_title" name="report_title" placeholder="신고 사유를 작성해주세요"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="report_tr">
					<th class="report_th">내용</th>
					<td colspan="3">
						<textarea class="summernote" name="report_content"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				<tr class="reportbtn-two">
					<td colspan="2">
						<input type="button" value="보내기" class="reportbtn" onclick="sendReport();"/>
					</td>
					<td colspan="2">
						<input type="button" value="취소" class="reportbtn" onclick="reportFormClose();"/>
					</td>
				</tr>
			</table>
	</div>
</body>
</html>