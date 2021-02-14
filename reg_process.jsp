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
  String savePath = application.getRealPath("/images");
  int sizeLimit = 5 * 1024 * 1024 ; 
  
  MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());  
  
  File file = multi.getFile("goodImage"); 
  
  String fileName=file.getName(); 
  long fileSize=file.length(); 


  String goodstatus = multi.getParameter("goodStatus");
  String goodid = multi.getParameter("goodID");
  String goodname = multi.getParameter("goodName");
  int goodprice = Integer.parseInt(multi.getParameter("goodPrice"));
  String goodschool = multi.getParameter("goodSchool");
  String user_id = multi.getParameter("userID");

  String sql = "insert into goods values (?,?,?,?,?,?,?)";
    
 Class.forName("oracle.jdbc.driver.OracleDriver");

 try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");

         PreparedStatement pstmt = conn.prepareStatement(sql);
	 pstmt.setString(1, goodstatus);
            	 pstmt.setString(2, fileName);
               pstmt.setString(3, goodid);         
       	 pstmt.setString(4, goodname);
	 pstmt.setInt(5, goodprice);
	 pstmt.setString(6, goodschool);
               pstmt.setString(7, user_id);
         pstmt.executeUpdate();

	 pstmt.close();
         conn.close();
    } catch(Exception e) {
         e.printStackTrace();
    }
   


%>    

<%
  response.sendRedirect("selllist.jsp");  // 끝나면 view_goods.jsp로 보낸다.
%>