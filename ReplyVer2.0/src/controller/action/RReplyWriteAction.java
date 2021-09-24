package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.reply.RReplyDAO;
import model.reply.RReplyVO;

public class RReplyWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;
		request.setAttribute("mcnt", request.getParameter("mcnt"));
		
		RReplyDAO rrDAO = new RReplyDAO();
		RReplyVO rrVO = new RReplyVO();
		
		rrVO.setRrnum(Integer.parseInt(request.getParameter("rrnum")));
		rrVO.setRrmember(Integer.parseInt(request.getParameter("rrmember")));
		rrVO.setRrmnum(Integer.parseInt(request.getParameter("rrmnum")));
		rrVO.setRrwriter(request.getParameter("rrwriter"));
		rrVO.setRrcontent(request.getParameter("rrcontent"));
		
		if(rrDAO.insert(rrVO)) {
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
