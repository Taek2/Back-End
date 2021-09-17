package controller.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.ActionForward;
import controller.action.FavorUpAction;
import controller.action.IndexAction;
import controller.action.JoinAction;
import controller.action.LoginAction;
import controller.action.MainAction;
import controller.action.MessageDeleteAction;
import controller.action.MessageEditAction;
import controller.action.MessageReadAction;
import controller.action.MessageUpdateAction;
import controller.action.MessageWriteAction;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}
	
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 사용자의 요청을 분석
		String uri=request.getRequestURI();
		String cp=request.getContextPath();
		String action=uri.substring(cp.length());
		System.out.println(action);
		ActionForward forward=null;
		
		// 2) 컨트롤러랑 매핑
		if(action.equals("/main.do")) {
			forward=new MainAction().execute(request, response);
		}
		else if(action.equals("/index.do")) {
			System.out.println("index.do 들어옴");
			forward=new IndexAction().execute(request, response);
		}
		else if(action.equals("/login.do")) {
			forward=new LoginAction().execute(request, response);
		}
		else if(action.equals("/join.do")) {
			forward=new JoinAction().execute(request, response);
		}
		else if(action.equals("/messageWrite.do")) {
			forward=new MessageWriteAction().execute(request, response);
		}
		else if(action.equals("/messageRead.do")) {
			forward=new MessageReadAction().execute(request, response);
		}
		else if(action.equals("/messageEdit.do")) {
			forward=new MessageEditAction().execute(request, response);
		}
		else if(action.equals("/messageUpdate.do")) {
			forward=new MessageUpdateAction().execute(request, response);
		}
		else if(action.equals("/messageDelete.do")) {
			forward=new MessageDeleteAction().execute(request, response);
		}
		else if(action.equals("/favorUp.do")) {
			forward=new FavorUpAction().execute(request, response);
		}
		else {
			// 에러페이지랑 연결
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/error/error404.jsp");
		}
		
		// 3) 사용자에게 결과 화면 출력
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}
			else {
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
