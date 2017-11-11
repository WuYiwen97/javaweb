<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<HTML>
<BODY>
<Font size=1>

  <% 
  	request.setCharacterEncoding("UTF-8");
  	//获取提交的姓名：
    String name=request.getParameter("name");
          if(name==null)
            {name="";
            }
 //    byte b[]=name.getBytes("ISO-8859-1");
 //    name=new String(b);
     
    String newczxt=request.getParameter("czxt");
          if(newczxt==null)
            {newczxt="-100";
            }

    String newwjyl=request.getParameter("wjyl");
          if(newwjyl==null)
            {newwjyl="-100";
            }
   
     String newsjjg=request.getParameter("sjjg");
          if(newsjjg==null)
            {newsjjg="-100";
            } 
    Connection con=null;
    Statement sql=null;
    ResultSet rs=null;
    String number,xingming;
    int math,english,physics;
       try{
    	   Class.forName("com.mysql.jdbc.Driver");
          }
       catch(ClassNotFoundException e){
    	   out.print("mmm"+e);
    	}
       try {
    	   	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
       		sql=con.createStatement();
       		String condition1=
              "UPDATE student SET czxt = "+newczxt+" WHERE name="+"'"+name+"'" ,
              condition2=
              "UPDATE student SET wjyl = "+newwjyl+" WHERE name="+"'"+name+"'" ,
              condition3=
              "UPDATE student SET sjjg= "+newsjjg+" WHERE name="+"'"+name+"'" ;
			//执行更新操作：
	       sql.executeUpdate(condition1);
	       sql.executeUpdate(condition2);
	       sql.executeUpdate(condition3);
	   
     %>
     <P>更新后的表的记录：
     <%
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
           {
             out.print("<TR>");
                 number=rs.getString(1);
                 out.print("<TD >"+number+"</TD>"); 
                 xingming=rs.getString(2);
                 out.print("<TD >"+xingming+"</TD>");
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
    catch(SQLException e)
     {out.print(e) ; }
 %>
</FONT>
</BODY>
</HTML>
