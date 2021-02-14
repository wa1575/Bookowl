<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%
   request.setCharacterEncoding("utf-8");

   String masterID = (String)session.getAttribute("MasterLoginID");
   boolean isLogin = false;
   if (masterID != null) {
    isLogin = true; 
   }

   String outid = masterID;
   String outaddress = null, outname = null, outphone = null;


    String sql = "SELECT * from member where id = ?";

   
   Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");

         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, masterID);
       
         ResultSet rs = pstmt.executeQuery();
         if(rs.next()){
		outid = rs.getString(1);
                            outname = rs.getString(3);	
		outphone = rs.getString(4);	
		outaddress= rs.getString(5);		
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
<link rel="stylesheet" href="css/maincss.css">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>회원정보</title>
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
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class ="icon-bar"></span>
			<span class ="icon-bar"></span>
			<span class ="icon-bar"></span>
			</button>
			<a class="navbar-brand" href ="selllist.jsp">마이 페이지</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	<ul class="nav navbar-nav">
		<li><a href = "selllist.jsp"> 내가 올린 상품</a></li>
		<li><a href="member.jsp"> 내 정보 </a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li class ="dropdown">
		<a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expanded="false">회원정보<span class="caret"></span></a>
			<ul class="dropdown-menu">
			<li class="active"><a href="update_member.jsp">회원정보수정</a></li>
			<li><a href="member_delete.jsp">회원탈퇴</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>
		<div class="container">
			<div class="jumbotron">
				<h1 class="text-center">회원 정보</h1>
			</div>
		</div>
<br>
<div class="container">
	<div class="row">
	<center>
		<div class="col-md-3">
			<h2><b>아이디</b></h2>
			<hr>
			<h3><%=outid %></h3>
		</div>
		<div class="col-md-3">
			<h2><b>이름</b></h2>
			<hr>
			<h3> <%=outname %></h3>
		</div>
		<div class="col-md-3">
			<h2><b>연락처</b></h2>
			<hr>
			<h3><%=outphone %></h3>
			</div>
		<div class="col-md-3">
			<h2><b>주소</b></h2>
			<hr>
			<h4><%=outaddress %></h4>
		</div>
	</center>
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