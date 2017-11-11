package ser;

import aaa.Conn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Login")
public class Login extends HttpServlet {
	Connection con;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		Conn conn= new Conn();
		con = conn.getCon();      
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();//
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("Name");
		String pwd = request.getParameter("Password");
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from student where name=? and no=?");
			pstmt.setString(1,name );
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();  
			if (rs.next()) {
				ServletContext thisContext=getServletConfig().getServletContext();
				RequestDispatcher myDispatcher;
				myDispatcher=thisContext.getRequestDispatcher("/ch8-login/Member.jsp");
				myDispatcher.forward(request,response);//forward
			}
			else{
				response.sendRedirect("/JavaWeb/ch8-login/Login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
