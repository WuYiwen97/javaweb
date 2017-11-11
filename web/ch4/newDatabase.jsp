<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<HTML>
<BODY bgcolor=pink ><Font size=4>
  <% //获取提交的学号：
    String number=request.getParameter("number");
          if(number==null)
            {
        	  number="";
            }
     byte b[]=number.getBytes("ISO-8859-1");
     number=new String(b);
    //获取提交的姓名：
    String name=request.getParameter("name");
          if(name==null)
            {name="";
            }
     byte a[]=name.getBytes("ISO-8859-1");
     name=new String(a);
    
    String c=request.getParameter("czxt");
          if(c==null||c.equals(""))
            {c="-100"; }
 
    String w=request.getParameter("wjyl");
          if(w==null)
            {w="-100"; }
	

     String s=request.getParameter("sjjg");
          if(s==null)
            {s="-100"; } 
	
    Connection con=null;
    Statement sql=null;
    ResultSet rs=null;
       try{Class.forName("com.mysql.jdbc.Driver"); }
       catch(ClassNotFoundException event){}
   try {con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
       sql=con.createStatement();
       String condition=
       "INSERT INTO student VALUES"+"("+number+",'"+name+"',"+c+","+w+","+s+")";
		out.print(condition);
       int i = sql.executeUpdate(condition); //执行添加操作：
       //显示添加新记录后表中的记录：
     %>
     <P>添加新记录后的表：</P>
     <%
       rs=sql.executeQuery("SELECT * FROM student ORDER BY no ");
       out.print("<Table Border>");
            out.print("<TR>");
            out.print("<TH width=100>"+"学号");
            out.print("<TH width=100>"+"姓名");
            out.print("<TH width=50>"+"操作系统");
            out.print("<TH width=50>"+"微机原理");
            out.print("<TH width=50>"+"数据结构");
            out.print("</TR>");
       while(rs.next())
           {    out.print("<TR>");
                String n=rs.getString(1);
                 out.print("<TD >"+n+"</TD>"); 
                String xingming=rs.getString(2);
                 out.print("<TD >"+xingming+"</TD>");
                int  math=rs.getInt("czxt"); 
                 out.print("<TD >"+math+"</TD>"); 
                int english=rs.getInt("wjyl"); 
                 out.print("<TD >"+english+"</TD>");
                int physics=rs.getInt("sjjg"); 
                 out.print("<TD >"+physics+"</TD>"); 
            out.print("</TR>") ;  
         }
       out.print("</Table>");
      con.close();
     }
    catch(SQLException event)
     { }
 %>
</FONT>
</BODY>
</HTML>
