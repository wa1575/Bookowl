<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import ="java.sql.*" %>
    
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521","test1","1234");
Statement stmt = con.createStatement();
String sql = "create table member(id varchar2(10), pw varchar2(10), pw_check varchar2(10), name varchar2(10), mail varchar2(20), phone varchar2(20), address varchar2(30))";
stmt.executeUpdate(sql);
stmt.close();
con.close();
%>