<%@page import="mandalart.MandalartDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	request.setCharacterEncoding("EUC-KR");

	Integer id = Integer.parseInt(request.getParameter("id"));
	
	MandalartDAO mandalartDAO = new MandalartDAO();
	mandalartDAO.selected(id);

	out.print("<script>location.href='select.jsp'</script>");
%>