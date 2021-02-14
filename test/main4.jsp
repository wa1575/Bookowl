<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head><title>bookowl search</title>
<style><!--서치폼 스타일-->
input[type=text]
{
    width: 100%;
    box-sizing: border-box;
    border: 2px solid #cccccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 100px 100px
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
}
</style>



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

<center>  
<div id="search">
      <form name ="search" method = "get" action ="list.jsp"> <!--get방식(url붙이는)으로 리스트(키워드대로)를 출력-->
<td align = center width = 100 hight = 50>
        <input type="text" name="keyword" width = 100 hight = 100 size = 100 placeholder="구매할 책을 검색하세요!" autocomplete="off">    
        <div class="searchbutton">
</td>
        </div>
      </form>
    </div>
</center>

</body>
</html>