<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%
   request.setCharacterEncoding("utf-8");
   String masterID = (String)session.getAttribute("MasterLoginID");
   boolean isLogin = false;
   if (masterID != null) {
    isLogin = true; 
   }

  if(!isLogin){
%>
	<script>
		alert("로그인해야 판매목록을 볼 수 있습니다.");
		location.href("login.jsp");
	</script>	
<%
  } else {

   // 페이지 나누기를 위한 기본 변수 설정
   int this_page = 1;
   if(request.getParameter("page") != null) this_page = Integer.parseInt(request.getParameter("page"));
   int contentsbypage = 5;   
   int numofcontents = 0;
   int numofpages = 0;   	 
   
   // 카테고리 나누기를 위한 기본 변수 설정(카테고리 0는 전체, 1은 판매중, 2는 거래중, 3은 판매완료
   int this_category = 0;
   if(request.getParameter("category") != null) this_category = Integer.parseInt(request.getParameter("category"));
%>
<html>
<head>
<meta charset = "UTF-8">
<meta name = "viewport" content= "width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel="stylesheet" href="css/maincss.css">
<title>판매목록</title>
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



<h2>내가 올린 상품</h2>
<%
    if(isLogin){
%>  
<hr/>	
<%
  } else {
%>
<a href="login.html">관리자 로그인</a><p>
<%
  }
%>
<p> 카테고리 : &nbsp;&nbsp;&nbsp; <!--아예 빼버리거나 수정이 필요-->
<a href="selllist.jsp">전체</a>&nbsp;&nbsp;&nbsp;
<a href="selllist.jsp?category=1">판매중</a>&nbsp;&nbsp;&nbsp;
<a href="selllist.jsp?category=2">거래중</a>&nbsp;&nbsp;&nbsp;
<a href="selllist.jsp?category=3">판매완료</a>&nbsp;&nbsp;&nbsp;


</p>

<table class ="table">
<thead>
  <tr>
  <td>상태</td>
  <td>상품 이미지</td>
  <td>상품 ID</td>
  <td>상품명</td>
  <td>가격</td>
  <td>학교</td>
  <td>판매자</td>
<%
    if(isLogin){
%>  
  <td>수정</td>	
  <td>삭제</td>
<%
  }
%>
  </tr>
</thead>
<tbody>
<div class="container">
<%
   String outID, outName, outStatus, outSchool, outImage, outuserID;
   int outPrice;

   String sql = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   int minimum = 0, maximum = 0;
 
   Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url,"test1","1234");
         

         switch(this_category){
	 case 1 : sql = "select count(*) from goods where id='"+masterID+"' AND good_status = '판매중' "; break;
	 case 2 : sql = "select count(*) from goods where id='"+masterID+"' AND good_status = '거래중' "; break;
	 case 3 : sql = "select count(*) from goods where id='"+masterID+"' AND good_status = '판매완료' "; break;
	 default : sql = "select count(*) from goods where id='"+masterID+"'"; break;
         }
   
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         if(rs.next()){ 
		numofcontents = rs.getInt(1);
		numofpages = ( numofcontents - 1 ) / contentsbypage + 1; 
	 }

         if(this_page > numofpages || this_page <= 0) this_page = 1;
	 minimum = this_page * contentsbypage - 4;
 	 maximum = this_page * contentsbypage;
	 int countofcontents = 0;
	
         switch(this_category){
	 case 1 : sql = "select * from goods where id='"+masterID+"' AND good_status = '판매중'"; break;
	 case 2 : sql = "select * from goods where id='"+masterID+"' AND good_status = '거래중' "; break;
	 case 3 : sql = "select * from goods where id='"+masterID+"' AND good_status = '판매완료' "; break;
	 default : sql = "select * from goods where id='"+masterID+"'"; break;
         }
         // sql = "select * from goods where id='"+masterID+"'";  //해당 사용자가 올린 물건만 검색(요거 추가 시 제대로 작동)
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();

         while(rs.next()){
                countofcontents++; 

         	if(countofcontents < minimum || countofcontents > maximum) continue;

		outStatus = rs.getString(1);
                            outImage = rs.getString(2);	
                            outID = rs.getString(3);	
		outName = rs.getString(4);	
		outPrice = rs.getInt(5);		
		outSchool = rs.getString(6);	
		outuserID = rs.getString(7);	
	
%> 
  <tr>
  <td><%=outStatus %></td>
  <td>
<%
  out.print("<img width = '100' height = '100' src=./images/" + outImage + ">"); //이미지 사이즈 고정시키기
%>
</td>
  <td><a href="view_good.jsp?goodID=<%=outID %>"><%=outID %></td>
  <td><%=outName %></td>
  <td><%=outPrice %></td>
  <td><%=outSchool %></td>  
  <td><%=outuserID  %></td>  
<%
  if(isLogin){ //딱히 필요는 없지만 그래도...
%>  
  <td><a href="update_good.jsp?goodID=<%=outID %>">수정</a></td>	
  <td><a href="delete_good.jsp?goodID=<%=outID %>">삭제</a></td>	
<%
  }
%>    
</tr>
<%
  	 }         
         rs.close();
         pstmt.close();
         conn.close();
    } catch(Exception e) {
         e.printStackTrace();
    }

%>
</tbody>
</table>
<center>
<p>

<a href="selllist.jsp?page=1&category=<%=this_category %>">◀◀</a>&nbsp;
<% if(this_page <= 1){ %> ◀&nbsp; 
<% } else { %>  
     <a href="selllist.jsp?page=<%=this_page-1 %>&category=<%=this_category %>">◀</a>&nbsp;
<% } %>

<% for(int i=1; i<=numofpages ; i++){ %>
<% if(this_page == i){ %> <%=i %> &nbsp; 
<% } else { %>  
     <a href="selllist.jsp?page=<%=i %>&category=<%=this_category %>"><%=i %></a>&nbsp;
<% } %>
<% } %>

<% if(this_page >= numofpages){ %> ▶ &nbsp;
<% } else { %>  
     <a href="selllist.jsp?page=<%=this_page+1 %>&category=<%=this_category %>">▶</a>&nbsp;
<% } %>
<a href="selllist.jsp?page=<%=numofpages %>&category=<%=this_category %>">▶▶</a>
<%}%>
</p>
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