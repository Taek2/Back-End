package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.reply.ReplyDAO;
import model.reply.ReplyVO;

public class ReplyWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;
		
		request.setAttribute("mcnt", request.getParameter("mcnt"));
		
		ReplyDAO rDAO = new ReplyDAO();
		ReplyVO rVO = new ReplyVO();
		
		rVO.setRmember(Integer.parseInt(request.getParameter("rmember")));
		rVO.setRmnum(Integer.parseInt(request.getParameter("rmnum")));
		rVO.setRwriter(request.getParameter("rwriter"));
		rVO.setRcontent(request.getParameter("rcontent"));
		
		if(rDAO.insert(rVO)) {
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
