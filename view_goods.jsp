<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%
   request.setCharacterEncoding("utf-8");
   String masterID = (String)session.getAttribute("MasterLoginID");
   boolean isLogin = false;
   if (masterID != null) {
    isLogin = true; 
   }
 // 카테고리 나누기를 위한 기본 변수 설정(카테고리 0는 전체, 1은 판매중, 2는 거래중, 3은 판매완료
   int this_category = 0;
   if(request.getParameter("category") != null) this_category = Integer.parseInt(request.getParameter("category"));
%>
<html>
<head>
<title>상품 소개 페이지 - 메인</title>
</head>
<body bgcolor = "#EEEEEE">
<table border=1 bgcolor = "#FFFFFF">
  <tr>
  <td>상태</td>
  <td>상품 이미지</td>
  <td>상품 ID</td>
  <td>상품명</td>
  <td>가격</td>
  <td>학교</td>
  <td>판매자</td>
  </tr>

<%
   String outID, outName, outStatus, outSchool, outImage, outuserID;
   int outPrice;

   String sql = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

 
   Class.forName("oracle.jdbc.driver.OracleDriver");

   try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");
        
             sql = "select * from goods ";

        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while(rs.next()){
		outStatus = rs.getString(1);
                            outImage = rs.getString(2);	
                            outID = rs.getString(3);	
		outName = rs.getString(4);	
		outPrice = rs.getInt(5);		
		outSchool = rs.getString(6);	
		outuserID = rs.getString(7);
			
	
%> 
  <tr>
  <td><%=outStatus %></td>
  <td>
<%
  out.print("<img width = '100' height = '100' src=./images/" + outImage + ">");
%>
</td>
  <td><a href="view_good.jsp?goodID=<%=outID %>"><%=outID %></td>
  <td><%=outName %></td>
  <td><%=outPrice %></td>
  <td><%=outSchool %></td>  
  <td><%=outuserID  %></td>  
  
</tr>
<%
  	 }         
         rs.close();
         pstmt.close();
         conn.close();
    } catch(Exception e) {
         e.printStackTrace();
    }
%>
</table>
</body>
</html>