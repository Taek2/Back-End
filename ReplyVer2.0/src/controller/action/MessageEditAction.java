package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.message.MessageDAO;
import model.message.MessageVO;
import model.message.MsgSet;

public class MessageEditAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;

		HttpSession session=request.getSession();
		int memnum = (int)session.getAttribute("memnum");
		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		mVO.setMnum(Integer.parseInt(request.getParameter("mnum")));
		MsgSet data = mDAO.getDBData(mVO);
		
		if(data.getM().getMember() == memnum){
			request.setAttribute("data", data);
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("edit.jsp");
		}
		else{
			PrintWriter out=response.getWriter();
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); 
			out.println("<script charset='UTF-8'>alert('접근 권한이 없습니다!');history.go(-1);</script>");
		}
		
		return forward;
	}

}
