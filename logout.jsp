<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.io.PrintWriter" %>
<html>
<head><title>Menu</title></head>
<body>
<%
	session.invalidate();
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('성공적으로 로그아웃을 하였습니다')");   
	script.println("location.href = 'main.jsp'");
	script.println("</script>");
	
%>



</body>
</html>