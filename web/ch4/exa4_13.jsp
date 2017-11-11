<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<HTML>
<BODY>
 <%! //声明一个共享的连接对象：
    Connection con=null;
  %>
 <% Statement sql=null; 
    ResultSet rs=null; 
    //第一个客户负责建立连接对象：
    if(con==null)
      { try{Class.forName("com.mysql.jdbc.Driver");
           }
           catch(ClassNotFoundException e)
           {out.print(e);
           }
        try {
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
           sql=con.createStatement();
           rs =sql.executeQuery("SELECT * FROM student");
           out.print("i am  first");
          }
        catch(SQLException e) 
          {out.print(e);
          }
      }
     //其它客户通过同步块使用这个连接：
     else
      { synchronized(con)
        {  try { sql=con.createStatement();
               rs =sql.executeQuery("SELECT * FROM student");
               out.print("i am not first");
               }
          catch(SQLException e) 
               {out.print(e);
               }
        }
      }
    try
      {  out.print("<Table Border>");
         out.print("<TR>");
            out.print("<TH width=100>"+"学号");
            out.print("<TH width=100>"+"姓名");
            out.print("<TH width=50>"+"操作系统");
            out.print("<TH width=50>"+"微机原理");
            out.print("<TH width=50>"+"数据结构");
         out.print("</TR>");
       while(rs.next())
       { out.print("<TR>");
           String  number=rs.getString(1); 
             out.print("<TD >"+number+"</TD>"); 
           String  name=rs.getString(2); 
             out.print("<TD >"+name+"</TD>");
           int  math=rs.getInt(3); 
             out.print("<TD >"+math+"</TD>"); 
           int  english=rs.getInt(4); 
             out.print("<TD >"+english+"</TD>");
           int  physics=rs.getInt(5); 
             out.print("<TD >"+physics+"</TD>");   
        out.print("</TR>") ;          
        }
      out.print("</Table>");
    }
   catch(SQLException e1) {
	   e1.printStackTrace();
   }
 %>
</BODY>
</HTML>
