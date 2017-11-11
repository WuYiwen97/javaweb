// Import Servlet packages
package ser;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

// Import Java packages

public class SessionLifeCycleServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		String action = request.getParameter("action");

		if (action != null && action.equals("invalidate")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			out.println("<HTML>");
			out.println("<HEAD><TITLE>Session Life Cycle</TITLE></HEAD>");
			out.println("<BODY>");
			out.println("<P>Your session has been invalidated.</p>");
			//String lifeCycleURL = "/JavaWeb/servlet/SessionLifeCycleServlet";
			String lifeCycleURL = response.encodeURL("/JavaWeb/servlet/sessionLifeCyleServlet");
			out.println("<A HREF=\"" + lifeCycleURL + "?action=newSession\">");
			out.println("Create new session</a>");
			out.println("</BODY></HTML>");
		} else {
			HttpSession session = request.getSession();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			out.println("<HTML>");
			out.println("<META HTTP-EQUIV=\"Pragma\" CONTENT=\"no-cache\">");
			out.println("<HEAD><TITLE>Session Life Cycle</TITLE></HEAD>");
			out.println("<BODY BGCOLOR=\"#FFFFFF\">");
			out.println("<H1>Session Lifecycle</CENTER></H1>");
			out.print("<BR>Session Status: ");
			if (session.isNew()) {
				out.println("New Session.");
			} else {
				out.println("Old Session.");
			} 
			out.println("<BR>Session ID: ");
			out.println(session.getId());
			out.println("<BR>Creation Time: ");
			out.println(new Date(session.getCreationTime()));
			out.println("<BR>Last Accessed Time: ");
			out.println(new Date(session.getLastAccessedTime()));
			out.println("<BR>Maximum Inactive Interval (seconds): ");
			out.println(session.getMaxInactiveInterval());

			//String lifeCycleURL = "/session/servlet/lifeCycle";
			String lifeCycleURL = response.encodeURL("/JavaWeb/servlet/sessionLifeCyleServlet");
			out.print("<BR><A HREF=\"" + lifeCycleURL + "?action=invalidate\">");
			out.println("Invalidate the session</A></TD></TR>");
			out.print("<BR><A HREF=\"" + lifeCycleURL + "\">");
			out.println("Reload this page</A>");
			out.println("</BODY></HTML>");
			out.close();
		} 
	} 
}
