<%--
  Created by IntelliJ IDEA.
  User: EVE
  Date: 08/06/2017
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<%
  String driver = "com.mysql.jdbc.Driver";
  String url = "jdbc:mysql://localhost:3306/jsp_data?useUnicode=true&characterEncoding=utf-8&useSSL=true";//URL指向访问的数据库名，jsp_data
  String user = "root";//Mysql配置时的用户名
  String password = "123456";//密码
  try {
    Class.forName(driver);//加载驱动程序
    Connection conn = DriverManager.getConnection(url,user,password);//链接数据库
    Statement ststment = conn.createStatement();//用来执行sql语言
    String sql = "SELECT * FROM user";
    ResultSet rs = ststment.executeQuery(sql);
    String name;
    String email;
    while(rs.next()){
      name = rs.getString("name");
      email = rs.getString("email");
      out.println(name+"  "+email);
    }
    rs.close();
    conn.close();
  }catch(ClassNotFoundException e){
    System.out.println("No Drive!");
    e.printStackTrace();
  }catch (SQLException e){
    e.printStackTrace();
  }catch(Exception e){
    e.printStackTrace();
  }
%>
</body>
</html>