package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;
import model.message.MsgSet;

public class MessageReadAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=new ActionForward();

		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		mVO.setMnum(Integer.parseInt(request.getParameter("mnum")));
		MsgSet data = mDAO.getDBData(mVO);
		request.setAttribute("data", data);
		request.setAttribute("mcnt", request.getParameter("mcnt"));
		
		forward.setRedirect(false);
		forward.setPath("read.jsp");
		
		return forward;
	}

}
