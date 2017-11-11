//Night.java：
package ser;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Night extends HttpServlet
{  
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config) throws ServletException
	{super.init(config);
	}
	public  void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException
	{  //获得一个向客户发送数据的输出流：
		response.setContentType("text/html;charset=UTF-8");//设置响应的MIME类型。
		PrintWriter out=response.getWriter();
		out.println("<HTML>"); 
		out.println("<BODY>");
		out.println("<H1> 时间太晚了，该休息了！");
		out.println("</BODY>");
		out.println("</HTML>");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException
	{ 
		doPost(request,response);
	}
}