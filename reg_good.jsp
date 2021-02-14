<%@ page contentType="text/html;charset=utf-8" %>
<%@page import="java.io.PrintWriter" %>
<%
  String masterID = (String)session.getAttribute("MasterLoginID");
  boolean isLogin = false;
  if (masterID != null) {
    isLogin = true; 
  }

  if(!isLogin){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인해야 상품 등록이 가능합니다.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");

  } else {
%>
<html>
<head>
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/maincss.css">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<style type="text/css">
			.jumbotron{
				background-image: url('logo/book.jpg');
				background-image: cover;
				text-shadow: black 0.2em 0.2em 0.2em;
				color: white;
		}
		</style>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>상품 등록</title>
</head>	

<body>
<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">상품 등록 페이지</h1>
			
		</div>
	</div>
<hr>

<form action="reg_process.jsp" enctype="multipart/form-data" method="post">
<div class="container">
<table class = "table table-bordered text- center" >
  <tr><td bgcolor= "#d2d2d2"  align = "center"><b>상품 상태</b></td><td>
    <input type="radio" name="goodStatus" value="판매중" checked>판매중 &nbsp; 
    <input type="radio" name="goodStatus" value="거래중">거래중&nbsp;
    <input type="radio" name="goodStatus" value="거래완료">거래완료</td></tr>
  <tr><td bgcolor= "#d2d2d2" align = "center"><b>상품 이미지</b></td><td><input type="file" name="goodImage"></td></tr>
  <tr><td bgcolor= "#d2d2d2"  align = "center"><b>상품 ID</b></td><td><input type="text" name="goodID"></td></tr> 
  <tr><td bgcolor= "#d2d2d2"  align = "center"><b>상품 이름</b></td><td><input type="text" name="goodName"></td></tr>
  <tr><td bgcolor= "#d2d2d2"  align = "center"><b>상품 가격</b></td><td><input type="text" name="goodPrice"></td></tr>
  <tr><td bgcolor= "#d2d2d2"  align = "center"><b>학교</b></td><td><input type="text" name="goodSchool"></td></tr>
  <tr><td bgcolor= "#d2d2d2"  align = "center"><b>판매자 ID</b></td><td><input type="text" name="userID" value="<%=masterID%>"></td></tr> 
  </td></tr>
</div>
 
  <tr><td align="center" colspan = 2><input type="submit" class="btn btn-primary form-control" value="등록하기"></td></tr>
  </table>
</form> 
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

<% } %>