<%@page import="mandalart.MandalartDAO"%>
<%@page import="mandalart.Mandalart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table style="width: 900px; margin: auto;" class="selectTable">
		<tr>
			<th width="150px"> Email </th>
			<th width="175px"> Center </th>
			<th width="175px"> Top </th>
			<th width="175px"> Left </th>
			<th width="175px"> Right </th>
			<th width="50px"> Check </th>
		</tr>
		<%
			ArrayList<Mandalart> mandalarts = new ArrayList<>();
			MandalartDAO mandalartDAO = new MandalartDAO();
				
			mandalarts = mandalartDAO.getList();
				
			for(int i=0; i<mandalarts.size(); i++) {
				%>
				<tr>
					<td><%= mandalarts.get(i).getEmail() %></td>
					<td>
						<span style="font-weight: bold; color: #677e52;"><%= mandalarts.get(i).getCenterCenterInput() %></span><br>
						<%= mandalarts.get(i).getCenterLeftInput() %><br>
						<%= mandalarts.get(i).getCenterFirstInput() %><br>
						<%= mandalarts.get(i).getCenterRightInput() %>
					</td>
					<td>
						<span style="font-weight: bold; color: #677e52;"><%= mandalarts.get(i).getFirstCenterInput() %></span><br>
						<%= mandalarts.get(i).getFirstFirstInput() %><br>
						<%= mandalarts.get(i).getFirstLeftInput() %><br>
						<%= mandalarts.get(i).getFirstRightInput() %>
					</td>
					<td>
						<span style="font-weight: bold; color: #677e52;"><%= mandalarts.get(i).getThirdCenterInput() %></span><br>
						<%= mandalarts.get(i).getThirdFirstInput() %><br>
						<%= mandalarts.get(i).getThirdLeftInput() %><br>
						<%= mandalarts.get(i).getThirdRightInput() %>
					</td>
					<td>
						<span style="font-weight: bold; color: #677e52;"><%= mandalarts.get(i).getSecondCenterInput() %></span><br>
						<%= mandalarts.get(i).getSecondFirstInput() %><br>
						<%= mandalarts.get(i).getSecondLeftInput() %><br>
						<%= mandalarts.get(i).getSecondRightInput() %>
					</td>
					<td>
						<%
							if(mandalarts.get(i).getSelected() == 0) {
								%>
									<input type="button" class="selectedbtn" onclick="javascript:myFunction('<%= mandalarts.get(i).getId() %>')" value="당첨">
								<%
							} else {
								%>
									<input type="button" class="selectedbtn2" onclick="javascript:myFunction2('<%= mandalarts.get(i).getId() %>')" value="당첨됨">
								<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td colspan="6"><hr color="#677e52" /></td>
				</tr>
				<%
			}
		%>
	</table>
	<script>
		function myFunction(rid) {
			var result = confirm("정말 당첨시키겠습니까?");
			if(result == true) {
				location.href="selected.jsp?id=" + rid;
			}
		}
		
		function myFunction2(rid) {
			var result = confirm("정말 취소시키겠습니까?");
			if(result == true) {
				location.href="notselected.jsp?id=" + rid;
			}
		}
	</script>
</body>
</html>