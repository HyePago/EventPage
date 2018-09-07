<%@page import="event.EventDAO"%>
<%@page import="event.Event"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		EventDAO eventDAO = new EventDAO();
		
		ArrayList<Event> list;
		list = eventDAO.getOnGoingEventList();
	%>
	<table class="ongoingListTable" width="1400px">
		<%
			for(int i=0; i<list.size(); i++) {
				%>
				<tr>
					<td> <img src="<%= list.get(i).getPicture() %>"> </td>
					<td> <%= list.get(i).getTitle() %> <br> ~<%= list.get(i).getEnddate() %> </td>
				</tr>
				<%
			}
		%>
		
	</table>
</body>
</html>