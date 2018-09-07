<%@page import="mandalart.Mandalart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mandalart.MandalartDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<Mandalart> mandalarts = new ArrayList<Mandalart>();
	
		MandalartDAO mandalartDAO = new MandalartDAO();
		mandalarts = mandalartDAO.getWinner();
	%>
	<table style="width: 1000px; margin: auto; text-align: center;">
		<tr>
			<th>전화번호 뒷 자리</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		<%
			for(int i=0; i<mandalarts.size(); i++) {
				String tel = mandalarts.get(i).getPhone().substring(mandalarts.get(i).getPhone().length() - 4, mandalarts.get(i).getPhone().length());
				%>
				<tr>
					<td><%= tel %></td>
					<td><%= mandalarts.get(i).getName() %></td>
					<td><%= mandalarts.get(i).getEmail() %></td>
				</tr>
				<%
			}
		%>
	</table>
</body>
</html>