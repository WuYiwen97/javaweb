<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<HTML>
	<BODY>
		<Font size=4>
			<FORM action="newResult.jsp" method=post>
				输入要修改成绩的同学的姓名：
				<BR>
				<Input type="text" name="name">
				<BR>
				输入新的操作系统成绩：
				<Input type="text" name="czxt">
				<BR>
				输入新的微机原理成绩：
				<Input type="text" name="wjyl">
				<BR>
				输入新的数据结构成绩：
				<Input type="text" name="sjjg">
				<BR>
				<Input type="submit" name="b" value="提交更新">
				<P>
					数据库更新前的数据记录是：
					<%
					String name, number;
					int czxt, wjyl, sjjg;
					Connection con;
					Statement sql;
					ResultSet rs;
					try {
						Class.forName("com.mysql.jdbc.Driver");
					} catch (ClassNotFoundException e) {
						out.print("数据库驱动出问题：" + e);
					}
					try {
						con = DriverManager
								.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
						sql = con.createStatement();
						rs = sql.executeQuery("SELECT * FROM student");
						out.print("<Table Border>");
						out.print("<TR>");
						out.print("<TH width=100>" + "学号");
						out.print("<TH width=100>" + "姓名");
						out.print("<TH width=50>" + "操作系统");
						out.print("<TH width=50>" + "微机原理");
						out.print("<TH width=50>" + "数据结构");
						out.print("</TR>");
						while (rs.next()) {
							out.print("<TR>");
							number = rs.getString(1);
							out.print("<TD >" + number + "</TD>");
							name = rs.getString(2);
							out.print("<TD >" + name + "</TD>");
							czxt = rs.getInt("czxt");
							out.print("<TD >" + czxt + "</TD>");
							wjyl = rs.getInt("wjyl");
							out.print("<TD >" + wjyl + "</TD>");
							sjjg = rs.getInt("sjjg");
							out.print("<TD >" + sjjg + "</TD>");
							out.print("</TR>");
						}
						out.print("</Table>");
						con.close();
					} catch (SQLException e1) {
						out.print("数据库操作出错！" + e1);
					}
				%>
				
		</Font>
	</BODY>
</HTML>
