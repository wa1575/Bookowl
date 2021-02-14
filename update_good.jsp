<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%@ page import="java.util.*" %>
<%
  String masterID = (String)session.getAttribute("MasterLoginID");
  boolean isLogin = false;
  if (masterID != null) {
    isLogin = true; 
  }

  if(!isLogin){
%>
	<script>
		alert("로그인해야 상품 수정이 가능합니다.");
		location.href("login.jsp");
	</script>	
<%
  } else {
   
   String goodID = request.getParameter("goodID"); 
   String outName = null, outStatus = null, outImage = null;
   String outSchool = null;
   int outPrice = 0;

   String sql = "SELECT * from goods where good_id = ?";
   
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
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/maincss.css">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>상품 수정</title>
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
			<h1 class="text-center">상품 수정 페이지</h1>
			
		</div>
	</div>

<form action="update_process.jsp" enctype="multipart/form-data" method="post">
<div class="container">
<table class = "table table-bordered text- center" >
   <tr><td class = "col-xs-1">상품 상태</td><td class = "col-xs-2">
<% if(outStatus.equals("판매중")){ %>
    <input type="radio" name="goodStatus" value="판매중" checked>판매중<br/>
<% } else { %>
    <input type="radio" name="goodStatus" value="판매중">판매중<br/>
<% } %>
<% if(outStatus.equals("거래중")){ %>
    <input type="radio" name="goodStatus" value="거래중" checked>거래중<br/>
<% } else { %>
    <input type="radio" name="goodStatus" value="거래중">거래중<br/>
<% } %>
<% if(outStatus.equals("판매완료")){ %>
    <input type="radio" name="goodStatus" value="판매완료" checked>판매완료<br/>
<% } else { %>
    <input type="radio" name="goodStatus" value="판매완료">판매완료<br/>
<% } %>
  <tr><td>상품 이미지</td><td><input type="file" name="goodImage" value=<%=outImage %>></td></tr>
  <tr><td>상품 ID</td><td><%=goodID %></td><input type="hidden" name="goodID" value="<%=goodID %>"></tr>
  <tr><td>상품 이름</td><td><input type="text" name="goodName" value="<%=outName %>"></td></tr> 
  <tr><td>상품 가격</td><td><input type="text" name="goodPrice" value=<%=outPrice %>></td></tr>
  <tr><td>학교</td><td><input type="text" name="goodShcool" value="<%=outSchool %>"></td></tr>
    
  <tr>
<td align="center" colspan = 2><input type="submit" class="btn btn-primary form-control" value="수정하기">

</td>

</tr>
  </table>
</div>
</form> 
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

<% } %>