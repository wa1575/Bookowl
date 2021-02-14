<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%
  String masterID = (String)session.getAttribute("MasterLoginID");
  boolean isLogin = false;
  if (masterID != null) {
    isLogin = true; 
  }

  if(!isLogin){
%>
	<script>
		alert("로그인해야 회원탈퇴가 가능합니다.");
		location.href("login.jsp");
	</script>	
<%
  } else {
%>


<%
   request.setCharacterEncoding("utf-8");
%>

<% 
  
   String sql = "delete from member where id = ?";
    
   Class.forName("oracle.jdbc.driver.OracleDriver");

   try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");
        
        PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, masterID); 
        pstmt.executeUpdate();

	pstmt.close();
        conn.close();
    } catch(Exception e) {
         e.printStackTrace();
    }
%>    

<%
  response.sendRedirect("logout.jsp");  // 끝나면 logout.jsp로 보낸다.
}
%>