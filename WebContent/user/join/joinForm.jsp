<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="user/join/joinProc.jsp" method="post">
		<table style="width: 1200px; text-align: center;" class="joinTable">
			<tr>	
				<td><input type="text" name="username" placeholder="ID" required /></td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="PASSWORD" required></td>
			</tr>
			<tr>
				<td><input type="text" name="company" placeholder="기업명 및 단체명" required></td>
			</tr>		
			<tr>	
				<td><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>