<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="event/joinProc.jsp" method="post">
		<table style="width: 1200px; text-align: center;" class="eventTable">
			<tr>	
				<td><input type="text" name="title" placeholder="제목" required /></td>
			</tr>
			<tr>
				<td><textarea name="content" placeholder="내용"></textarea></td>
			</tr>
			<tr>
				<td><input type="file" name="image"></td>
			</tr>		
			<tr>
				<td><input type="date" name="enddate"></td>
			</tr>		
			<tr>	
				<td><input type="submit" value="작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>