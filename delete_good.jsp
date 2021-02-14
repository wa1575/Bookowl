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
		alert("로그인해야 상품 삭제가 가능합니다.");
		location.href("login.html");
	</script>	
<%
  } else {
%>
<%
   request.setCharacterEncoding("utf-8");
   String goodID = request.getParameter("goodID");
%>

<% 
  
   String sql = "delete from goods where good_id = ?";
    
   Class.forName("oracle.jdbc.driver.OracleDriver");

   try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");
        
        PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, goodID); 
        pstmt.executeUpdate();

	pstmt.close();
        conn.close();
    } catch(Exception e) {
         e.printStackTrace();
    }
%>    

<%
  response.sendRedirect("selllist.jsp");  // 끝나면 selllist.jsp로 보낸다.
}
%>