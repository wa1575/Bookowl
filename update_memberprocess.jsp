<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,
                   com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                   java.io.*" %>
<%@ page import="thinkonweb.util.*" %> 

<%
   request.setCharacterEncoding("utf-8");
%>

<% 

 
  String memberid = request.getParameter("memberID");
  String memberpw = request.getParameter("memberPW");
  String membername = request.getParameter("memberName");
  String memberphone = request.getParameter("memberPhone");
  String memberaddress = request.getParameter("memberAddress");

  String sql = "update member set  pw = ?, name = ?, phone = ?,  address = ? where id = ?";
    
   Class.forName("oracle.jdbc.driver.OracleDriver");

   try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");

         PreparedStatement pstmt = conn.prepareStatement(sql);
	 
      
               pstmt.setString(1, memberpw);
       	 pstmt.setString(2, membername);
	 pstmt.setString(3, memberphone);
	 pstmt.setString(4, memberaddress);
     
         pstmt.setString(5, memberid);
         pstmt.executeUpdate();

	 pstmt.close();
         conn.close();
    } catch(Exception e) {
         e.printStackTrace();
    }

%>    

<%
  response.sendRedirect("member.jsp");  // 끝나면 member.jsp로 보낸다.
%>