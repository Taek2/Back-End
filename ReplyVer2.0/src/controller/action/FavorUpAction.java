package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;


public class FavorUpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=new ActionForward();

		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		mVO.setMnum(Integer.parseInt(request.getParameter("mnum")));
		mDAO.favorUp(mVO);
		
		forward.setRedirect(false);
		forward.setPath("messageRead.do");
		
		return forward;
	}

}
