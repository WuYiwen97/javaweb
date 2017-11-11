package ser;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Helloworld extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException
	{ 
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out=res.getWriter();
		out.println("<html>");
		out.println("<head><title>helloworld!</title></head>");
		out.println("<body>");
		out.println("<p>这是我的第一个HTTP Servlet,你好！</p>");
		out.println("</body></html>"); 
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException
	{ 
		doGet(req,res);
	}
} 