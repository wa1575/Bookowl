<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/maincss.css">

<title>회원가입</title>
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
			<a class="navbar-brand" href ="memberInput.jsp">회원가입 페이지</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	<ul class="nav navbar-nav">
		<li><a href = "main.jsp"> 메인</a></li>

	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li class ="dropdown">
		<a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expanded="false">접속하기<span class="caret"></span></a>
			<ul class="dropdown-menu">
			<li class="active"><a href="login.jsp">로그인</a></li>
			<li><a href="memberInput.jsp">회원가입</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>
<div class="container">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div class="jumbotron" style="padding-top: 20px";>
			<form method="post" action="memberProc.jsp">
				<h3 style = "text-align: center;">회원가입</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20"></div>
				<div class="form-group">	
					<input type ="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="20"></div>
				<div class="form-group">	
					<input type="text" class="form-control" placeholder="이름" name="name" maxlength="20"></div>
		<div class="form-group">											
			<input type ="text" class="form-control" placeholder="휴대폰 번호를 입력하세요. ex)000-0000-0000" name="phone" maxlength="20"><br>
		</div>
		 
		 		<div class="form-group">
					<div class="form-row">
						<div class="form-group col-md-6">	
							<input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호" name="sample6_postcode"></div>
						<div class="form-group col-md-3">
							<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></div></div>
					
					<div class="form-group col-md-7">		
					<input type="text" id="sample6_address" class="form-control" placeholder="주소" name="sample6_address"></div>
					
					<div class="form-row">
						<div class="form-group col-md-6">
							<input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소" name="sample6_detailAddress"></div>
						<div class="form-group col-md-6">
							<input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목" name="sample6_extraAddress"></div>
					</div>
				</div>
				
				
				<input type="submit" class="btn btn-primary form-control" value="회원가입">
			
			</form>
			
		</div>
	</div>
</div> 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script> 

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