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
		alert("로그인해야 정보수정이 가능합니다.");
		location.href("login.jsp");
	</script>	
<%
  } else {
   
   String outid = masterID, outpw = null;
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
                           outpw = rs.getString(2);
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
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/maincss.css">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>회원정보 수정</title>
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
			<h1 class="text-center">회원정보 수정</h1>
			
		</div>
	</div>

<form action="update_memberprocess.jsp" enctype="multipart/form-data" method="get">
<div class="container">
<table class = "table table-bordered text- center" >
  <tr><td bgcolor= "#d2d2d2" align = "center"><b>아이디</b></td><td><%=outid %></td><input type="hidden" name="memberID" value="<%=outid %>"></tr>
  <tr><td bgcolor= "#d2d2d2" align = "center"><b>비밀번호</b></td><td><input type="text" name="memberPW" value="<%=outpw %>"></td></tr>
  <tr><td bgcolor= "#d2d2d2" align = "center"><b>이름</b></td><td><input type="text" name="memberName" value="<%=outname %>"></td></tr> 
  <tr><td bgcolor= "#d2d2d2" align = "center"><b>연락처</b></td><td><input type="text" name="memberPhone" value=<%=outphone %>></td></tr>
  <tr><td bgcolor= "#d2d2d2" align = "center"><b>주소</b></td><td><input type="text" name="memberAddress" value="<%=outaddress %>"></td></tr>
    
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