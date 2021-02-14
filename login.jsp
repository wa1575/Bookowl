<%@ page contentType="text/html;charset=utf-8" %>

<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
<!-- This is a very simple parallax effect achieved by simple CSS 3 multiple backgrounds, made by http://twitter.com/msurguy -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/maincss.css">
</head>

<body>
<br><br><br><br><br>
<form action="loginProcess.jsp" method="post">
<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-5 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h2 class="panel-title"><b>지금 북엉을 시작하세요!</b></h2>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="아이디 입력" name="id" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="비밀번호 입력" name="pw" type="password" value="">
			    		</div>
			    					    	   
			    		<input class="btn btn-primary form-control" type="submit" value= "로그인">

			    	    <br><br>북엉이 처음이신가요?<a href ="memberInput.jsp">&nbsp;<b>회원가입</b></a>
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>

<footer>
			<div class="container">
				<br>
				<div class="row" style="text-align:center;">
					<div class="col-sm-3" ><img src="logo/home_logo.png" width="30" height="30"><a href="main.jsp"><h5>홈</h5></a></div>
					<div class="col-sm-3" ><img src="logo/sell_logo.png" width="30" height="30"><a href="reg_good.jsp"><h5>판매하기</h5></a></div>
					<div class="col-sm-3" ><img src="logo/person_logo.png" width="30" height="30"><a href="memberInput.jsp"><h5>회원가입</h5></a></div>
					<div class="col-sm-3" ><img src="logo/login_logo.png" width="30" height="30"><a href="login.jsp"><h5>로그인</h5></a></div>
				</div>
			</div>
			
		</footer>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
	