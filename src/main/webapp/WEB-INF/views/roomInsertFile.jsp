<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">

	function closePop(){
		self.close();
	}

</script>

<body>

	<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="fileuploadres.do">
		<table border="1">
			<tr>
				<th>업로드한 파일</th>
				<td>
						<input multiple="multiple" type="file" name="room_file"/><br/>
						<p style="color: red; font-weight:bold;"><form:errors path="room_file"/></p>
				</td>
			</tr>
			<tr height="100">
				
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="업로드">
					<input type="button" value="취소" onclick="closePop()">
				</td>
			</tr>
		</table>
	</form:form>

</body>
</html>