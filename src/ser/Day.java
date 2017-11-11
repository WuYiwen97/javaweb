package ser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

/**
 * Servlet implementation class Day
 */
@WebServlet("/Day")
public class Day extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Day() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得一个向客户发送数据的输出流：
		response.setContentType("text/html;charset=UTF-8");//设置响应的MIME类型。
		PrintWriter out=response.getWriter();
		out.println("<HTML>"); 
		out.println("<BODY>");
		Calendar calendar=Calendar.getInstance(); //创建一个日历对象。
		calendar.setTime(new Date());//用当前时间初始化日历时间。
		int hour=calendar.get(Calendar.HOUR_OF_DAY),
				minute=calendar.get(Calendar.MINUTE),
				second=calendar.get(Calendar.SECOND);
		if(hour>=22){
			response.sendRedirect("Night");   //重定向。
		}
		else{
			out.print("当前时间是 :");
			out.print(hour+":"+minute+":"+second);            
		}
		out.println("</BODY>");
		out.println("</HTML>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
