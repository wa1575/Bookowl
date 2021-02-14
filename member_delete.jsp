<%@ page contentType="text/html;charset=utf-8" %>
<%
  String masterID = (String)session.getAttribute("MasterLoginID");
  boolean isLogin = false;
  if (masterID != null) {
    isLogin = true; 
  }

  if(!isLogin){
%>
	<script>
		alert("로그인해야 상품 등록이 가능합니다.");
		location.href("login.jsp");
	</script>	
<%
  } else {
%>
<html>
<head>
<script>

function cf_check(){

flag = confirm('진짜로 삭제하시겠습니까? 데이터베이스에서 지워집니다.')
if(flag)  return true;

else { 
   var ele = document.getElementsByName("rec_email");
   for(var i=0;i<ele.length;i++)
      ele[i].checked = false;
   
    ele[ele.length-1].checked= "checked";

    return;  }
   }

</script>


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
  <title>회원 탈퇴</title>
</head>	
<body bgcolor = "#EEEEEE">
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
				<h1 class="text-center">회원 탈퇴</h1>
			</div>
		</div>

<form action="delete_member_process.jsp" enctype="multipart/form-data" method="post">
<div class="container">
<table class = "table table-bordered text- center" >

  <tr><td bgcolor= "#d2d2d2" align = "center"><b>회원 ID</b></td><td><input type="text" name="userID" value="<%=masterID%>"></td></tr>
  <tr><td  align = "center" colspan = "2" ><h4><b>약 관</b></h4></td></tr>
  <tr><td  align = "center"colspan = "2" >북엉은 회원 탈퇴 시 아래의 내용을 안내하고 있으며
<br>그에 대한 동의를 진행하고 있습니다.<br>
<font color = "red"> "탈퇴 후에는 아디이와 데이터는 복구할 수 없습니다."</font></td>
</tr> 

<tr align ="center">
<td bgcolor="#d2d2d2" align=center width=150>동의하십니까?</td>
<td align=left width=500>&nbsp;&nbsp;&nbsp;
<INPUT TYPE="radio" onclick="cf_check()" NAME="rec_email" value="yes" > 예 
<INPUT TYPE="radio" NAME="rec_email" value="no" checked> 아니오

</td>
</tr> 
  </td></tr>
 
  <tr><td align="center" colspan = 2><input type="submit" class="btn btn-primary form-control" value="회원 탈퇴하기"></td></tr>
  </table>
</div>
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