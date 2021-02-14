<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,
                   com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                   java.io.*" %>
<%@ page import="thinkonweb.util.*" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<title>북엉</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/maincss.css">

	</head>
		
	<body>
		<style>
  table {
    width: 100%;
    border: 1px solid #444444;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>
		<style type="text/css"></style>
	
	
		<header>
			<div>
				<br><center>
					<img src="logo/bookowl_logo.png" width="150" height="75">
				</center><br>
			</div>
		
		<div class="container">
			<form name ="search" method = "get" action ="search_goods.jsp">
			<div class="row">
        <div class="col-md-12">
    	
            <div id="custom-search-input">
                <div class="input-group col-md-12">

                    <input type="text" name="keyword" class="form-control input-lg" placeholder="구매할 책을 검색하세요!"  />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>
	</div>
</div>
		</header>
<%
String goodStatus, goodImage, goodName;
int goodPrice;

		Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");
	
	Statement stmt = conn.createStatement();
	
	String strSQL = "SELECT * FROM goods";
	ResultSet rs = stmt.executeQuery(strSQL);
	

	%>


<br><br><br><br><br><br><br><br><br><br>
<div class="container" style="overflow: scroll;height:690px">
	<table class="table">
		<thead>
			<tr>
				<th><center>상태</center></th>
				<th><center>상품 이미지</center></th>
				<th><center>상품명</center></th>
				<th><center>가격</center></th>
			</tr>
		</thead>
		<tbody>
<%
				while(rs.next()){
		goodStatus=rs.getString("good_status");
		goodImage=rs.getString("good_image");
		goodName=rs.getString("good_name");
		goodPrice=rs.getInt("good_price"); 
		%>

			
			<TR>
			<TD><center><b><%=goodStatus %></b></center></TD>
			<TD><center><% out.print("<img width='100' height='100' src=./images/" + goodImage + ">"); %></center></TD>
			<TD><center><b><%=goodName %></b></center></TD>
			<TD><center><b><%=goodPrice %></b></center></TD>
			</TR>
			<%}%>
		</tbody>
	</table>
<%	
rs.close();
stmt.close();
conn.close();
}
catch(SQLException e){}
%>
</div>


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