<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<HTML>
<BODY>
<Font size=4>
<P>删除记录：
<FORM action="delete.jsp" method=post>
输入被删除记录的学号：
<Input type="text" name="number">
<BR>
<BR><Input type="submit" name="b" value="提交删除">
</FORM>
<P>数据库删除前的数据记录是：
 <% String name,number;
    int math,physics,english;
    Connection con;
    Statement sql; 
    ResultSet rs;
    try{Class.forName("com.mysql.jdbc.Driver");
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
