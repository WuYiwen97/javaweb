<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<HTML>
<BODY>
  <% //获取提交的排序方式：
    String name=request.getParameter("R");
          if(name==null)
            {name="";}
     byte b[]=name.getBytes("ISO-8859-1");
     name=new String(b);
 	out.print(name);
	String number,xingming;
	String para="";
	if (name.equals("a"))
		para="name";
	if (name.equals("b"))
		para="no";
	out.print(para);
     Connection con=null;
    Statement sql=null;
    ResultSet rs=null;
    int math,english,physics;
       try{Class.forName("com.mysql.jdbc.Driver");
          }
       catch(ClassNotFoundException e){}
     try { con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
         sql=con.createStatement();
         String condition="SELECT * FROM student ORDER BY "+para;
	
         rs=sql.executeQuery(condition);
         out.print("<Table Border>");
            out.print("<TR>");
            out.print("<TH width=100>"+"学号");
            out.print("<TH width=100>"+"姓名");
            out.print("<TH width=50>"+"操作系统");
            out.print("<TH width=50>"+"微机原理");
            out.print("<TH width=50>"+"数据结构");
            out.print("<TH width=50>"+"总成绩");
            out.print("</TR>");
           while(rs.next())
             { out.print("<TR>");
               number=rs.getString(2); 
               out.print("<TD >"+number+"</TD>"); 
               xingming=rs.getString(3); 
               out.print("<TD >"+xingming+"</TD>");
               math=rs.getInt(4); 
               out.print("<TD >"+math+"</TD>"); 
               english=rs.getInt(5); 
               out.print("<TD >"+english+"</TD>");
               physics=rs.getInt(1); 
               out.print("<TD >"+physics+"</TD>"); 
               int total=math+english+physics;
               out.print("<TH >"+total+"</TH>"); 
               out.print("</TR>") ; 
              }
         out.print("</Table>");
        con.close();
       }
    catch(SQLException e)
       { e.printStackTrace(); }
 %>
</BODY>
</HTML>

