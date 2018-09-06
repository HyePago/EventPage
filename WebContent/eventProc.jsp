<%@page import="mandalart.MandalartDAO"%>
<%@page import="mandalart.Mandalart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		Mandalart mandalart = new Mandalart();
		mandalart.setFirstLeftInput(request.getParameter("firstLeftInput"));
		mandalart.setFirstCenterInput(request.getParameter("firstCenterInput"));
		mandalart.setFirstRightInput(request.getParameter("firstRightInput"));
		mandalart.setFirstFirstInput(request.getParameter("firstFirstInput"));
		
		mandalart.setCenterLeftInput(request.getParameter("centerLeftInput"));
		mandalart.setCenterCenterInput(request.getParameter("centerCenterInput"));
		mandalart.setCenterFirstInput(request.getParameter("centerFirstInput"));
		mandalart.setCenterRightInput(request.getParameter("centerRightInput"));
		
		mandalart.setSecondLeftInput(request.getParameter("secondLeftInput"));
		mandalart.setSecondCenterInput(request.getParameter("secondCenterInput"));
		mandalart.setSecondRightInput(request.getParameter("secondRightInput"));
		mandalart.setSecondFirstInput(request.getParameter("secondFirstInput"));
		
		mandalart.setThirdLeftInput(request.getParameter("thirdLeftInput"));
		mandalart.setThirdCenterInput(request.getParameter("thirdCenterInput"));
		mandalart.setThirdRightInput(request.getParameter("thirdRightInput"));
		mandalart.setThirdFirstInput(request.getParameter("thirdFirstInput"));
		
		mandalart.setName(request.getParameter("name"));
		mandalart.setPhone(request.getParameter("tel1").trim() + "-" + request.getParameter("tel2").trim() + "-" + request.getParameter("tel3").trim());
		mandalart.setEmail(request.getParameter("email"));
		
		MandalartDAO mandalartDAO = new MandalartDAO();
		mandalartDAO.insert(mandalart);
	%>
</body>
</html>