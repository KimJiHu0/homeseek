<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Regist</h1>
	
	<form action="registres.do" method="post">
		<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="member_id"/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="member_pw"/></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="member_name"/></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="member_email"/></td>
			</tr>
			<tr>
				<th>Phone Number</th>
				<td><input type="text" name="member_phone"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="회원등록"/>
					<input type="button" value="취소" onclick="location.href='main.do'"/>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>