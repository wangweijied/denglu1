<%@ page language="java" import="java.util.*,Dao.JdbcProject,java.sql.ResultSet,java.sql.Connection" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
    String username=request.getParameter("用户名");
    String password=request.getParameter("密码");
    String sql1= "select * from user where username = "+"'"+username+"'"+" and password = "+"'"+password+"'"+" ";
    JdbcProject jdbc = new JdbcProject();
    Connection conn=jdbc.connect();
    ResultSet rs=jdbc.select(sql1,conn);
    while(rs.next()){
    String username1=rs.getString("username");
    String password1=rs.getString("password");
   
   
    if(username.equals(username1)&&password.equals(password1)){
    	response.sendRedirect("show.html");
    }
    else{
    	response.sendRedirect("index.html");
    } 
    }
   
     %>
     <div>
     
    
     </div>
  </body>
</html>
