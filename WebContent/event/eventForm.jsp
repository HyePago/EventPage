<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="event/writeProc.jsp" method="post" enctype="multipart/form-data">
		<table style="width: 1200px; text-align: center;" class="eventTable">
			<tr>	
				<td><input type="text" name="title" placeholder="제목" required /></td>
			</tr>
			<tr>
				<td><textarea name="content" placeholder="내용"></textarea></td>
			</tr>
			<tr>
				<td>
					<label for="image">업로드</label>
					<input type="file" name="image" id="image" class="upload-hidden">
				</td>
			</tr>	
			<tr>
				<td><span style="font-size: 0.9em; color: #677e52; font-weight: bold;">마감일자 | </span> <input type="date" name="enddate"></td>
			</tr>		
			<tr>	
				<td><input type="submit" value="작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>