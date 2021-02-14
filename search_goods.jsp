<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%
   request.setCharacterEncoding("utf-8");
   String masterID = (String)session.getAttribute("MasterLoginID");
   boolean isLogin = false;
   if (masterID != null) {
    isLogin = true; 
   }

   // 페이지 나누기를 위한 기본 변수 설정
   int this_page = 1;
   if(request.getParameter("page") != null) this_page = Integer.parseInt(request.getParameter("page"));
   int contentsbypage = 5;   
   int numofcontents = 0;
   int numofpages = 0;   	 
   
%>
<html>
<head>
<meta charset = "UTF-8">
<meta name = "viewport" content= "width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel="stylesheet" href="css/maincss.css">

<style> 
input[type=text]
{
    width: 100%;
    box-sizing: border-box;
    border: 2px solid #cccccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
}
.a{ font-size: 17px; }
</style>
<title>상품 검색 페이지</title>
</head>
<body>
<center>
<BLINK><H1>
<table width = 650 cellspacing = 0 >
<div id = "logo">
<tr>
<td align = center width = 150 hight = 200>
<FONT face="함초롱바탕" size 50 color="#0000ff">
<img src="logo/bookowl_logo.png" width="150" height="75"> <!--로고 출력-->
</FONT></H1>
</BLINK>
</center>
</td>
</tr>
<tr>
<center>  
<div id="search">
      <form name ="search" method = "get" action ="search_goods.jsp"> <!--get방식(url붙이는)으로 리스트(키워드대로)를 출력-->
<td align = center width = 150 hight = 50>
        <input type="text" name="keyword" width = 100 hight = 100 size = 100 placeholder="구매할 책을 검색하세요!" autocomplete="off">    
        <div class="searchbutton">
</td>
        </div>
      </form>
    </div>
</center>
</tr>
</table>

<dive class = "a">
<%
  String searching_goodname = null;
  if(request.getParameter("keyword") != ""){ //검색창에서 키워드 받기
        searching_goodname = request.getParameter("keyword");
  }
  out.println("<br>"); 
%>
</dive>

<table class ="table" border=1>
<thead>
  <tr>
  <td>상태</td>
  <td>상품 이미지</td>
  <td>상품 ID</td>
  <td>상품명</td>
  <td>가격</td>
  <td>학교</td>
  <td>판매자</td>
  </tr>
</thead>
<tbody>
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
    
	 sql = "select count(*) from goods where ";
	 if(searching_goodname != null){
		sql = sql + "good_name like ?"; //키워드로 이름 검색
	 }

         pstmt = conn.prepareStatement(sql);

         if(searching_goodname != null) pstmt.setString(1, "%" + searching_goodname + "%");
         rs = pstmt.executeQuery();
         
         if(rs.next()){ 
		numofcontents = rs.getInt(1);
		numofpages = ( numofcontents - 1 ) / contentsbypage + 1; 
	 }

         if(this_page > numofpages || this_page <= 0) this_page = 1;
	 minimum = this_page * contentsbypage - 4;
 	 maximum = this_page * contentsbypage;
	 int countofcontents = 0;

         sql = "select * from goods where ";
	 if(searching_goodname != null){
		sql = sql + "good_name like ?";
	 }

         pstmt = conn.prepareStatement(sql);
         

         if(searching_goodname != null) pstmt.setString(1, "%" + searching_goodname + "%");
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
  out.print("<img width = '100' height = '100' src=./images/" + outImage + ">");
%>
</td>
  <td><a href="view_good.jsp?goodID=<%=outID %>"><%=outID %></td>
  <td><%=outName %></td>
  <td><%=outPrice %></td>
  <td><%=outSchool %></td>  
  <td><%=outuserID  %></td>  
  
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
<div class= "a">
<p>

<a href="search_goods.jsp?page=1&goodname=<%=request.getParameter("goodname") %>&minprice=<%=request.getParameter("minprice") %>&maxprice=<%=request.getParameter("maxprice") %>">◀◀</a>&nbsp;
<% if(this_page <= 1){ %> ◀&nbsp; 
<% } else { %>  
     <a href="search_goods.jsp?page=<%=this_page-1 %>&goodname=<%=request.getParameter("goodname") %>&minprice=<%=request.getParameter("minprice") %>&maxprice=<%=request.getParameter("maxprice") %>">◀</a>&nbsp;
<% } %>

<% for(int i=1; i<=numofpages ; i++){ %>
<% if(this_page == i){ %> <%=i %> &nbsp; 
<% } else { %>  
     <a href="search_goods.jsp?page=<%=i %>&&goodname=<%=request.getParameter("goodname") %>&minprice=<%=request.getParameter("minprice") %>&maxprice=<%=request.getParameter("maxprice") %>"><%=i %></a>&nbsp;
<% } %>
<% } %>

<% if(this_page >= numofpages){ %> ▶ &nbsp;
<% } else { %>  
     <a href="search_goods.jsp?page=<%=this_page+1 %>&goodname=<%=request.getParameter("goodname") %>&minprice=<%=request.getParameter("minprice") %>&maxprice=<%=request.getParameter("maxprice") %>">▶</a>&nbsp;
<% } %>
<a href="search_goods.jsp?page=<%=numofpages %>&goodname=<%=request.getParameter("goodname") %>&minprice=<%=request.getParameter("minprice") %>&maxprice=<%=request.getParameter("maxprice") %>">▶▶</a>
</p>
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