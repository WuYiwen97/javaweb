<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<HTML>
	<BODY>
		<%
			Connection con;
			Statement sql;
			ResultSet rs;
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
			}
			try {
				con = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
				sql = con.createStatement();
				rs = sql
						.executeQuery("SELECT * FROM student WHERE wjyl >= 60 ");
				out.print("<Table Border>");
				out.print("<TR>");
				out.print("<TH width=100>" + "姓名");
				out.print("<TH width=50>" + "微机原理");
				out.print("</TR>");
				while (rs.next()) {
					out.print("<TR>");
					out.print("<TD >" + rs.getString(2) + "</TD>");
					out.print("<TD >" + rs.getInt("wjyl") + "</TD>");
					out.print("</TR>");
				}
				out.print("</Table>");
				con.close();
			} catch (SQLException e1) {
			}
		%>
	</BODY>
</HTML>