<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
onload=function(){
	var res = '${res}';
	if(res > 0){
		alert("신고접수가 완료되었습니다.");
		self.close();
	} else {
		alert("신고접수가 실패하였습니다.");
		self.close();
	}
}
</script>
</head>
<body>
</body>
</html>