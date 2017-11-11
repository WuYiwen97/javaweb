package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

public class SimpleFilter extends HttpServlet implements Filter {
    private FilterConfig filterConfig;
    //Handle the passed-in FilterConfig
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    //Process the request/response pair
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) {
        try {
            if (filterConfig == null) {
                throw new ServletException(
                        "FilterConfig not set before first request");
            }
            filterConfig.getServletContext().log("in SimpleFilter");
            System.out.println("in SimpleFilter");
            filterChain.doFilter(request, response);
            filterConfig.getServletContext().log("Getting out of SimpleFilter");
            System.out.println("Getting out of SimpleFilter");
        } catch (ServletException sx) {
            filterConfig.getServletContext().log(sx.getMessage());
        } catch (IOException iox) {
            filterConfig.getServletContext().log(iox.getMessage());
        }
    }

    //Clean up resources
    public void destroy() {
    }
}
