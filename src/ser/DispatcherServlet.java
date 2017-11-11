package ser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class DispatcherServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException{
		super.init(config);				
	}

	public void doGet(HttpServletRequest req,HttpServletResponse resp)
			throws IOException,ServletException{
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out=resp.getWriter();	//
		
		//JSP的隐含对象application是实现ServletContext接口类的对象
		ServletContext thisContext=getServletConfig().getServletContext();
		
		String myname= null;
	//	myname = "zhangsan";
		System.out.println("ffff:"+myname);
		
		RequestDispatcher myDispatcher;
		if(myname!=null){
			myDispatcher=thisContext.getRequestDispatcher("/servlet/Night");
			myDispatcher.forward(req,resp);//forward
		}
		else{ 
			out.println("<html><head><title>DispatchServlet</title></head><body>");
			out.println("<form>");
			out.println("<br>Hello,Dispatcher include");
			out.println("</form>");
			myDispatcher=thisContext.getRequestDispatcher("/servlet/day");
			myDispatcher.include(req,resp);//include
		}		
	}	
}