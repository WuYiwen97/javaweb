package aaa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conn {
	private	Connection con=null;
	public Conn() {
		try {
			//1.使用MySql的JDBC驱动程序 
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			//2.连接数据库
			con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/pubs?user=root&password=123");
		}catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
	public Connection getCon(){
		return con;
	}
}
