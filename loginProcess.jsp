<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>

<html>
<head><title></title></head>
<body>
<%
	
            String sql = "SELECT * from member";
            Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");

	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * from member");

      	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	String dbId, dbPw;
	int count=0;
	while(rs.next()){
		dbId = rs.getString("id");
		dbPw = rs.getString("pw");
		if (id.equals(dbId) && pw.equals(dbPw)){	
			session.setAttribute("MasterLoginID",id);
			count++;
		}	
	}
	rs.close();
	stmt.close();
	conn.close();
	

	if(count == 0)
	{
		%>
		<script type="text/javascript">
		<!--
			alert("다시 로그인하세요");
			history.go(-1);
		//-->
		</script>
		<%

	}

	else if(count == 1)
	{
		response.sendRedirect("main_log.jsp");
	%>





	<%

	}

	
	
%>



</body>
</html>