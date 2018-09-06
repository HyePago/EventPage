<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/myStyle.css" rel="stylesheet">
</head>
<body>
	<form action="eventProc.jsp" method="post">
		<table style="text-align: center; width: 1200px; margin: auto;" class="eventFirstForm">
			<tr>
				<td>
					<img src="images/mandal.png" width="800px" height="1150px">
				</td>
			</tr>
		</table>
		<input type="text" class="firstLeftInput evnetInput" name="firstLeftInput" /> <input type="text" class="firstCenterInput evnetInput" name="firstCenterInput" /> <input type="text" class="firstRightInput evnetInput" name="firstRightInput" /> <br>
		<input type="text" class="firstFirstInput evnetInput" name="firstFirstInput" /><br>
		<input type="text" class="centerCenterInput evnetInput" name="centerCenterInput" /> <br>
		<input type="text" class="centerLeftInput evnetInput" name="centerLeftInput" /> <input type="text" class="centerFirstInput evnetInput" name="centerFirstInput" /> <input type="text" class="centerRightInput evnetInput" name="centerRightInput" /><br>
		<input type="text" class="secondLeftInput evnetInput" name="secondLeftInput" /> <input type="text" class="secondCenterInput evnetInput" name="secondCenterInput" /> <input type="text" class="secondRightInput evnetInput" name="secondRightInput" /> <br>
		<input type="text" class="secondFirstInput evnetInput" name="secondFirstInput" /><br>
		<input type="text" class="thirdLeftInput evnetInput" name="thirdLeftInput" /> <input type="text" class="thirdCenterInput evnetInput" name="thirdCenterInput" /> <input type="text" class="thirdRightInput evnetInput" name="thirdRightInput" /> <br>
		<input type="text" class="thirdFirstInput evnetInput" name="thirdFirstInput" /><br>
		
		<table class="eventWriteForm">
			<tr>
				<th width="100px"> 이름 </th>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<th width="100px"> 이메일 </th>
				<td> <input type="email" name="email"> </td>
			</tr>
			<tr>
				<th> 전화번호 </th>
				<td>
					<select name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
					</select>
					&nbsp;-&nbsp;
					<input type="text" name="tel2">
					&nbsp;-&nbsp;
					<input type="text" name="tel3">
				</td>
			</tr>
			<tr style="text-align: center;">
				<td colspan="2">
					<input type="submit" value="제출하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>