<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<HTML>
<BODY>
 <%! //����һ����������Ӷ���
    Connection con=null;
  %>
 <% Statement sql=null; 
    ResultSet rs=null; 
    //��һ���ͻ����������Ӷ���
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
     //�����ͻ�ͨ��ͬ����ʹ��������ӣ�
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
            out.print("<TH width=100>"+"ѧ��");
            out.print("<TH width=100>"+"����");
            out.print("<TH width=50>"+"����ϵͳ");
            out.print("<TH width=50>"+"΢��ԭ��");
            out.print("<TH width=50>"+"���ݽṹ");
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
