<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>
<%@page import="com.sun.mail.iap.CommandFailedException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*,Dao.JdbcProject" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    request.setCharacterEncoding("utf-8");
    String username=request.getParameter("username");
    String password=request.getParameter("passw");
    
     String sql = "insert into user(username,password)"+"values("+"'"+username+"'"+","+password+")";
    JdbcProject jdbc = new JdbcProject();
    Connection conn=jdbc.connect();
    try{
     boolean flag=jdbc.insert(sql, conn);
     response.sendRedirect("index.html");
     }catch(MySQLIntegrityConstraintViolationException e){
     e.printStackTrace();
    
     };
   
     %>
     
  </body>
</html>
