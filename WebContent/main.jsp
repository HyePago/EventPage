<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목공소</title>
<link href="css/myStyle.css" rel="stylesheet">
</head>
<body>
<%
	String contentPage = request.getParameter("CONTENTPAGE");
%>
	<header id="mainHeader">
		<jsp:include page="top.jsp" />
	</header>
	
	<section id="mainSection">
		<jsp:include page="<%= contentPage %>" flush="false" />
	</section>
</body>
</html>