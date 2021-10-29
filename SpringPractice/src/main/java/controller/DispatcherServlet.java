package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.ActionForward;
import controller.action.JoinAction;
import controller.action.LoginAction;
import controller.action.MainAction;


/**
 * Servlet implementation class DispatcherServlet
 */
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// Ŭ���̾�Ʈ�� ��û������ ����
    	String uri=request.getRequestURI();
    	String cp=request.getContextPath();
    	String action=uri.substring(cp.length());
    	ActionForward forward=null;
    	
    	if(action.equals("/main.do")) {
    		forward=new MainAction().execute(request, response); 
    	}
    	else if(action.equals("/login.do")) {
    		forward=new LoginAction().execute(request, response);
    	}
    	else if(action.equals("/join.do")) {
    		forward=new JoinAction().execute(request, response);
    	}
    	else {
    		// ��û�� �߸� ������ ��,
    		// 1. ������ index.jsp�� �̵�
    		// 2. ����������
    		forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/error/error404.jsp");
    	}
    	
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
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// UTF-8, ���ڵ� ���� �ʿ�!
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doAction(request, response);
	}

}
