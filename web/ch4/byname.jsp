<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<HTML>
<BODY>
  <% 
  //获取提交的姓名：
    String name=request.getParameter("name");
          if(name==null)
            {name="";
            }
     byte b[]=name.getBytes("ISO-8859-1");
     name=new String(b);
    Connection con=null;
    Statement sql=null;
    ResultSet rs=null;
       try{Class.forName("com.mysql.jdbc.Driver");
          }
       catch(ClassNotFoundException e){}
       try { con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
             sql=con.createStatement();
             String condition=
             "SELECT * FROM student WHERE name = "+"'"+name+"'";
             rs=sql.executeQuery(condition);
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
                     out.print("<TD >"+rs.getString(1)+"</TD>"); 
                     out.print("<TD >"+rs.getString(2)+"</TD>");
                     out.print("<TD >"+rs.getInt(3)+"</TD>"); 
                     out.print("<TD >"+rs.getInt(4)+"</TD>");
                     out.print("<TD >"+rs.getInt(5)+"</TD>");   
                     out.print("</TR>") ;  
                    }
              out.print("</Table>");
              con.close();
           }
    catch(SQLException e)
           {  }
%>
</BODY>
</HTML>
