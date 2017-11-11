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
	<form action="Login1.jsp" method="POST">
		Login Name: 
		<input type="text" name="Name" /><br /> 
		Login No: 
		<input type="password" name="Password" /><br /> 
		<input type="submit" value="Send" /><br />
	</form>

	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("Name");
		String no = request.getParameter("Password");
		if (name != null && no != null) {
			Connection con;
			Statement sql;
			ResultSet rs;
			
			try {
				//2.连接数据库
				Conn conn = new Conn();
				con = conn.getCon();
				//3.1创建Statement对象
				sql = con.createStatement();
				//3.2执行SQL语句 
				rs = sql.executeQuery("SELECT * FROM student WHERE no="+no+" and name='"+name+"'");
				if (rs.next()) {
					Student stu = new Student();
					stu.setName(name);
					stu.setNo(Integer.parseInt(no));
					con.close();
					session.setAttribute("user", stu);
					response.sendRedirect("Member1.jsp");
					
				}
				else{
					con.close();
					out.println("登录失败，请输入正确名称");
				}					
			}catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	%>

</body>
</html>