package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.reply.RReplyDAO;
import model.reply.RReplyVO;

public class RReplyDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;
		request.setAttribute("mcnt", request.getParameter("mcnt"));
		
		RReplyDAO rrDAO = new RReplyDAO();
		RReplyVO rrVO = new RReplyVO();
		
		rrVO.setRrpk(Integer.parseInt(request.getParameter("rrpk")));
		rrVO.setRrmnum(Integer.parseInt(request.getParameter("rrmnum")));
		rrVO.setRrnum(Integer.parseInt(request.getParameter("rrnum")));

		if(rrDAO.delete(rrVO)) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("messageRead.do");
		}
		else {
			try {
				throw new Exception("DB 변경 오류 발생!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		
		return forward;
	}

}
