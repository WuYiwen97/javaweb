//实现计数器，初始会面值为10，以后用户每访问一次该Servlet,会面纸浆增一，并和其他信息一起回写客户端
package ser;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CookieCount extends HttpServlet
{
	static final String countname="mycounter";
	static final int defaultinit=10;
	private int initvalue;

	//初始化,给initvalue赋初值。
	public void init(ServletConfig conf) throws ServletException
	{
		String s;
		super.init(conf);
		s=getInitParameter("initial"); //从web.xml中得到初始值
		if(s==null)
			initvalue=defaultinit;
		else{
			try{
				Integer.parseInt(s);
			}catch(NumberFormatException e)
			{  
				initvalue=defaultinit;
				log("wrong"+s);
			}
		}
	}

	//处理客户请求
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int count=initvalue; 
		Cookie Cookies[], c=null;
		boolean hadcookie=false,hadcount=false;

		if((Cookies=req.getCookies())!=null)
		{
			hadcookie=true;
			for(int i=0;i<Cookies.length;i++)
			{//判断名字为countname的Cookie是否存在
				if(Cookies[i].getName().equals(countname))
				{
					try{
						c=(Cookie)Cookies[i].clone();
						count=Integer.parseInt(c.getValue());
						c.setValue(Integer.toString(count+1));
						hadcount=true;
					}catch(NumberFormatException e)
					{
						c=null;
					}
					break;
				}
			}
		}
		//从上面的if语句出来，c可能有值，也可能没值。若没值则创建一新的Cookie
		if(c==null)
			c=new Cookie(countname,Integer.toString(count));

		c.setComment("support Cookie counter demo Servlet");
		c.setMaxAge(2*24*60*60);  //2天
		c.setPath("/");  //设置一个路径，  只有在该路径下或其子目录下的URL才能看到该Cookie
		res.addCookie(c);
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		out.println("<html><head><title>Cookie counter</title>");
		out.println("</head><body bgcolor=#eeeeff>");
		out.println("<h1>Cookie Counter</h1>");

		if(hadcount)
		{

			out.println("<p><em><b>your session's counter was");
			out.println(count);
			out.println("before you visit this page.</b></em>");
			out.println("<p>the counter has been inremented.");  

		}
		else
		{
			out.println("<p>A new Cookie was created with an initial counter.");
			out.println("it's value is"+count+".");
		}

		if(hadcookie)
		{
			out.println("<p> You have these Cookies:<ol>");
			for(int i=0;i<Cookies.length;i++)
			{
				out.println("<li>name=");
				out.println(Cookies[i].getName());
				out.println(",value=");
				out.println(Cookies[i].getValue());
				out.println(",domain=");
				out.println(Cookies[i].getDomain());
				out.println(",path");
				out.println(Cookies[i].getPath());
			}
			out.println("</ol>");
		}
	}
}