package ser;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Count extends HttpServlet{
	public void init(ServletConfig config) throws ServletException
	{super.init(config);
	}
	public void service(HttpServletRequest req,HttpServletResponse response) 
			throws IOException
	{ 
		req.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//获得一个向客户发送数据的输出流：
		PrintWriter out=response.getWriter();
		//设置响应的MIME类型
		
		out.println("<HTML> <BODY>");
		//获取客户提交的信息
		String number=req.getParameter("number");     
		out.print("<BR>"+"hello你好"+number);
		out.println("</body> </html>");
	} 
}