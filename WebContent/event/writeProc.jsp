<%@page import="event.EventDAO"%>
<%@page import="event.Event"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	request.setCharacterEncoding("UTF-8");

	String savePath = request.getServletContext().getRealPath("img");
	
	int sizeLimit = 1024*1024*15;
	
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	Event event = new Event();
	event.setTitle(multi.getParameter("title"));
	event.setContent(multi.getParameter("content"));
	event.setEnddate(multi.getParameter("enddate"));
	event.setUsername((String)session.getAttribute("ID"));
	
	String fileName = multi.getFilesystemName("image"); 
	
	if(fileName == null) {
		event.setImage("");
	} else {
		event.setImage("img/" + fileName);
	}
	
	EventDAO eventDAO = new EventDAO();
	int result = eventDAO.post(event);
	
	if(result == 1) {
		out.println("<script>");
		out.println("location.href='../ongoingEvent.jsp';");
		out.println("</script>");
	} else if(result == -1) {
		out.println("<script>");
		out.println("alert('데이터베이스 오류입니다.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	} else { 
		out.println("<script>");
		out.println("alert('실패')"); 
		out.println("history.back()");
		out.println("</script>");
	}
%>