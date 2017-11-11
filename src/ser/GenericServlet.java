package ser;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class GenericServlet
 */
@WebServlet("/GenericServlet")
public class GenericServlet extends javax.servlet.GenericServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see javax.servlet.GenericServlet#javax.servlet.GenericServlet()
     */
    public GenericServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#service(ServletRequest request, ServletResponse response)
	 */
  //重载GenericServelet的service方法
    public void service(ServletRequest req, ServletResponse res)throws ServletException, IOException
    {
      doResponse("Hello world", res);
     }
    //重载GenericServlet的getServletInfo方法
    public String getServletInfo()
    {
     return "a simple Hello Servlet.";
    }//返回服务程序描述

    public void doResponse(String str,ServletResponse res) throws ServletException, IOException
    {
      PrintWriter out=res.getWriter();    
      out.println(str);
      out.println("ServeletInfo:");
      out.println(getServletInfo());
      out.close();
    }
}
