<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="1200px" style="text-align: center; width: 1200px;">
		<tr>
			<td><a href="index.jsp"><img src="images/logo_icon.png" style="width: 50px; height: 50px;"></a></td>
		</tr>
		<tr>
			<td>
				<ul class="topUl">
					<li> <a href="index.jsp">BEST</a> </li>
					<li> <a href="">진행 중인 이벤트</a> </li>
					<li> <a href="">종료된 이벤트</a> </li>
					<li> <a href="">담청자 발표</a> </li>
					<% 
					if(((String)session.getAttribute("ID")) == null || ((String)session.getAttribute("ID")).equals("")) { %>
						<li> <a href="login.jsp">로그인</a> </li>
						<li> <a href="join.jsp">회원가입</a> </li>
					<% } else { %>
						<li> <a href="event.jsp">이벤트 등록하기</a>
						<li> <a href="logout.jsp">로그아웃</a> </li>
					<% } %>
				</ul>
				<hr color="#677e52">
			</td>
		</tr>
	</table>
</body>
</html>