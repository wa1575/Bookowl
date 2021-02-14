<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO" %>
<%@page import="java.io.PrintWriter" %>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="member" class="beans.Member" />
<jsp:setProperty property="*" name="member"/>

<%


if(member.getId() ==null || member.getPw()==null || member.getPhone()==null|| member.getName()==null || member.getAddress()==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안된 사항이 있습니다.')");
	script.println("history.back()");
	script.println("</script>");
}else{
	MemberDAO dao = new MemberDAO();
	int result = dao.insertMember(member);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입이 완료되었습니다. 로그인페이지로 이동합니다.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
	}
}


%>