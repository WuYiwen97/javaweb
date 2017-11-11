<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<HTML>
<BODY  >
<Font size=4>
<P>添加新的记录到数据库：
<FORM action="newDatabase.jsp" method=post>
同学学号：
<Input type="text" name="number">
<BR>同学姓名：
<Input type="text" name="name">
<BR>操作系统成绩：
<Input type="text" name="czxt">
<BR>微机原理成绩：
<Input type="text" name="wjyl">
<BR>数据结构成绩：
<Input type="text" name="sjjg">
<BR><Input type="submit" name="b" value="提交添加">
<P>数据库添加记录前的数据记录是：
 <% String name,number;
    int math,physics,english;
    Connection con;
    Statement sql; 
    ResultSet rs;
    try{
    	Class.forName("com.mysql.jdbc.Driver");
       }
    catch(ClassNotFoundException e){}
    try { con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
         sql=con.createStatement();
         rs=sql.executeQuery("SELECT * FROM student");
         out.print("<Table Border>");
         out.print("<TR>");
            out.print("<TH width=100>"+"学号");
            out.print("<TH width=100>"+"姓名");
            out.print("<TH width=50>"+"操作系统");
            out.print("<TH width=50>"+"微机原理");
            out.print("<TH width=50>"+"数据结构");
         out.print("</TR>");
       while(rs.next())
       { out.print("<TR>");
             number=rs.getString(1); 
             out.print("<TD >"+number+"</TD>"); 
             name=rs.getString(2); 
             out.print("<TD >"+name+"</TD>");
             math=rs.getInt("czxt"); 
             out.print("<TD >"+math+"</TD>"); 
             english=rs.getInt("wjyl"); 
             out.print("<TD >"+english+"</TD>");
             physics=rs.getInt("sjjg"); 
             out.print("<TD >"+physics+"</TD>");   
        out.print("</TR>") ; 
        }
        out.print("</Table>");
        con.close();
     }
   catch(SQLException e1) {}
 %>
</Font>
</BODY>
</HTML>
