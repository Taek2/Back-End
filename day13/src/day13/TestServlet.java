package day13;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet(urlPatterns= {"/TestServlet","/abc"},initParams= {@WebInitParam(name="name1",value="ari"),@WebInitParam(name="name2",value="timo")})
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		out.println("<html><body>");
		out.println(getInitParameter("name1")+"<br>");
		out.println(getInitParameter("name2")+"<br>");
		out.println(getServletContext().getInitParameter("name3")+"<br>");
		out.println(getServletContext().getInitParameter("encoding")+"<br>");
		out.println("</body></html>");
	}

}
