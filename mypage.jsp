<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset = "UTF-8">
<meta name = "viewport" content= "width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>마이페이지 메뉴</title>
<style> 

</style>
</head>
<body>
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
		<li><a href="member.jsp"> 내 정보</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li class ="dropdown">
		<a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expanded="false">회원정보<span class="caret"></span></a>
			<ul class="dropdown-menu">
			<li class="active"><a href="update_member.jsp">회원정보수정</a></li>
			<li><a href="memberInput.jsp">회원탈퇴</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>