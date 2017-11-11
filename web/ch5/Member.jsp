<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="aaa.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
	Student stu = (Student)session.getAttribute("user");
	
	if (stu != null) {		
		out.println(stu.getName()+" : 欢迎您的到来!");
		Connection con;
		Statement sql;
		ResultSet rs;
		try {
			//1.使用MySql的JDBC驱动程序 
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			//2.连接数据库
			con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
			//3.1创建Statement对象
			sql = con.createStatement();
			//3.2执行SQL语句 
			String sqlStr="SELECT * FROM student WHERE no="+stu.getNo();
			//out.println(sqlStr);
			rs = sql.executeQuery(sqlStr);
			if (rs.next())
				out.println("数据结构的成绩：" + rs.getInt(3));
		}catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
	else {		
		out.println("请您先登陆，谢谢")	;
		out.println("<br>经过5秒之后，将自动返回Login.jsp");
		response.setHeader("Refresh","5;URL=Login.jsp");	
	}
%>

</body>
</html>