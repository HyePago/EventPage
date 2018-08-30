<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" />
<jsp:setProperty name="user" property="username" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="company" />

<%
	UserDAO userDAO = new UserDAO();
	
	int result = userDAO.join(user);
	
	if(result == -2) {
		out.println("<script>");
		out.println("alert('이미 존재하는 아이디입니다.')"); 
		out.println("history.back()");
		out.println("</script>");
	} else if(result == -1) {
		out.println("<script>");
		out.println("alert('데이터베이스 오류입니다.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	} else {
		// 회원가입 성공
		out.println("<script>");
		out.println("location.href = '../../login.jsp'");
		out.println("</script>");
	}
%>
