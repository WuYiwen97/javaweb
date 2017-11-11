<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="aaa.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="../servlet/Login" method="POST">
		Login Name: 
		<input type="text" name="Name" /><br /> 
		Login No: 
		<input type="password" name="Password" /><br /> 
		<input type="submit" value="Send" /><br />
	</form>
</body>
</html>