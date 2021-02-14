<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%
   request.setCharacterEncoding("utf-8");

   String goodID = request.getParameter("goodID");   

   String masterID = (String)session.getAttribute("MasterLoginID");
   boolean isLogin = false;
   if (masterID != null) {
    isLogin = true; 
   }

   String outName = null, outStatus = null, outImage = null;
   String outSchool = null;
   String outuserID = masterID;
   String outPhone = null;
   int outPrice = 0;

    String sql = "SELECT * from goods where good_ID = ?";

    String sql2 = "SELECT * from member where id = ?";
   
   Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");

         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, goodID);

         ResultSet rs = pstmt.executeQuery();

         if(rs.next()){
		outStatus = rs.getString(1);
                        outImage = rs.getString(2);	
		outName = rs.getString(4);	
		outPrice = rs.getInt(5);		
		outSchool = rs.getString(6);	
		outuserID = rs.getString(7);	
         }  


         pstmt = conn.prepareStatement(sql2);
         pstmt.setString(1, outuserID);

         rs = pstmt.executeQuery();
         if(rs.next()){
		outPhone = rs.getString(4);
         }  

         rs.close();
         pstmt.close();
         conn.close();
    } catch(Exception e) {
         e.printStackTrace();
    }
 
%>
<html>
<head>
<meta charset = "UTF-8">
<meta name = "viewport" content= "width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel="stylesheet" href="css/maincss.css">
<title>상품 상세 소개 페이지</title>
</head>
<body>
<style type="text/css">
			.jumbotron{
				background-image: url('logo/book.jpg');
				background-image: cover;
				text-shadow: black 0.2em 0.2em 0.2em;
				color: white;
		}
		</style>

<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">상품 소개</h1>
			
		</div>
	</div>
<div class="container">
<table  class ="table" border=1 width=200>

<tbody>
  <tr>
  <td align=center valign=middle width=200 height=200 colspan=2>
<%
  out.print("<img src=./images/" + outImage + " width=250 height=250>");
%>
</td>
</tr>
<tr>
  <td bgcolor= "#d2d2d2"  align = "center"><b>상품명</b></td><td><%=outName %></td>
</tr>
<tr> 
  <td bgcolor= "#d2d2d2" align = "center"><b>가격</b></td><td><%=outPrice %></td>
</tr>
<tr>
  <td bgcolor= "#d2d2d2" align = "center"><b>상태</b></td><td><%=outStatus %></td>
</tr>
<tr>
  <td bgcolor= "#d2d2d2" align = "center"><b>학교</b></td><td><%=outSchool %></td>
</tr>
<tr>
  <td bgcolor= "#d2d2d2" align = "center"><b>판매자 연락처</b></td><td><%=outPhone %></td>
</tr>


</tbody> 
</table></div>

<footer>
			<div class="container">
				<br>
				<div class="row" style="text-align:center;">
					<div class="col-sm-3" ><img src="logo/home_logo.png" width="30" height="30"><a href="main_log.jsp"><h5>홈</h5></a></div>
					<div class="col-sm-3" ><img src="logo/sell_logo.png" width="30" height="30"><a href="reg_good.jsp"><h5>판매하기</h5></a></div>
					<div class="col-sm-3" ><img src="logo/money_logo.png" width="30" height="30"><a href="selllist.jsp"><h5>마이페이지</h5></a></div>
					<div class="col-sm-3" ><img src="logo/logout_logo.png" width="30" height="30"><a href="logout.jsp"><h5>로그아웃</h5></a></div>
				</div>
			</div>
			
		</footer>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>