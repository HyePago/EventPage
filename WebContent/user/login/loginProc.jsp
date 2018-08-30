<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" />
<jsp:setProperty name="user" property="username" />
<jsp:setProperty name="user" property="password" />

<%
	UserDAO userDAO = new UserDAO();
	
	int result = userDAO.login(user.getUsername(), user.getPassword());
	
	if(result == 1) {
		// 로그인 성공
		out.println("<script>");
		out.println("location.href = '../../index.jsp'");
		session.setAttribute("ID", user.getUsername());
		out.println("</script>");
	} else if(result == -2) {
		out.println("<script>");
		out.println("alert('데이터베이스 오류입니다.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('아이디 혹은 비밀번호를 다시 한 번 확인해주세요.')"); 
		out.println("history.back()");
		out.println("</script>");
	}
%>
