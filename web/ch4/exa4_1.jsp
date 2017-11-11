<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<HTML>
	<BODY>
		<%
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
				rs = sql.executeQuery("SELECT * FROM student");
				//4 处理结果
		
				out.print("<Table Border>");
				out.print("<TR>");
				out.print("<TH width=100>" + "学号");
				out.print("<TH width=100>" + "姓名");
				out.print("<TH width=100>" + "数据结构");	
				out.print("<TH width=100>" + "操作系统");
				out.print("<TH width=100>" + "微机原理");
				out.print("</TR>");

				while (rs.next()) {
					out.print("<TR>");
					out.print("<TD >" + rs.getString(1) + "</TD>");
					out.print("<TD >" + rs.getString(2) + "</TD>");
					out.print("<TD >" + rs.getInt("sjjg") + "</TD>");					
					out.print("<TD >" + rs.getInt("czxt") + "</TD>");
					out.print("<TD >" + rs.getInt("wjyl") + "</TD>");
					out.print("</TR>");
				}
				
				
				out.print("</Table>");
				String strSQL = "show variables like 'character%'";
				System.out.println(strSQL);
				rs = sql.executeQuery(strSQL);
				System.out.println("-----------debug-------------");
				while(rs.next()){
					System.out.println(rs.getString(1)+":"+rs.getString(2));			
				}
				System.out.println("-----------debug-------------");
				//5 关闭连接 
				con.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		%>
	</BODY>
</HTML>
