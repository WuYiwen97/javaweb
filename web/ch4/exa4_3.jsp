<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<HTML>
	<BODY>
		<%
			String name, number;
			int math, physics, english;
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
				sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
						ResultSet.CONCUR_READ_ONLY);
				//返回可滚动的结果集：
				rs = sql.executeQuery("SELECT * FROM student");
				//将游标移动到最后一行：
				rs.last();
				//获取最后一行的行号：
				int lownumber = rs.getRow();
				out.print("该表共有" + lownumber + "条记录");
				out.print("<BR>现在逆序输出记录：");
				out.print("<Table Border>");
				out.print("<TR>");
				out.print("<TH width=100>" + "学号");
				out.print("<TH width=100>" + "姓名");
				out.print("<TH width=50>" + "操作系统");
				out.print("<TH width=50>" + "微机原理");
				out.print("<TH width=50>" + "数据结构");
				out.print("</TR>");
				//为了逆序输出记录，需将游标移动到最后一行之后：
				rs.afterLast();
				while (rs.previous()) {
					out.print("<TR>");
					number = rs.getString(1);
					out.print("<TD >" + number + "</TD>");
					name = rs.getString(2);
					out.print("<TD >" + name + "</TD>");
					math = rs.getInt("czxt");
					out.print("<TD >" + math + "</TD>");
					english = rs.getInt("wjyl");
					out.print("<TD >" + english + "</TD>");
					physics = rs.getInt("sjjg");
					out.print("<TD >" + physics + "</TD>");
					out.print("</TR>");
				}
				out.print("</Table>");
				out.print("单独输出第5条记录<BR>");
				rs.absolute(2);
				number = rs.getString(1);
				out.print(number + ",");
				name = rs.getString(2);
				out.print(name + ",");
				math = rs.getInt("czxt");
				out.print(math + ",");
				english = rs.getInt("wjyl");
				out.print(english + ",");
				physics = rs.getInt("sjjg");
				out.print(physics + "。");
				con.close();
			} catch (SQLException e1) {
			}
		%>
	</BODY>
</HTML>
